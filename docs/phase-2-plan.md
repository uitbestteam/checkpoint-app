# Phase 2 — Checkpoint Core (Plan)

> Goal: user **check-in một địa điểm bằng GPS**, thêm ảnh + note + rating, và **nhìn thấy
> các checkpoint hiện lên bản đồ thật**. Đây là core của app.
> Roadmap: [../CHECKPOINT.md](../CHECKPOINT.md) · trạng thái: [STATUS.md](STATUS.md)

## Quyết định đã chốt
- **Map:** MapLibre GL JS + tiles **OpenFreeMap** (không token, miễn phí) → giữ $0.
- **Data fetching FE:** TanStack Query (cache theo viewport + invalidate khi tạo mới).

## Go patterns sẽ luyện (mục tiêu học)
- **PostGIS**: `GEOGRAPHY(Point)`, GIST index, `ST_DWithin` (nearby), `ST_MakeEnvelope`/`&&` (bbox theo viewport).
- **Transaction**: tạo checkpoint + cộng XP **atomic** (`pgx.Tx`, commit/rollback, helper `withTx`).
- **`SELECT ... FOR UPDATE`**: khóa row user khi cộng XP để tránh race khi check-in liên tục.
- **Multipart upload pipeline**: nhiều ảnh → R2 (tái dùng `pkg/storage`).

---

## 1. Database (migration `0004_checkpoints`)

```sql
CREATE TABLE checkpoints (
  id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id    UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name       TEXT NOT NULL,
  category   TEXT NOT NULL DEFAULT 'other',     -- cafe | food | view | nature | ...
  note       TEXT,
  rating     SMALLINT CHECK (rating BETWEEN 1 AND 5),
  lat        DOUBLE PRECISION NOT NULL,
  lng        DOUBLE PRECISION NOT NULL,
  -- geography tự sinh từ lng/lat → đọc dùng lat/lng, query không gian dùng location
  location   GEOGRAPHY(Point,4326)
             GENERATED ALWAYS AS (ST_SetSRID(ST_MakePoint(lng, lat), 4326)::geography) STORED,
  address    TEXT,
  xp_awarded INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  deleted_at TIMESTAMPTZ
);
CREATE INDEX idx_checkpoints_location ON checkpoints USING GIST (location);
CREATE INDEX idx_checkpoints_user    ON checkpoints(user_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_checkpoints_created ON checkpoints(created_at DESC);

CREATE TABLE checkpoint_images (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  checkpoint_id UUID NOT NULL REFERENCES checkpoints(id) ON DELETE CASCADE,
  url           TEXT NOT NULL,
  sort_order    INT NOT NULL DEFAULT 0,
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_checkpoint_images_cp ON checkpoint_images(checkpoint_id);
```

> Mẹo: `location` là **generated column** → chỉ ghi `lat/lng`, geography tự có, đọc lại không
> cần thư viện scan geometry. Query không gian vẫn chạy trên `location` + GIST index.

XP: `+10 XP` / check-in (hằng số config). `level = levelForXP(total_xp)` — hàm thuần, table-driven, test riêng.

---

## 2. Backend — domain `internal/checkpoint/`

Cấu trúc giống `identity`: `model.go · repository.go · service.go · handler.go` (+ `doc.go`).

### Endpoints
```
POST   /checkpoints                 [auth]        tạo check-in (+XP)
GET    /checkpoints?bbox=...&limit   [auth]        ⭐ cho MAP: trong viewport
GET    /checkpoints/nearby?lat&lng&radius_m [auth] quanh 1 điểm (ST_DWithin)
GET    /checkpoints/me?limit&cursor  [auth]        danh sách của tôi (paginate)
GET    /checkpoints/{id}             [auth]        chi tiết (+ images + author)
POST   /checkpoints/{id}/images      [auth, owner] upload nhiều ảnh → R2
DELETE /checkpoints/{id}             [auth, owner] soft delete
```

### Contracts (rút gọn)
```jsonc
// POST /checkpoints
req: { "name","category","note?","rating?","lat","lng","address?" }
res 201: { "checkpoint": {...}, "xp_awarded": 10, "total_xp": 1260, "level": 24 }

// GET /checkpoints?bbox=minLng,minLat,maxLng,maxLat&limit=200
res: { "checkpoints": [ { "id","name","category","lat","lng","rating","thumbnail_url" } ] }

// GET /checkpoints/{id}
res: { "checkpoint": {...}, "images": [{url,sort_order}], "author": {username,display_name,avatar_url} }
```

### Spatial SQL (điểm cốt lõi)
```sql
-- bbox cho map (dùng GIST qua toán tử &&)
SELECT id,name,category,lat,lng,rating FROM checkpoints
WHERE deleted_at IS NULL
  AND location && ST_MakeEnvelope($1,$2,$3,$4,4326)::geography
ORDER BY created_at DESC LIMIT $5;

-- nearby
SELECT ... FROM checkpoints
WHERE deleted_at IS NULL
  AND ST_DWithin(location, ST_MakePoint($1,$2)::geography, $3);  -- $3 = mét
```

### Create + XP (transaction + SELECT FOR UPDATE)
```
BEGIN
  INSERT INTO checkpoints (...) RETURNING ...
  SELECT total_xp FROM users WHERE id=$ FOR UPDATE          -- khóa row
  newXP   = total_xp + 10
  newLvl  = levelForXP(newXP)
  UPDATE users SET total_xp=newXP, level=newLvl,
                   checkpoint_count = checkpoint_count + 1, updated_at=NOW()
COMMIT
```
→ Nếu lỗi giữa chừng thì rollback, không bị "tạo checkpoint nhưng không cộng XP".

---

## 3. Frontend — map + check-in

### Deps mới
`maplibre-gl`, `react-map-gl` (wrapper), `@tanstack/react-query`.

### Hạ tầng
- `QueryClientProvider` bọc App (trong `main.tsx`).
- `lib/api.ts`: thêm types + hàm `createCheckpoint`, `getCheckpointsInBounds(bbox)`, `getCheckpoint(id)`, `getMyCheckpoints()`, `uploadCheckpointImages(id, files)`.
- `lib/maps.ts`: style URL `https://tiles.openfreemap.org/styles/liberty` (không key).

### Màn hình
- **MapPage** (thay faux map):
  - `<Map>` MapLibre, center theo GPS user (geolocation), `GeolocateControl`.
  - `onMoveEnd` (debounce ~300ms) → lấy `map.getBounds()` → query `['checkpoints', bbox]` (TanStack Query).
  - Render markers = pin cam + icon theo `category`; tap marker → mở **detail sheet**.
  - Nút **CHECK-IN** (đã có UI) → lấy GPS hiện tại → mở **Create sheet**.
- **Create check-in** (nâng cấp CreatePage → dùng được trên map):
  - form: name, category (chips), note, rating (sao), ảnh (multi). lat/lng = GPS (hoặc kéo pin).
  - submit → `createCheckpoint` → `uploadCheckpointImages` → `queryClient.invalidateQueries(['checkpoints'])` → marker mới hiện ngay + toast `+10 XP`.
- **Checkpoint detail** (bottom sheet): ảnh (carousel), note, rating, author, thời gian, XP.
- **Profile**: thay `ImagePlaceholder` "Khoảnh khắc" bằng `getMyCheckpoints()`; số liệu lấy từ `user` (đã có).

---

## 4. Thứ tự thực thi (mỗi mốc ship được)

| Mốc | Nội dung | Patterns |
|-----|----------|----------|
| **M1** ✅ | BE: migration 0004 + domain checkpoint CRUD + **XP transaction** + tests (levelForXP, service mock) | transaction, FOR UPDATE |
| **M2** ✅ | BE: spatial endpoints `?bbox` + `/nearby` + GIST | PostGIS |
| **M3** ✅ | BE: upload ảnh checkpoint → R2 | multipart pipeline |
| **M4** ✅ | FE: MapLibre + TanStack Query, **render checkpoints (read-only)** | — |
| **M5** ✅ | FE: CHECK-IN bằng GPS → tạo thật end-to-end + toast XP | — |
| **M6** ✅ | FE: checkpoint detail sheet + ảnh | — |
| **M7** ✅ | FE: my checkpoints + nối Profile | — |
| **M8** ⏳ | Polish: tab Create = **trang full check-in GPS** ✅ (form/permission tách content↔Sheet, success → về Map); Map giữ sheet. Còn marker đẹp hơn, optimistic, test, deploy | — |

Phase 2 **feature-complete (M1–M7)** — M8 đang làm dần (tab Create đã wire). "Cắm cờ theo địa điểm" để Phase 4.

## 5. Test
- **BE:** `levelForXP` (table-driven), service create (mock repo) — verify cộng XP & level; (tùy chọn) repo integration test với DB thật cho spatial.
- **FE:** smoke cho map render + create flow.

## 6. File dự kiến thêm/sửa
- BE: `migrations/0004_*.sql`, `internal/checkpoint/*`, wire vào `cmd/server/main.go`, helper `withTx` (pkg mới `pkg/db` hoặc trong repository).
- FE: `lib/maps.ts`, mở rộng `lib/api.ts`, `pages/MapPage.tsx` (viết lại), `CreatePage`/`CreateSheet`, `components/CheckpointDetail.tsx`, `components/CheckpointMarker.tsx`, `main.tsx` (QueryClient).

## 7. Rủi ro / lưu ý
- **pgx + PostGIS:** dùng generated column nên không cần scan geometry — tránh được rắc rối lớn nhất.
- **Quyền sở hữu:** endpoints sửa/xóa/upload phải check `checkpoint.user_id == caller`.
- **GPS trên web:** cần HTTPS (localhost ok) + xin quyền `navigator.geolocation`.
- **OpenFreeMap:** miễn phí, không SLA — nếu cần ổn định hơn sau này đổi sang MapTiler/Mapbox (chỉ thay style URL).
