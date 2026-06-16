# Plan: Async media pipeline (raw upload + Cloud Run worker)

**Goal:** make check-in submit feel instant. Stop blocking the user on client-side
image processing and synchronous video transcode. Upload raw bytes straight to
R2, create the checkpoint immediately, and process media (resize, thumbnail,
HEIC→JPEG, video→MP4, cut video thumbnail) in a background Cloud Run worker
triggered by Pub/Sub.

**Decisions (locked):**
- Worker infra: **Pub/Sub push → a dedicated Cloud Run worker** (same image, `cmd/worker`).
- Images: **upload raw, worker does all processing** (zero client CPU).
- Ready signal: **optimistic + eventual** (local preview now; processed version
  appears on next feed/detail load). No realtime for v1.

---

## 1. Current bottleneck (why it feels slow)

- **Pick time** (`addFileArray` in `CreateCheckpointForm.tsx`): `prepareCheckpointImage`
  (`web/src/lib/image.ts`) decodes HEIC→JPEG + canvas-resizes to ≤3MB + cuts a
  640×360 thumbnail, per photo. HEIC decode is 1–3s × up to 3 photos on older iPhones.
- **Submit time** (`submit`): images PUT direct to R2 (fine), **but** the video does a
  synchronous round-trip — raw → Cloud Run → ffmpeg → keys back — *before* the create
  POST is enqueued. ffmpeg wait (2–8s) sits on the critical path.
- "Background submit" today only hides the final `POST /checkpoints`.

## 2. Target flow

```
Client: validate only (type / count / size / duration) — NO heavy processing
   │  optimistic preview = local objectURL (file already in hand, no CPU)
   ├─ PUT raw original → R2   (presigned, all media in parallel)
   ▼
POST /checkpoints { raw keys, explicit media_type }
   │   → insert checkpoint_images rows (thumbnail_key = NULL ⇒ pending)
   │   → returns immediately (XP + badges still synchronous here)
   └─ publish Pub/Sub { checkpoint_id, user_id } on topic checkpoint-media
        ▼
   Cloud Run WORKER  (push subscription, OIDC-authenticated)
     ├─ load this checkpoint's rows WHERE thumbnail_key IS NULL (by checkpoint_id)
     ├─ download object_key from R2 (raw bytes; new R2.GetObject)
     ├─ image → vipsthumbnail: HEIC/JPEG → JPEG, resize ≤2560 / ≤3MB, 640×360 thumb
     ├─ video → ffmpeg → MP4 (existing transcode.go params) + extract thumbnail
     ├─ validate size (authoritative), PUT processed bytes OVER the same object_key
     ├─ UPDATE row: thumbnail_key=thumb   ← setting thumbnail_key == "done" marker
     ├─ when no rows remain unprocessed: set checkpoints cover keys from first row
     ├─ dispatch Drive/Photos cloudsync here (guaranteed CPU — see §7)
     └─ ACK 200
```

Why a **push** subscription: it arrives as a real HTTP request, so Cloud Run
allocates CPU for the whole job. Today's `go s.sync(...)` goroutines in
`gdrive`/`gphotos` run *after* the response and can be CPU-throttled/killed on
Cloud Run unless "CPU always allocated" is set — this design fixes that too (§7).

## 3. Phasing

- **Phase 1 — Video async (biggest win, lowest risk).** Route video through the
  raw-upload + worker path; leave image processing on the client for now. Removes
  the synchronous ffmpeg round-trip. Stand up Pub/Sub + worker skeleton here.
- **Phase 2 — Images raw + async.** Move image processing to the worker; client
  becomes validate-only. Handle the HEIC "not displayable until processed" window.
- **Phase 3 (optional later).** Realtime ready signal via Firestore (reuse the
  comments Firestore setup) if the eventual-consistency window feels too long.

## 4. Schema — NO migration needed

`checkpoint_images` already has everything: `object_key`, nullable `thumbnail_key`,
`media_type`, `sort_order`. We reuse **`thumbnail_key IS NULL` as the implicit
"not yet processed" marker** — the worker sets `thumbnail_key` as its final step, which
atomically marks the row done. No `status` column, no `source_key`, no index, no
`cover_media_type`.

**Why each is unnecessary:**
- **No `status`** — `thumbnail_key IS NULL` ⇒ pending; non-null ⇒ done. New async rows
  start with `thumbnail_key = NULL`; existing (old-flow) rows already have it set, so
  they're correctly seen as done. The worker processes only null-thumbnail rows.
- **No `source_key`** — the worker reads `object_key` (raw bytes) and PUTs the processed
  result **back over the same `object_key`** (in-place). The column never changes.
  (Tradeoff: can't re-process from raw after success — acceptable.)
- **No partial index** — each submit publishes `checkpoint_id`; the worker loads that
  checkpoint's rows via the existing `idx_checkpoint_images_cp(checkpoint_id)`.
- **No `cover_media_type`** — `PrepareSlots` keeps forcing `.jpg`/`.mp4` keys, so once the
  worker finishes, the existing `image_key ILIKE '%.mp4'` cover inference is correct.
  Cover stays NULL while pending; per-image `media_type` (from 000024) is authoritative.

**Trade-off accepted (no explicit `failed`):** a permanently-failing item keeps
`thumbnail_key = NULL` and looks "still processing" forever (placeholder). Rely on the
Pub/Sub dead-letter topic + logs/alerts to catch these. If it becomes a real problem,
add a lightweight `failed` marker later — not needed for v1.

## 5. Backend (API) changes

- **`pkg/storage/r2.go`**: add `GetObject(ctx, key) (io.ReadCloser, contentType, error)`
  via a SigV4 GET (mirror the existing Upload signing). Worker needs to read raw.
- **`PrepareSlots`** (`service.go`): unchanged — keeps forcing `.jpg`/`.mp4` keys. Raw
  bytes (heic/mov/…) are PUT into those keys; the worker overwrites them in place. The
  thumbnail slot is no longer used by the client (worker makes the thumbnail), so it can
  be dropped from the response later — not required for correctness.
- **`validateMediaKeys`** (`service.go`): unchanged — `.jpg`/`.mp4` suffix + `checkpoints/`
  prefix + count limits still hold, because keys keep the forced extension.
- **Create** (`handler.go` / `service.go`): insert rows with `thumbnail_key = NULL` (the
  pending marker) and the explicit per-image `media_type` from the request; leave cover
  `image_key/thumbnail_key` NULL until the worker fills them. After commit, **publish**
  `{checkpoint_id, user_id}` to Pub/Sub.
- **Publisher**: new `pkg/pubsub` (wraps `cloud.google.com/go/pubsub`); nil-safe like the
  Redis/cloudsync wiring (no-op locally when `PUBSUB_TOPIC` unset → falls back to inline
  goroutine so local dev still works without GCP).
- **Read paths** (`GetDetail`, list queries, share): stop `COALESCE(thumbnail_key, object_key)`
  — return `thumbnail_url = null` when `thumbnail_key IS NULL`, plus a computed
  `pending` boolean (= `thumbnail_key IS NULL`) per image and at cover level. No new DB
  column — it's derived in the query/DTO. The client shows "đang xử lý" when `pending`.
- **Remove** the synchronous `POST /checkpoints/video` transcode endpoint added earlier
  (video now flows through slots + worker). Keep `transcode.go` — the worker reuses it.

## 6. Worker service (`cmd/worker`)

- **Entrypoint** `cmd/worker/main.go`: tiny HTTP server with `POST /internal/process`
  (Pub/Sub push target). Shares `internal/checkpoint` + `pkg/storage` + DB pool.
- **Push auth**: require an OIDC token from the push service account (verify audience);
  reject unauthenticated. Run service with `--no-allow-unauthenticated`.
- **Handler**:
  1. Parse Pub/Sub envelope → `checkpoint_id`.
  2. `SELECT id, object_key, media_type FROM checkpoint_images WHERE checkpoint_id=$1
     AND thumbnail_key IS NULL`. If none → ACK 200 (already done / duplicate delivery).
  3. Per row: `GetObject(object_key)` (raw bytes); image → `vipsthumbnail` (HEIC/JPEG→JPEG,
     resize ≤2560/≤3MB, 640×360 thumb); video → `transcodeToMP4` + `ffmpeg -ss` thumbnail.
     Enforce input/output size (authoritative — presigned PUT can't cap size).
  4. PUT processed bytes back over the same `object_key`; upload the thumbnail to a thumb
     key; `UPDATE` row → `thumbnail_key=thumb` (`object_key` unchanged). This commit is the
     "done" marker — it also makes a duplicate delivery skip the row in step 2.
  5. When no rows remain with `thumbnail_key IS NULL`: set cover (`image_key`,
     `thumbnail_key`) from the first row; dispatch cloudsync.
  6. Return 200. On transient error → 5xx (Pub/Sub retries, re-runs are safe because the
     row is still unprocessed); dead-letter after N attempts.
- **Image tooling**: add `vips-tools` (libvips, includes libheif) to the worker image —
  `vipsthumbnail` is fast + low-memory and auto-rotates via EXIF. ffmpeg already present.
- **Idempotency**: the `thumbnail_key IS NULL` filter skips done rows; re-runs are safe
  (in-place overwrite is deterministic). No status/claim column needed.

## 7. Cleanups this unlocks

- **Move `cloudsync` (Drive/Photos) into the worker**, after media is `ready`. It currently
  runs as post-response goroutines in the API (`gdrive/syncer.go`, `gphotos/syncer.go`) —
  vulnerable to Cloud Run CPU throttling and it syncs *pre-processed* URLs. The worker has
  guaranteed CPU and the final processed URLs.

## 8. Client changes

- **`web/src/lib/image.ts` / `video.ts`**: replace heavy `prepare*` with validate-only
  (mime/extension, count, byte size, video duration via cheap metadata load). Return the
  raw `File`. No HEIC decode, no canvas resize, no thumbnail.
- **`getUploadSlots` / `putFilesToSlots`** (`api.ts`): request raw-extension slots; PUT raw
  originals only (no thumbnail PUT). Drop `transcodeVideo`.
- **`submit`** (`CreateCheckpointForm.tsx`): one parallel PUT batch for all raw media →
  `POST /checkpoints` with raw keys + explicit `type`. No transcode round-trip.
- **Rendering**: `MediaPreview` already no-ops on missing url → shows placeholder. Add a
  light "đang xử lý" state when `pending` (i.e. `thumbnail_url == null`). The author keeps their local
  `objectURL` preview in the create flow; other viewers see the placeholder until the
  worker finishes (seconds). **HEIC caveat:** raw HEIC is not displayable in non-Safari
  browsers, so for pending images we show the placeholder rather than the raw key.

## 9. Infra / deploy

- **Pub/Sub**: topic `checkpoint-media`; push subscription → worker `/internal/process`
  with OIDC (push SA); ack deadline ~120s (transcode); dead-letter topic + max attempts ~5.
- **Worker Cloud Run** `checkpoint-worker`: same image, container command `/worker`;
  `--no-allow-unauthenticated` + grant `roles/run.invoker` to the Pub/Sub push SA;
  concurrency low (ffmpeg is CPU-heavy, e.g. 2–4), CPU 1–2, mem 512Mi–1Gi, timeout 300s,
  min-instances 0.
- **API SA** gets `roles/pubsub.publisher`. Add `PUBSUB_TOPIC` env to the API.
- **Dockerfile**: build both `cmd/server` and `cmd/worker`; add `vips-tools` to the
  runtime stage (alpine already has ffmpeg).
- **CI** (`.github/workflows/deploy.yml`): deploy both services (no DB migration needed).

## 10. Risks & mitigations

| Risk | Mitigation |
| --- | --- |
| Raw upload = more bytes (esp. video 10–60MB, raw photos) | Already uploaded raw video to backend before; net win is removing the sync ffmpeg wait. Keep client size caps. Revisit hybrid client-thumbnail if HEIC window feels bad. |
| HEIC not displayable until processed (other viewers) | Show "đang xử lý" placeholder for `pending`; keep worker latency low (push + warm). Author sees local preview. |
| Presigned PUT can't enforce size | Worker validates input/output size authoritatively; marks `failed` + cleans up. Optionally switch to presigned POST policy with content-length-range later. |
| Pub/Sub at-least-once → double processing | `thumbnail_key IS NULL` filter skips already-done rows; a duplicate that overlaps an in-flight run may re-encode (last-write-wins, slight quality loss) — rare at this volume, acceptable. |
| Permanently-failing item stuck looking "pending" | No explicit `failed` state in v1; dead-letter topic + logs catch it. Add a marker later only if needed. |
| Cover media_type inferred from extension | Keys keep forced `.jpg`/`.mp4`; worker overwrites in place, so inference is correct once `ready`. Cover NULL while pending. |
| Lost Pub/Sub message → rows stuck `pending` | Dead-letter topic + alert. (Optional later: a sweeper that re-publishes checkpoints with stale `pending` rows.) |
| Background goroutines killed on Cloud Run | Worker (push request) has guaranteed CPU; move cloudsync into it. |
| Local dev without GCP | Pub/Sub publisher nil-safe → fall back to inline goroutine processing when `PUBSUB_TOPIC` unset. |

## 11. Acceptance

- Submit returns < ~1s after raw PUTs complete (no client decode, no sync transcode).
- A new checkpoint's images/video appear processed within seconds (feed/detail reload).
- Pending media (`thumbnail_key IS NULL`) shows "đang xử lý"; becomes the processed
  version once the worker sets `thumbnail_key`.
- Transient failures retry via Pub/Sub; persistent failures land in the dead-letter topic.
- No regression to XP/badge (still returned by the synchronous create).
```
