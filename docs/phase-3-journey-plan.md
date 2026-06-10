# Phase 3 — Journey: Implementation Plan

> Gom các check-in thành **hành trình (Journey)**: tạo journey, timeline, journey map
> (polyline), stats (số check-in, tổng XP, tổng km), và (optional) share card OG.
> Tổng quan: [STATUS.md](STATUS.md) · roadmap: [../CHECKPOINT.md](../CHECKPOINT.md)

## Bối cảnh code
- `checkpoints` đã có `place_id`, location GEOGRAPHY, XP atomic. Thêm `journey_id` optional.
- `users.journey_count` đã có sẵn (denormalized) — sẽ tăng/giảm khi tạo/xóa journey.
- Pattern domain quen thuộc: `internal/<domain>/{model,repository,service,handler}`.

## Quyết định thiết kế
- **Journey = bộ sưu tập check-in của 1 user** (1 chuyến đi). `checkpoints.journey_id` (nullable FK).
- **Gán check-in vào journey** theo "active journey": user "bắt đầu hành trình" → check-in tiếp theo tự gắn `journey_id` = journey đang active; hoặc gán/bỏ thủ công sau.
- **Stats tính on-the-fly** bằng aggregation (không denormalize sớm): count, sum XP, **distance bằng PostGIS** `ST_MakeLine(... ORDER BY created_at)` → `ST_Length(::geography)`.
- Journey map = trả list toạ độ đã sắp theo thời gian cho FE vẽ polyline + markers.

## Go patterns luyện
Complex JOIN/**aggregation** · PostGIS `ST_MakeLine`/`ST_Length` (độ dài đường đi) · aggregate `ORDER BY` trong hàm · (optional) **background worker** sinh share card.

---

## J1 — BE: bảng journeys + CRUD + gán check-in ✅

**Migration `0007_journeys`:**
```sql
CREATE TABLE journeys (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title       TEXT NOT NULL,
  description TEXT,
  cover_key   TEXT,                      -- R2 object key (optional)
  is_active   BOOLEAN NOT NULL DEFAULT false,  -- "đang đi"
  started_at  TIMESTAMPTZ,
  ended_at    TIMESTAMPTZ,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at  TIMESTAMPTZ
);
CREATE INDEX idx_journeys_user ON journeys(user_id) WHERE deleted_at IS NULL;
-- chỉ 1 journey active mỗi user
CREATE UNIQUE INDEX idx_journeys_one_active ON journeys(user_id) WHERE is_active AND deleted_at IS NULL;

ALTER TABLE checkpoints ADD COLUMN journey_id UUID REFERENCES journeys(id);
CREATE INDEX idx_checkpoints_journey ON checkpoints(journey_id);
```

**`internal/journey/`:** model/repository/service/handler/doc.
```
POST   /journeys                 tạo (title, desc?) [auth]
GET    /journeys/me              danh sách của tôi [auth]
GET    /journeys/{id}            detail (J2) [auth]
PATCH  /journeys/{id}            sửa title/desc/is_active/ended_at [auth, owner]
DELETE /journeys/{id}            soft delete [auth, owner]
POST   /journeys/{id}/checkpoints/{cpId}   gán 1 check-in vào journey [auth, owner]
```
- Tạo/xóa journey → `users.journey_count ± 1` (trong tx).
- "Active": PATCH `is_active=true` → unique index đảm bảo 1 active; check-in mới gắn vào active journey (sửa `checkpoint.Create`: nếu `JourneyID==nil`, lookup active journey của user → gán).
- Check-in nhận `journey_id` optional (như `place_id`).

**Acceptance:** tạo journey, set active, check-in vài lần → tất cả có `journey_id`. `go test` xanh.

---

## J2 — BE: journey detail (timeline + map + stats) ✅

`GET /journeys/{id}` →
```jsonc
{
  "journey": {...},
  "stats": { "checkpoint_count": 8, "total_xp": 80, "distance_km": 12.4 },
  "checkpoints": [ { id, name, category, lat, lng, created_at, place_id } ]  // timeline + map (đã sort theo created_at)
}
```
Stats SQL:
```sql
SELECT COUNT(*) AS cp_count,
       COALESCE(SUM(xp_awarded),0) AS total_xp,
       COALESCE(ST_Length(ST_MakeLine(location::geometry ORDER BY created_at)::geography)/1000, 0) AS distance_km
FROM checkpoints WHERE journey_id = $1 AND deleted_at IS NULL;
```
Timeline = `SELECT ... ORDER BY created_at`. FE dùng cùng list này cho **timeline** lẫn **polyline trên map**.

**Acceptance:** detail trả stats đúng (km > 0 khi ≥2 điểm), timeline đúng thứ tự.

---

## J3 — FE: Journey list + detail ✅

- `lib/api.ts`: types Journey/JourneyDetail + `getMyJourneys`, `getJourney(id)`, `createJourney`, `updateJourney`, `assignCheckpoint`.
- **Profile → tab "Lịch trình"**: list journey (card: cover, title, count/km/XP).
- **JourneyDetailSheet/Page**: header stats + **map MapLibre** (polyline nối các checkpoint + markers) + **timeline** (list check-in theo thời gian, tap mở CheckpointDetailSheet). Tái dùng `react-map-gl` (đã có ở MapPage — cân nhắc tách `MiniMap` component dùng chung).

**Acceptance:** mở 1 journey thấy đường đi trên map + timeline + km/XP.

---

## J4 — FE: tạo journey + gắn check-in ✅

- Nút "Bắt đầu hành trình" (Profile/Map) → tạo journey + set active → banner "Đang đi: <title>".
- Check-in trong lúc active → tự gắn (BE lo). Có nút "Kết thúc hành trình" (PATCH is_active=false, ended_at=now).
- (Tùy chọn) journey picker trong `CreateCheckpointForm` để gán thủ công.

**Acceptance:** bắt đầu journey → check-in → kết thúc → journey detail có đủ điểm.

---

## J5 — (Optional) Share card / OG

- Public route `GET /share/journey/{id}` trả **HTML có OG meta** (`og:title/description/image`) cho crawler.
- Ảnh card: **background worker** vẽ stats lên template (Go `image/draw` như cách sinh PWA icon) → lưu R2 → `journeys.cover`/share key; hoặc dùng cover ảnh. → luyện worker pool / async.
- FE: nút "Chia sẻ Hộ chiếu/Hành trình" → copy link `/share/journey/{id}`.

**Acceptance:** dán link vào chat/social → hiện preview card. (Có thể để cuối, sau J1–J4.)

---

## Thứ tự
`J1 → J2 → J3 → J4` (BE rồi FE). `J5` optional, làm sau cùng.

## File dự kiến
- BE: `migrations/0007_*`, `internal/journey/*`, sửa `checkpoint/{model,repository,service,handler}.go` (journey_id + active lookup), `cmd/server/main.go`.
- FE: mở rộng `lib/api.ts`, Profile tab "Lịch trình", `components/JourneyDetail*.tsx`, `components/MiniMap.tsx` (tách dùng chung), journey controls.

## Rủi ro / lưu ý
- **Sửa tx check-in lần nữa** (thêm active-journey lookup) — test kỹ, đừng vỡ XP/place atomic.
- `ST_MakeLine` cần ≥2 điểm; 0–1 điểm → distance 0 (đã COALESCE).
- Unique active index: PATCH active phải bỏ active cũ trước (hoặc trong tx) để không vướng constraint.

---

## Các phase còn lại (sau Journey)
- **Phase 5 — Gamification:** leaderboard (top traveler), badges/achievements, digital passport hoàn chỉnh, level perks. FE đã có mockup passport/badge.
- **Phase 6 — AI Plan:** Gemini trip planner (input địa điểm/ngày/style → itinerary), SSE streaming, worker pool, singleflight dedup prompt. FE có AIPlanPage mockup.
- **Phase 7 — Polish:** rate limiting (token bucket), image resize trước khi lưu R2, Sentry, monitoring, OpenTelemetry, API docs.
