# Phase 4 — Discovery: Implementation Plan

> Khám phá **địa điểm (Place)** từ data cộng đồng: search · nearby · place detail · discover
> feed · popular. Kèm **place-based check-in** (hoàn thiện tab Create) và **auth refinement**
> (Google redirect + gộp anonymous).
> Tổng quan: [STATUS.md](STATUS.md) · roadmap: [../CHECKPOINT.md](../CHECKPOINT.md)

## Bối cảnh code hiện tại (đã khảo sát)
- `checkpoint.repository.Create` chạy **transaction** (insert checkpoint → lock user → cộng XP). Place resolution sẽ thêm **vào chính tx này** để atomic.
- `checkpoint.Service` đã có **geocoder** (Nominatim) → khi tạo place mới, **tái dùng `address` đã geocode**, không gọi lại.
- Ảnh lưu **object key**; repo prepend `R2_PUBLIC_URL` lúc đọc → place detail (ảnh) cần `mediaBase` y như checkpoint repo.
- Migration kế tiếp: **0006**. `golang.org/x/sync` đã có sẵn (dùng `singleflight`).

---

## Quyết định thiết kế
- **Place = địa điểm canonical**; mỗi checkpoint gắn `place_id`. Check-in **tự match** place gần
  (~75m) + tên giống (pg_trgm) hoặc **tạo mới**.
- **Resolution chạy trong tx của checkpoint** (atomic với XP). Đặt ở package `place` qua hàm
  `ResolveInTx(ctx, tx, params)`; `checkpoint` import `place` (một chiều, không cycle).
- Place **kế thừa** name/category/lat/lng/address từ checkpoint đầu tiên tạo nó.
- Check-in có thể gửi **`place_id` tùy chọn** (place-based, từ màn Place detail) → bỏ qua resolution.

---

## D1 — BE: bảng Place + resolution trong check-in ✅

**Migration `0006_places`:**
```sql
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE TABLE places (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL, category TEXT NOT NULL DEFAULT 'other',
  lat DOUBLE PRECISION NOT NULL, lng DOUBLE PRECISION NOT NULL,
  location GEOGRAPHY(Point,4326) GENERATED ALWAYS AS (ST_SetSRID(ST_MakePoint(lng,lat),4326)::geography) STORED,
  address TEXT, checkin_count INT NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_places_location ON places USING GIST (location);
CREATE INDEX idx_places_name_trgm ON places USING GIN (name gin_trgm_ops);
CREATE INDEX idx_places_checkin_count ON places (checkin_count DESC);
ALTER TABLE checkpoints ADD COLUMN place_id UUID REFERENCES places(id);
CREATE INDEX idx_checkpoints_place ON checkpoints(place_id);
```

**Package mới `internal/place/`:** `model.go · repository.go · service.go · handler.go · doc.go`.

**`place.Repository.ResolveInTx(ctx, tx, ResolveParams) (placeID string, err error)`** — match-or-create:
```sql
-- match
SELECT id FROM places
WHERE ST_DWithin(location, ST_MakePoint($lng,$lat)::geography, 75)
  AND similarity(name,$name) > 0.3
ORDER BY similarity(name,$name) DESC, location <-> ST_MakePoint($lng,$lat)::geography LIMIT 1;
-- nếu trống → INSERT places(...) RETURNING id
```

**Sửa `checkpoint`:**
- `CreateParams` thêm `PlaceID *string` (nếu client gửi sẵn).
- `checkpoint.repository.Create` (trong tx): nếu `PlaceID==nil` → `placeResolver.ResolveInTx(...)`; rồi
  `UPDATE places SET checkin_count=checkin_count+1`; set `checkpoint.place_id`.
- DI: thêm interface `placeResolver { ResolveInTx(ctx, pgx.Tx, ...) (string,error) }` vào checkpoint repo; wire `place.Repository` ở `main.go`.
- `checkpoint.Service.Input` + handler thêm `place_id` optional.

**Acceptance:** check-in 2 lần cùng quán → 1 place, `checkin_count=2`, cả 2 checkpoint có `place_id`. XP vẫn atomic. `go test` xanh.

> ⚠️ Concurrency: 2 check-in *đồng thời* vào place mới có thể tạo 2 place (chấp nhận ở scale cá nhân; hardening sau bằng advisory lock / normalized unique key).

---

## D2 — BE: search · nearby · detail ✅

```
GET /places/search?q=&lat=&lng=&limit=    trgm: similarity(name,q) > 0.2, ưu tiên gần nếu có lat/lng
GET /places/nearby?lat&lng&radius&limit    ST_DWithin, sort theo khoảng cách
GET /places/{id}                           detail: place + AVG(rating) + COUNT + N ảnh + N review gần đây
```
- `place.Repository` giữ `mediaBase` để prepend URL ảnh (như checkpoint).
- Detail = JOIN `checkpoints`/`checkpoint_images` của place: avg rating, tổng check-in, 6 ảnh mới nhất, 5 review (note + author).
- Handler map lỗi `ErrNotFound`→404, `ErrInvalidInput`→400 (không che như bug cũ).

**Acceptance:** search "ca phe" ra place; `/places/{id}` trả aggregate đúng.

---

## D3 — BE: discover feed + popular ✅

```
GET /discover/feed?lat&lng&cursor&limit   checkpoint cộng đồng gần bạn, mới nhất, cursor-based
GET /places/popular?lat&lng&limit          top theo checkin_count (cache + singleflight)
```
- **Feed**: checkpoint + author + place + ảnh đầu, `WHERE ST_DWithin(...) ORDER BY created_at DESC`,
  cursor = `created_at` (keyset: `created_at < $cursor`). Trả `next_cursor`.
- **Popular**: cache in-memory **RWMutex + TTL 60s** theo key (làm tròn lat/lng + limit) + `singleflight`
  để gộp request trùng. `log()` cache hit/miss.

**Acceptance:** feed phân trang bằng cursor; popular gọi 2 lần liên tiếp → lần 2 hit cache (log).

---

## D4 — FE: Discover feed thật ✅

- `lib/api.ts`: thêm types Place/PlaceDetail/FeedItem + `getFeed(cursor)`, `searchPlaces(q)`, `getPlace(id)`, `getPopular()`, `getNearbyPlaces()`.
- **DiscoverPage**: tab "Dành cho bạn" = feed thật qua **`useInfiniteQuery`** (cursor) → render `PostCard`
  (đã có UI) với data thật (author, place, ảnh, XP). Infinite scroll (IntersectionObserver).

**Acceptance:** mở Discover thấy check-in cộng đồng thật, cuộn để tải thêm.

---

## D5 — FE: search → Place detail ✅

- **Search**: thanh search ở Map/Discover → `/places/search` (debounce) → list kết quả → tap → mở **PlaceDetailSheet/Page**.
- **PlaceDetail**: ảnh (react-photo-view), avg rating, số check-in, review gần đây, nút **"Cắm cờ tại đây"**.

**Acceptance:** tìm 1 place → mở detail → thấy ảnh/review tổng hợp.

---

## D6 — FE: place-based check-in ✅

- Từ Place detail "Cắm cờ tại đây" → mở `CreateCheckpointForm` với `place_id` + lat/lng/name của place (prefill, khóa name).
- Tab **Create**: đổi từ check-in GPS tạm → **tìm/chọn place rồi cắm cờ** (dùng search D5). Vẫn cho "cắm cờ tại vị trí hiện tại" nếu không chọn place.

**Acceptance:** cắm cờ từ Place detail → `checkin_count` của place tăng, không tạo place trùng.

---

## A1 — Auth refinement (Google + anonymous link) ✅
*(độc lập với Discovery, làm trước hoặc xen kẽ — đã thống nhất ở plan trước)*
- `loginGoogle()` rẽ nhánh: **anonymous → `supabase.auth.linkIdentity({provider:'google'})`** (giữ `sub`+data); logged-out → `signInWithOAuth`.
- Redirect callback: overlay "Đang hoàn tất đăng nhập..." khi URL có `?code=`.
- `onAuthStateChange` `USER_UPDATED` (đã có) → re-exchange → BE reconcile.
- Lỗi identity trùng → `authErrors.ts` thêm `identity_already_exists`.
- Cấu hình **Supabase → Redirect URLs** (localhost + prod Workers).

---

## Thứ tự đề xuất
`D1 → D2 → D3 → D4 → D5 → D6` (BE trước, FE sau, mỗi mốc ship + test được). `A1` chèn bất kỳ lúc nào.

## Go patterns luyện
pg_trgm + GIN `similarity()` · PostGIS `ST_DWithin`/KNN · **transaction xuyên package** (place resolve trong tx checkpoint) · **singleflight** + RWMutex TTL cache · cursor/keyset pagination.

## File dự kiến
- BE: `migrations/0006_*`, `internal/place/*`, sửa `checkpoint/{model,repository,service,handler}.go`, `cmd/server/main.go`. Có thể `internal/discovery` riêng cho feed hoặc gộp vào `place`.
- FE: mở rộng `lib/api.ts`, `pages/DiscoverPage.tsx` (rewrite), `components/PlaceDetail*.tsx`, search UI, `pages/CreatePage` (place-based).
