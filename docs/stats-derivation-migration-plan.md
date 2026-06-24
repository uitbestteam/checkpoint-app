# Stats Derivation — Worker Migration Plan

> Move ALL derived stat updates (XP, level, counts, streaks, badges) out of the
> API hot path into the background worker via **Pub/Sub**. No triggers, no polling.

## Current State

Every create/delete carries **6–8 extra UPDATE/INSERT** in the critical path:

| Operation | Extra statements in transaction |
|-----------|--------------------------------|
| **Checkpoint create** | `UPDATE total_xp` + `UPDATE level` + `UPDATE checkpoint_count` + `UPDATE streak` + `INSERT xp_event` + `EVALUATE badge` + `UPDATE journey stats` |
| **Checkpoint delete** | `UPDATE total_xp` + `UPDATE level` + `UPDATE checkpoint_count` + `INSERT xp_event` + `UPDATE journey stats` |
| **Journey create** | `UPDATE journey_count` |
| **Journey delete** | `UPDATE journey_count` (+ N × XP reversal if hard-delete) |

**Root cause:** 1 INSERT → 8 DB roundtrips before the API can respond.

## Approach

1. API does **only the core mutation** + **publishes a Pub/Sub message**
2. The **existing worker** (already has Pub/Sub push infrastructure) picks it up
3. Worker applies all derived stat updates in its own transaction
4. Client uses **optimistic update** for immediate UI

**Why Pub/Sub, not polling:**
- The worker already has `cmd/worker/main.go` with Pub/Sub push + `pkg/pubsub`
- No new table, no polling loop, no `SKIP LOCKED` gymnastics
- Pub/Sub handles retries, backoff, dead-letter natively
- Same topic/binary — just one more job type

---

## Phase 1 — New Pub/Sub job type

### 1a. `pkg/pubsub/publisher.go` — add stats job

```go
const JobTypeProcessStats = "process_stats"

type ProcessStatsJob struct {
    EventType  string `json:"event_type"`
    // checkpoint_created | checkpoint_deleted | journey_created | journey_deleted
    UserID     string `json:"user_id"`
    RefID      string `json:"ref_id"`      // checkpoint_id or journey_id
    XPAwarded  int    `json:"xp_awarded,omitempty"`
    JourneyID  string `json:"journey_id,omitempty"`
    // For journey hard-delete: list of checkpoint xp values
    CheckpointXPs []int  `json:"checkpoint_xps,omitempty"`
}
```

**Update `JobEnvelope`:**
```go
type JobEnvelope struct {
    Type              string           `json:"type"`
    ProcessCheckpoint *MediaJob        `json:"process_checkpoint,omitempty"`
    MediaCleanup      *MediaCleanupJob `json:"media_cleanup,omitempty"`
    ProcessStats      *ProcessStatsJob `json:"process_stats,omitempty"`  // NEW
}
```

### 1b. Publish helper

```go
func (p *Publisher) PublishStats(ctx context.Context, job ProcessStatsJob) error {
    if p == nil {
        return ErrDisabled
    }
    payload, err := json.Marshal(JobEnvelope{
        Type:         JobTypeProcessStats,
        ProcessStats: &job,
    })
    if err != nil {
        return fmt.Errorf("marshal stats job: %w", err)
    }
    return p.publish(ctx, payload)
}
```

---

## Phase 2 — API: Strip side effects

### 2a. Checkpoint create — only INSERT + publish

**Before** (8 DB calls):
```go
tx, _ := pool.Begin(ctx)
cp, _ := repo.Insert(ctx, tx, input)
gamification.AwardXPTx(ctx, tx, userID, 10, cp.ID)
gamification.EvaluateBadgesTx(ctx, tx, userID)
// ... streak, counts, xp_event ...
tx.Commit(ctx)
return cp, xpAwarded, level, badges
```

**After** (1 DB call + 1 Pub/Sub publish):
```go
cp, _ := repo.Create(ctx, input)
pubsub.PublishStats(ctx, ProcessStatsJob{
    EventType: "checkpoint_created",
    UserID:    userID,
    RefID:     cp.ID,
    XPAwarded: 10,
    JourneyID: cp.JourneyID,
})
return cp  // no stats returned — client optimistically updates
```

### 2b. Checkpoint delete — only DELETE + publish

```go
cp, _ := repo.Delete(ctx, id, userID)
pubsub.PublishStats(ctx, ProcessStatsJob{
    EventType: "checkpoint_deleted",
    UserID:    userID,
    RefID:     id,
    XPAwarded: cp.XPAwarded,
    JourneyID: cp.JourneyID,
})
```

### 2c. Journey create/delete — only INSERT/UPDATE + publish

```go
// Create
j, _ := journeyRepo.Create(ctx, input)
pubsub.PublishStats(ctx, ProcessStatsJob{
    EventType: "journey_created", UserID: userID, RefID: j.ID,
})

// Delete
journeyRepo.Delete(ctx, id, userID)
pubsub.PublishStats(ctx, ProcessStatsJob{
    EventType: "journey_deleted", UserID: userID, RefID: id,
    // For hard-delete mode, include checkpoint XP values
    CheckpointXPs: deletedCheckpointXPs,
})
```

---

## Phase 3 — Worker: Handle `process_stats`

### 3a. `internal/stats/worker.go` — new package

```go
package stats

type Worker struct {
    pool *pgxpool.Pool
}

func New(pool *pgxpool.Pool) *Worker { return &Worker{pool: pool} }

func (w *Worker) Process(ctx context.Context, job ProcessStatsJob) error {
    tx, _ := w.pool.Begin(ctx)
    defer tx.Rollback(ctx)

    switch job.EventType {
    case "checkpoint_created":
        if err := w.applyCheckpointCreated(ctx, tx, job); err != nil {
            return err
        }
    case "checkpoint_deleted":
        if err := w.applyCheckpointDeleted(ctx, tx, job); err != nil {
            return err
        }
    case "journey_created":
        w.applyJourneyCreated(ctx, tx, job)
    case "journey_deleted":
        w.applyJourneyDeleted(ctx, tx, job)
    }

    return tx.Commit(ctx)
}
```

### 3b. Stat application: `checkpoint_created`

```go
func (w *Worker) applyCheckpointCreated(ctx context.Context, tx pgx.Tx, job ProcessStatsJob) error {
    // (1) Award XP + recompute level
    tx.Exec(ctx, `
        UPDATE users SET total_xp = GREATEST(total_xp + $2, 0),
            level = LEAST(FLOOR(SQRT(GREATEST(total_xp + $2, 0)/100.0))::int+1, 50),
            updated_at = NOW()
        WHERE id = $1
    `, job.UserID, job.XPAwarded)

    // (2) Bump checkpoint_count
    tx.Exec(ctx, `UPDATE users SET checkpoint_count = checkpoint_count + 1,
        updated_at = NOW() WHERE id = $1`, job.UserID)

    // (3) Update streak
    tx.Exec(ctx, `
        UPDATE users SET checkin_streak = CASE
            WHEN last_checkin_date = CURRENT_DATE                   THEN checkin_streak
            WHEN last_checkin_date = CURRENT_DATE - INTERVAL '1 day' THEN checkin_streak + 1
            ELSE 1 END,
            last_checkin_date = CURRENT_DATE, updated_at = NOW()
        WHERE id = $1
    `, job.UserID)

    // (4) Log XP event
    tx.Exec(ctx, `INSERT INTO xp_events (user_id, type, xp, ref_id)
        VALUES ($1, 'checkin', $2, $3)`, job.UserID, job.XPAwarded, job.RefID)

    // (5) Evaluate badges
    awardBadges(ctx, tx, job.UserID)

    // (6) Bump journey stats if attached
    if job.JourneyID != "" {
        tx.Exec(ctx, `UPDATE journeys SET checkpoint_count = checkpoint_count + 1,
            total_xp = total_xp + $2 WHERE id = $1`, job.JourneyID, job.XPAwarded)
    }
    return nil
}
```

### 3c. `cmd/worker/main.go` — wire new handler

```go
case pubsub.JobTypeProcessStats:
    if envelope.ProcessStats == nil {
        return invalidJobError{err: errors.New("missing stats job")}
    }
    statsWorker := stats.New(pool)
    return statsWorker.Process(ctx, *envelope.ProcessStats)
```

No new service, no new port, no polling — just one more `case` in the
existing `dispatchJob()` switch.

---

## Phase 4 — Client: Optimistic update

After `createCheckpoint()` returns 200, immediately patch React Query cache:

```ts
// web/src/context/CheckinQueue.tsx

queryClient.setQueryData<User>(["me"], (prev) => {
    if (!prev) return prev;
    const newXP = prev.total_xp + res.xp_awarded;
    return {
        ...prev,
        total_xp: newXP,
        checkpoint_count: prev.checkpoint_count + 1,
        level: levelForXP(newXP),
    };
});
```

Worker catches up within seconds; `invalidateQueries(["me"])` corrects any
discrepancy.

---

## Files to Change

| # | File | Action |
|---|------|--------|
| 1 | `pkg/pubsub/publisher.go` | Add `JobTypeProcessStats`, `ProcessStatsJob`, `PublishStats()` |
| 2 | `internal/stats/worker.go` | **New** — `Process()` + `applyCheckpointCreated/Deleted` |
| 3 | `cmd/worker/main.go` | Add `case JobTypeProcessStats` in `dispatchJob()` |
| 4 | `internal/checkpoint/repository.go` | Strip UPDATE/INSERT side effects from Create & Delete |
| 5 | `internal/checkpoint/service.go` | Remove gamification calls, add `pubsub.PublishStats` |
| 6 | `internal/journey/repository.go` | Strip `journey_count` bumps |
| 7 | `internal/gamification/repository.go` | Remove `AwardXPTx`, `ReverseCheckinDeletesTx`, `EvaluateBadgesTx` |
| 8 | `web/src/context/CheckinQueue.tsx` | Add optimistic XP/level update |

---

## Trade-offs

| Concern | Answer |
|---------|--------|
| **Stats delay** | 1–3s (Pub/Sub delivery + worker processing) |
| **Data loss** | Pub/Sub at-least-once + dead-letter. Dedup via idempotent SQL |
| **API latency** | 8 DB calls → 1 DB call + 1 Pub/Sub publish (~60% faster) |
| **Complexity** | Low — same worker binary, one new job type, one new package |
| **Infrastructure** | Zero new infra — reuses existing Pub/Sub topic + worker |
| **Client impact** | Optimistic update covers the 1-3s window |

## Execution Order

```
1. pkg/pubsub: add ProcessStatsJob + PublishStats
2. internal/stats: new package with Process()
3. cmd/worker: wire JobTypeProcessStats case
4. internal/checkpoint: strip side effects, add Pub/Sub publish
5. internal/journey: strip journey_count bumps
6. internal/gamification: remove AwardXP/ReverseXP/EvaluateBadges
7. client: optimistic XP update (independent, can deploy anytime)
```
