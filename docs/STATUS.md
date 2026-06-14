# Checkpoint — Trạng thái dự án

> Cập nhật: 2026-06-14 · Roadmap đầy đủ xem [../CHECKPOINT.md](../CHECKPOINT.md)

## TL;DR

- **Phase 1 ✅ · Phase 2 M1–M7 ✅ · Phase 3 J1–J4 ✅ · Phase 4 ✅ · Phase 5 (Gamification) G1–G4 ✅** (XP events, Hộ chiếu con dấu tỉnh, Bảng xếp hạng, Huy hiệu) + Profile edit. Còn: M8/deploy/test, Share card, AI.
- **Backend:** auth (JWKS + anonymous + upgrade), profile, checkpoint (check-in + XP atomic, spatial map, ảnh→R2) đều chạy thật. Còn: deploy thật, viết test.
- **Frontend:** auth end-to-end, **map thật (MapLibre)** + check-in GPS + detail, PWA đầy đủ. Discover/AIPlan vẫn data giả.
- **Đã làm thêm (ngoài roadmap):** anonymous + upgrade tài khoản, re-auth 2 tầng + single-flight, image preview/zoom/xoay, bottom-sheet kéo được, popup xin quyền vị trí, lưu object key (không lưu full URL), feed sắp gần→xa, PWA no-zoom, **định vị bền cho iOS PWA** (`lib/geo.ts`), **xóa check-in của mình** (hoàn XP/stats + dọn place mồ côi + xóa ảnh R2), **camera trong app** (react-webcam), **resize/crop avatar** (react-easy-crop), **CI alert Telegram** (BE+FE theo từng step).
- **Mới (2026-06-14):** **Comments (Firestore)** — bình luận phẳng trên CheckpointDetailSheet, FE init Firebase **chỉ để dùng Firestore** (không Firebase Auth), đọc/ghi thẳng browser↔Firestore, cursor paging native (`startAfter`). `lib/firebase.ts` + `lib/comments.ts` + `CommentSection.tsx`; `firestore.rules` (read public, create validate, owner-delete enforce client-side). Env `VITE_FIREBASE_*`. Không đụng backend Go.
- **Mới (2026-06-14):** **Follow + View count**. **Follow**: bảng `follows` (composite PK + self-follow CHECK), `POST/DELETE /users/{username}/follow`, `GET /users/following → {ids}` (cache Redis Set `following:{id}` TTL 24h, invalidate khi follow/unfollow, fallback DB). Map: filter "Đang follow" lọc client-side theo `followingIds`. Discover: tab "Đang theo dõi" gọi `GET /discover/feed/following` (subquery `c.user_id IN (SELECT followee_id...)`); FeedCard có nút Theo dõi/Bỏ theo dõi trong menu `⋮`. **View count**: cột `checkpoints.view_count`, `POST /checkpoints/{id}/view` (Redis INCR `views:{id}` seed từ DB, persist DB ngầm bằng goroutine + GREATEST; fallback UPDATE đồng bộ khi Redis lỗi); hiện `👁` ở ClusterSheet (map list) + CheckpointDetailSheet (fire khi mở sheet).
- **Mới (2026-06-14):** **Gợi ý địa điểm khi check-in (LocationIQ)** — `GET /places/suggest?lat&lng` (backend proxy, `internal/locationiq`): gọi LocationIQ Nearby, cache in-memory 1h theo rounded coords (111m grid), map OSM types → 5 category. FE (`CreateCheckpointForm`) chạy `useQuery` song song với Photon: nếu suggestion về thì auto-fill `name` + `category`, hiện chip "Gợi ý từ Google Maps · Xoá"; khi API key trống hoặc lỗi/quota thì fallback về Photon như cũ. Key: `LOCATIONIQ_API_KEY` (optional env). (Trước đó định dùng Google Places nhưng billing India bị chặn → chuyển LocationIQ.)
- **Mới (2026-06-13, session 2):** **background check-in** — sau khi upload R2 xong, form đóng/navigate ngay, `POST /checkpoints` chạy ngầm trong `CheckinQueueProvider` (mount ở root), toast XP + badge bắn khi server confirm; bỏ inline success screen trong PlaceDetailSheet.
- **Mới (2026-06-13):** **nhiều hành trình active cùng lúc** + dropdown chọn hành trình khi check-in (mặc định chọn active mới nhất, BE validate quyền sở hữu); **geocode đổi sang Photon** (nhanh hơn, không giới hạn 1 req/s); **upload ảnh song song** (errgroup); **share card vẽ bằng Canvas2D** (`lib/shareCard.ts` — fix ảnh trắng trên iOS Safari/PWA do giới hạn `<foreignObject>` của html-to-image); **camera preview-after-shot** — chụp xong xem preview, chọn "Chụp lại" / "Tiếp tục" / "Xong"; **upload ảnh trực tiếp browser→R2** (presigned URL, loại bỏ double-hop FE→Cloud Run→R2); **flow tạo checkpoint đảo ngược** — upload-slots trước, POST /checkpoints với `images` trong body, tạo checkpoint + gắn ảnh 1 transaction; bắt buộc có ảnh; **check-in từ ảnh** — tab "Từ ảnh" trên CreatePage: chọn ảnh thư viện → đọc EXIF GPS (exifr) → form check-in bình thường với tọa độ và ảnh điền sẵn; **CheckpointDetailSheet** hiện avatar + display_name tác giả (ảnh nếu có, fallback gradient); **EXIF GPS Android fix** — đổi sang `exifr.parse()` với GPS-only options thay vì `exifr.gps()` shorthand, và dùng epsilon check thay strict `=== 0`.

```
Phase 1  ██████████████████  done (auth + profile + PWA)
Phase 2  ████████████████░░  Checkpoint Core M1–M7 ✅ (chỉ còn M8 polish/deploy)
Phase 4  ██████████████████  Discovery DONE (D1–D6 + A1)
Phase 3  ████████████████░░  Journey J1–J4 ✅ (CRUD, NHIỀU active journey, detail map+timeline+stats, chọn journey khi check-in); J5 share OG còn
Phase 5  ████████████████░░  Gamification G1–G4 ✅ (XP events, Hộ chiếu, Bảng xếp hạng, Huy hiệu) + Profile edit; còn Share card
Phase 6+ ░░░░░░░░░░░░░░░░░░  chưa bắt đầu (AI / Polish / Deploy)
```

---

## So sánh Backend vs Frontend (theo 16 features)

| # | Feature | Backend | Frontend | Ghi chú |
|---|---------|:---:|:---:|---|
| 1 | Authentication | ✅ | ✅ | **End-to-end**: BE exchange/refresh/logout + JWKS + CORS + **anonymous**; FE login (email/Google/khách) + token store + auto-refresh |
| 2 | User Profile | ✅ | ✅ | BE: get/update/avatar. FE: ProfilePage (header/stats thật) + **EditProfileSheet** (sửa tên/bio + đổi avatar → cập nhật ngay) |
| 3 | Map | ✅ | ✅ | BE `?bbox`/`/nearby` (PostGIS). FE **MapLibre** thật + markers theo viewport |
| 4 | GPS Check-in | ✅ | ✅ | BE `POST /checkpoints` +XP. FE nút CHECK-IN lấy GPS → tạo thật + toast |
| 5 | Create Checkpoint | ✅ | ✅ | BE create. FE CreateCheckpointSheet (name/category/note/rating/ảnh) |
| 6 | Upload Image | ✅ | ✅ | BE `POST /{id}/images` → R2. FE chọn ảnh khi check-in |
| 7 | Add Note / Review | ✅ | ✅ | note + rating trong check-in |
| 8 | Checkpoint Detail | ✅ | ✅ | BE detail+images+author. FE detail sheet (ảnh, note, rating, author) |
| 9 | Share Check-in Card | n/a | ✅ | **Client-side** (**Canvas2D** `lib/shareCard.ts` → PNG + Web Share): card checkpoint/hành trình/hộ chiếu + **đính kèm ảnh gốc** (R2 CORS) + **deep link** `/c/:id`·`/j/:id` (origin tự lấy). Canvas2D thay html-to-image để ảnh hiện đúng trên iOS Safari/PWA. Không cần BE |
| 10 | Journey Timeline | ✅ | ✅ | BE journey detail (stops theo thời gian). FE JourneyDetailSheet timeline |
| 11 | Journey Map | ✅ | ✅ | BE coords + distance (ST_MakeLine). FE polyline MapLibre + markers |
| 12 | Place Detail | ✅ | ✅ | BE `/places/{id}` (avg rating, ảnh, review). FE PlaceDetailSheet + "Cắm cờ tại đây" |
| 13 | Search Place | ✅ | ✅ | BE `/places/search` (pg_trgm). FE search trong Discover (debounce) |
| 14 | Basic XP & Level | ✅ | ✅ | BE: +10 XP/check-in atomic + **xp_events** + tính level/`xp_to_next`. FE: progress bar số thật |
| 15 | Discover Basic | ✅ | ✅ | BE `/discover/feed` (cursor) + `/places/popular` (cache). FE feed thật (useInfiniteQuery) |
| 16 | AI Plan Basic | ❌ | 🟦 | FE: AIPlanPage → empty state **"sắp ra mắt"** (bỏ mock, để sau MVP) |

✅ chạy thật · 🟡 UI/khung có nhưng chưa hoạt động · ❌ chưa làm

**Đọc bảng:** feature 1–8 + 14 (Identity + Checkpoint Core + XP) **chạy thật end-to-end**. Còn lại 9–13, 15–16 (Journey, Discovery, Share, AI) là Phase 3+ — FE mới có mockup, BE chưa làm.

---

## Phase 1 — còn lại những gì

| Việc | Thuộc | Trạng thái |
|------|-------|-----------|
| Auth (exchange/refresh/logout) | BE | ✅ xong |
| User profile + avatar (R2) | BE | ✅ xong |
| JWT middleware + JWKS verify | BE | ✅ xong |
| Migrations (users, refresh_tokens) | BE | ✅ xong |
| Dockerfile + Makefile + CI + DEPLOY.md | BE | ✅ xong |
| CORS cho frontend | BE | ✅ xong |
| **Deploy thật lên Cloud Run** | BE | ⏳ tooling sẵn, chưa chạy `make deploy` |
| **Unit test cho service/auth** | BE | ❌ chưa |
| Scaffold Vite+React PWA + tokens | FE | ✅ xong |
| 5 màn UI (Map/Discover/Create/AIPlan/Profile) | FE | ✅ xong (tĩnh) |
| Màn Login (Supabase) + lưu/refresh token | FE | ✅ xong |
| API client + nối /auth/exchange, /users/me | FE | ✅ xong |
| PWA đầy đủ (icons, manifest, installable) | FE | ✅ xong |
| Message lỗi Supabase → tiếng Việt | FE | ✅ xong |

➡️ **Để "đóng" Phase 1:** (1) `make deploy` (đang chạy), (2) test BE. Auth + PWA xong ✅.

---

## Sau Phase 1

Phase 2–7 (Checkpoint Core → AI → Polish) **backend chưa động tới**. FE đã có sẵn mockup nên khi BE làm xong từng phase chỉ việc thay data giả bằng API. Chi tiết roadmap: [../CHECKPOINT.md](../CHECKPOINT.md).

➡️ **Phase 2 plan:** [phase-2-plan.md](phase-2-plan.md) (M1–M7 ✅).
➡️ **Phase 4 Discovery:** [phase-4-discovery-plan.md](phase-4-discovery-plan.md) — DONE (D1–D6 + A1).
➡️ **Phase 3 Journey plan (kế tiếp):** [phase-3-journey-plan.md](phase-3-journey-plan.md) — journeys + timeline/map/stats (PostGIS ST_MakeLine), active journey, share card OG.

---

## Chi tiết từng bên

- [backend.md](backend.md) — inventory backend (endpoint, file, gì chạy / gì thiếu)
- [frontend.md](frontend.md) — inventory frontend
