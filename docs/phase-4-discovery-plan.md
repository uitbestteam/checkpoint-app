# Phase 4 — Discovery (Plan)

> Goal: tìm kiếm & khám phá **địa điểm (Place)** từ dữ liệu cộng đồng — search, nearby,
> place detail, discover feed, popular. Kèm **hoàn thiện auth Google redirect + gộp tài
> khoản anonymous**.
> Roadmap: [../CHECKPOINT.md](../CHECKPOINT.md) · trạng thái: [STATUS.md](STATUS.md)

## Quyết định cốt lõi: tách khái niệm **Place**

Hiện `checkpoint` = một lần check-in của 1 user. Discovery cần **Place** = địa điểm canonical
mà nhiều người check-in vào.

- Thêm bảng `places`. Mỗi checkpoint **gắn `place_id`**.
- Khi check-in: **match** vào place gần + tên giống (pg_trgm + ST_DWithin ~75m); không có thì **tạo place mới**.
- Discovery query trên `places`; place detail **tổng hợp** từ các checkpoint của place đó.
- → Đây cũng là chỗ hiện thực **"cắm cờ theo địa điểm"** cho tab Create (check-in vào 1 place đã chọn).

## Go patterns sẽ luyện
- **pg_trgm** (fuzzy name match + GIN index), **full-text/`similarity()`** cho search.
- **PostGIS** `ST_DWithin`/KNN cho nearby.
- **singleflight** (`golang.org/x/sync/singleflight`) + **RWMutex TTL cache** cho "popular" (low cardinality, đổi chậm).
- **Cursor pagination** cho feed.

---

## 1. Database (migration `0006_places`)

```sql
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE TABLE places (
  id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name          TEXT NOT NULL,
  category      TEXT NOT NULL DEFAULT 'other',
  lat           DOUBLE PRECISION NOT NULL,
  lng           DOUBLE PRECISION NOT NULL,
  location      GEOGRAPHY(Point,4326)
                GENERATED ALWAYS AS (ST_SetSRID(ST_MakePoint(lng,lat),4326)::geography) STORED,
  address       TEXT,
  checkin_count INT NOT NULL DEFAULT 0,   -- denormalized cho popular/ranking
  created_at    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX idx_places_location ON places USING GIST (location);
CREATE INDEX idx_places_name_trgm ON places USING GIN (name gin_trgm_ops);
CREATE INDEX idx_places_checkin_count ON places (checkin_count DESC);

ALTER TABLE checkpoints ADD COLUMN place_id UUID REFERENCES places(id);
CREATE INDEX idx_checkpoints_place ON checkpoints(place_id);
```

### Place resolution (trong transaction check-in hiện có)
```sql
-- tìm place khớp: gần ~75m và tên đủ giống
SELECT id FROM places
WHERE ST_DWithin(location, ST_MakePoint($lng,$lat)::geography, 75)
  AND similarity(name, $name) > 0.3
ORDER BY similarity(name, $name) DESC, location <-> ST_MakePoint($lng,$lat)::geography
LIMIT 1;
-- không có → INSERT place mới
-- rồi: UPDATE places SET checkin_count = checkin_count + 1 WHERE id = $place
--      checkpoint.place_id = $place
```
→ Sửa `checkpoint.Repository.Create`: thêm bước resolve place **trong cùng tx** (atomic với insert checkpoint + cộng XP).

---

## 2. Backend endpoints

```
GET /places/search?q=&lat=&lng=&limit=     full-text/trgm; lat/lng để ưu tiên gần
GET /places/nearby?lat&lng&radius&limit     ST_DWithin, sort theo khoảng cách/popularity
GET /places/{id}                            detail: avg rating, tổng check-in, ảnh gần đây, review gần đây
GET /places/popular?lat&lng&limit           top theo checkin_count (cache + singleflight)
GET /discover/feed?lat&lng&cursor&limit     ⭐ feed: checkpoint cộng đồng gần bạn, mới nhất (cursor)
```

Place detail = JOIN/aggregate từ `checkpoints` của place: `AVG(rating)`, `COUNT(*)`, N ảnh mới
nhất (`checkpoint_images`), N review mới nhất (note + author).

Domain mới: `internal/place/` (model/repository/service/handler). Feed có thể đặt trong
`place` hoặc domain `discovery` riêng.

---

## 3. Frontend

- **DiscoverPage** (nối mock → thật): tab "Dành cho bạn" = `/discover/feed` quanh user → render
  `PostCard` (đã có UI) với data thật (author, place, ảnh, XP). Infinite scroll qua cursor (TanStack Query `useInfiniteQuery`).
- **Search**: thanh search ở Map + màn search → `/places/search` → tap kết quả → bay map tới place / mở **PlaceDetail**.
- **PlaceDetailSheet/Page**: ảnh (react-photo-view), avg rating, số check-in, review gần đây, nút
  **"Cắm cờ tại đây"** → check-in vào place (place-based).
- **Create tab**: đổi từ check-in GPS tạm thời → **chọn/tìm place rồi cắm cờ** (hoàn thiện TODO).

---

## 4. Auth refinement — Google redirect + gộp anonymous

**Vấn đề:** hiện `loginGoogle` luôn `signInWithOAuth` → nếu user **đang anonymous** mà đăng nhập
Google sẽ **tạo tài khoản mới, mất data khách**.

**Plan:**
1. `loginGoogle()` rẽ nhánh theo trạng thái:
   - **đang anonymous** → `supabase.auth.linkIdentity({ provider: 'google', options:{ redirectTo }})`
     → **giữ nguyên `sub` + data**, sau redirect `is_anonymous` thành false (BE reconcile đã xử lý).
   - **đang logged-out** → `supabase.auth.signInWithOAuth({ provider:'google', options:{ redirectTo }})`.
2. **Redirect callback UX:** khi quay về (URL có `?code=`/hash), hiện overlay "Đang hoàn tất đăng
   nhập..." cho tới khi `onAuthStateChange` resolve (tránh nháy Login/Map). `detectSessionInUrl: true`
   đã bật → supabase tự xử lý code; chỉ cần che bằng loading.
3. **onAuthStateChange** (đã có): `SIGNED_IN` → exchange; **`USER_UPDATED`** (link xong) → re-exchange
   → BE reconcile email + is_anonymous. Không phải thêm nhiều.
4. **Lỗi identity trùng:** `linkIdentity` fail nếu Google đó đã thuộc tài khoản khác →
   thêm code `identity_already_exists` vào `authErrors.ts` ("Tài khoản Google này đã được dùng cho
   tài khoản khác. Đăng nhập trực tiếp?") + cho chọn `signInWithOAuth` (bỏ session khách).
5. **Cấu hình Supabase:** thêm `redirectTo` (origin + origin/prod Workers) vào **Auth → URL
   Configuration → Redirect URLs**, nếu không OAuth sẽ bị chặn.

**Files:** `auth/AuthContext.tsx` (`loginGoogle` rẽ nhánh + overlay loading), `lib/authErrors.ts`
(thêm code), có thể `App.tsx` (overlay khi đang xử lý callback).

---

## 5. Thứ tự thực thi

| Mốc | Nội dung |
|-----|----------|
| **A1** | Auth: Google `linkIdentity` cho anonymous + redirect UX + lỗi trùng identity *(làm trước — nhỏ, mở đường cho social)* |
| **D1** | BE: migration 0006 + place resolution trong tx check-in |
| **D2** | BE: `/places/search` + `/nearby` + `/{id}` |
| **D3** | BE: `/discover/feed` (cursor) + `/places/popular` (singleflight + RWMutex cache) |
| **D4** | FE: DiscoverPage feed thật (useInfiniteQuery) |
| **D5** | FE: search → PlaceDetail |
| **D6** | FE: place-based check-in (hoàn thiện tab Create) |

## 6. Rủi ro / lưu ý
- **Đổi check-in tx:** thêm resolve place vào transaction đang chạy — test kỹ (đừng làm vỡ XP atomic).
- **pg_trgm threshold 0.3** cần tinh chỉnh theo data thật (tên tiếng Việt có dấu).
- **Popular cache**: nhớ `log` khi cache giúp/độ trễ; invalidate khi đủ đơn giản (TTL ngắn 30–60s là đủ).
- **Anonymous link**: chỉ hiện nút "Đăng nhập Google để lưu" cho user khách (đã có UpgradeBanner — thêm nút Google vào đó).
