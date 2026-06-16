# Checkpoint — Trạng thái dự án

> Cập nhật: 2026-06-15 · Roadmap đầy đủ xem [../CHECKPOINT.md](../CHECKPOINT.md)

## TL;DR

- **Phase 1 ✅ · Phase 2 M1–M7 ✅ · Phase 3 J1–J5 ✅ · Phase 4 ✅ · Phase 5 (Gamification) G1–G4 ✅** (XP events, Hộ chiếu con dấu tỉnh, Bảng xếp hạng, Huy hiệu) + Profile edit. Còn: M8/deploy/test. AI trip planner đã được chốt bỏ qua.
- **Backend:** auth (JWKS + anonymous + upgrade), profile, checkpoint (check-in + XP atomic, spatial map, ảnh→R2) đều chạy thật, tích hợp share link OG cho crawler. Còn: deploy thật, viết test.
- **Frontend:** auth end-to-end, **map thật (MapLibre)** + check-in GPS + detail, PWA đầy đủ, tích hợp link share qua Backend. Discover/AIPlan vẫn data giả.
- **Đã làm thêm (ngoài roadmap):** anonymous + upgrade tài khoản, re-auth 2 tầng + single-flight, image preview/zoom/xoay, bottom-sheet kéo được, popup xin quyền vị trí, lưu object key (không lưu full URL), feed sắp gần→xa, PWA no-zoom, **định vị bền cho iOS PWA** (`lib/geo.ts`), **xóa check-in của mình** (hoàn XP/stats + dọn place mồ côi + xóa ảnh R2), **camera trong app** (react-webcam), **resize/crop avatar** (react-easy-crop), **CI alert Telegram** (BE+FE theo từng step).
- **Mới (2026-06-16):** **SEO Share Card & OG Meta (Backend)** — triển khai package `internal/share` với các HTTP endpoints `/share/checkpoint/{id}`, `/share/journey/{id}`, `/share/user/{username}` phục vụ Crawler. Tự động kiểm tra User-Agent: nếu là Crawler (Facebook, Twitter, Telegram, Zalo,...) -> trả trang HTML chứa các thẻ Open Graph meta (title, description, image, url) giúp hiển thị card preview đẹp mắt; nếu là người dùng thường -> redirect (HTTP 302) trực tiếp về đúng trang tương ứng trên Frontend PWA. Frontend cũng được cập nhật để chia sẻ/copy link trỏ về các endpoint share của backend thay vì link frontend trực tiếp để tối ưu hiển thị khi share lên mạng xã hội.
- **Mới (2026-06-16):** **Tối ưu hóa Avatar Cropper** — Cấu hình `objectFit="cover"` cho cấu phần `Cropper` trong [AvatarCropSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/AvatarCropSheet.tsx) giúp hình ảnh (dọc/ngang) tự động co dãn bao phủ toàn bộ khung crop 1:1, ngăn ngừa hiện tượng lộ viền đen hai bên hoặc trên dưới khi zoom/di chuyển.
- **Mới (2026-06-16):** **Sửa lỗi nạp trùng lớp GNotificationCenterDelegate** — Thêm cơ chế `overrides` bắt buộc phiên bản `sharp` về `0.34.5` trong [web/package.json](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/package.json) để đồng bộ hóa với wrangler/miniflare. Việc này loại bỏ hoàn toàn cảnh báo macOS về việc nạp trùng thư viện C++ `libvips-cpp` khi chạy Vite build / PWA assets generation.
- **Mới (2026-06-15):** **Huy hiệu thiết kế + khung avatar theo cấp.** (1) **Huy hiệu**: `BadgeMedal` render SVG thiết kế từ `web/public/badges/` map theo `badge.key` (first_checkin→first-step, explorer_10→explorer, provinces_5→country, night_owl→night-owl, journey_starter→traveler); badge chưa mở khóa / key lạ vẫn dùng hexagon + glyph cũ. (2) **Khung avatar**: `web/public/frames/` (khung cấp 1–50 + khung huy hiệu), catalog `lib/avatarFrames.ts`, mở khóa theo level/badge. Người dùng chọn khung trong `AvatarCropSheet` (live preview overlay căn theo lỗ khung); khung được **bake thẳng vào ảnh** (`lib/avatarComposite.ts` → PNG 512, frame phủ full viewBox, avatar nằm trong lỗ tâm) rồi upload lại — không cần field backend. Avatar không có khung cũng bake thành đĩa tròn trên nền trong suốt. Khung đã chọn nhớ ở `localStorage` (`cp_avatar_frame:<id>`). (3) **Hiển thị avatar** đổi sang `object-contain`, **bỏ crop tròn** ở mọi nơi (profile, leaderboard, feed, comment, notification, sheets) để hiện đủ khung "floating". (4) **Thẻ cấp độ** trong Profile dùng icon `web/public/levels/level-range-*.svg` (Bronze→Master, `levelTierIconUrl`) làm nền, số cấp vẽ giữa bằng CSS (bỏ chữ "CẤP").
- **Mới (2026-06-15):** **Google Drive Sync (opt-in)** — kết nối 1 lần, mọi checkpoint mới có ảnh tự sync ngầm. BE: package `internal/gdrive` (OAuth2 authorization code flow, client_secret ở BE; state JWT chống CSRF; `GET /integrations/drive/callback` exchange code → lưu tokens → redirect FE); bảng `user_drive_tokens` (migration 000020); `Syncer.SyncCheckpoint` goroutine (lấy token, refresh nếu cần, tạo/cache folder "Checkpoint App", upload từng ảnh từ R2 URL lên Drive qua multipart, metadata trong `description`+`appProperties`); `checkpoint.Handler` trigger sync sau `Create()`, nil-safe khi Drive chưa cấu hình. FE: `DriveConnectCard.tsx` (query status, nút Kết nối→`initDriveConnect()→window.location.href`, nút Ngắt kết nối); section "Tích hợp" trong ProfilePage; xử lý `?drive=connected/error` sau OAuth redirect. Env cần set: `GOOGLE_DRIVE_CLIENT_ID`, `GOOGLE_DRIVE_CLIENT_SECRET`, `GOOGLE_DRIVE_REDIRECT_URI`, `FRONTEND_URL`. Setup ngoài code: Google Cloud Console (enable Drive API + OAuth2 credentials + add redirect URI) + chạy migration 000020.
- **Mới (2026-06-14):** **PWA hardening cho iOS/Safari**. (1) **Splash + icon iOS**: thêm `@vite-pwa/assets-generator` (`pwa-assets.config.ts`, source `icon-512.png`) tự sinh apple-touch-icon (180, nền opaque `#FAF7F2` → hết viền đen) + bộ apple-touch-startup-image (portrait/landscape, light+dark) và inject `<link>` lúc build → hết màn hình trắng khi mở app. (2) **Meta**: thêm `mobile-web-app-capable` chuẩn + theme-color dark; bỏ link apple-touch-icon thủ công. (3) **Fix định vị iOS**: `geo.ts` thêm `isGeolocationSecure()`/`ERR_INSECURE` (Safari chặn geolocation khi không HTTPS — nguyên nhân "xin quyền không bật"); `LocationPermissionContent` báo rõ "cần HTTPS" + disable nút khi insecure; giữ getCurrentPosition trong user-gesture. (4) **Cập nhật không kẹt**: `registerType:"prompt"` + `injectRegister:false`, component `PWAUpdatePrompt` (virtual:pwa-register) hiện toast "Có bản cập nhật mới — Tải lại" → `updateSW(true)` (iOS hết cảnh phải xoá/cài lại). (5) **InstallHint**: banner 1 lần cho iOS Safari (chưa standalone) hướng dẫn Chia sẻ → Thêm vào MH chính (no `beforeinstallprompt` trên iOS). (6) **Overscroll**: `overscroll-behavior:none` (html/body) + `overscroll-contain` (`<main>`) chống rubber-band lộ nền trắng. Util `lib/platform.ts` gom `getPlatform`/`isStandalone`. **Cần test trên iOS qua HTTPS** (http:// sẽ không xin được vị trí — đúng thiết kế).
- **Mới (2026-06-14):** **Discover feed virtual scroll** — danh sách feed (for-you/following) giờ ảo hoá bằng `@tanstack/react-virtual` (`useVirtualizer`), chỉ render các card trong viewport + overscan thay vì giữ toàn bộ trong DOM. Scroll container của app là `<main>` trong AppLayout (window không scroll) nên expose qua `ScrollContainerContext`/`useScrollContainer`; virtualizer dùng `getScrollElement` trỏ vào đó + `scrollMargin = listRef.offsetTop` (tabs header phía trên). Infinite loading chuyển từ `IntersectionObserver` sentinel sang phát hiện last virtual item (`fetchNextPage` khi gần cuối). Card cao biến thiên → `measureElement` đo thật; `pb-4` thay flex gap (rows absolute). Đổi tab → scroll về đầu. Search results + empty/loading vẫn render thường (không ảo hoá).
- **Mới (2026-06-14):** **Public pages khi chưa login** — share link/QR (`/c/:id`, `/j/:id`, `/u/:username`) + **list Discover (for-you)** xem được không cần đăng nhập, hiện đúng data như đã auth. BE: middleware `OptionalAuth` (có token → gắn principal + `mine`; không token → anonymous); đổi các endpoint đọc sang optionalAuth (`GET /checkpoints/{id}`,`/by-user`,`POST /{id}/view`; `GET /journeys/{id}`; `GET /users/{username}`; `GET /checkpoints/{id}/reactions` mine=null khi anon; `GET /discover/feed`,`GET /places/{id}`); mutating + following-feed giữ private; reaction repo bỏ truy vấn `mine` khi userID rỗng (tránh lỗi UUID). FE: `App.tsx` nhánh `!user` render `PublicShareLayout` (header logo + nút Đăng nhập→`/login`, mount LocationProvider, KHÔNG mount Notification/CheckinQueue) với landing `/discover` tối giản + share routes; DiscoverPage ẩn tab "Đang theo dõi" + menu `⋮` khi anon; `getFollowing` skip khi không token; catch-all redirect cho authed routes. User đã login: giữ nguyên.
- **Mới (2026-06-14):** **Notifications (Firestore, in-app, không backend)** — chuông ở header (badge realtime). 4 loại: comment / follow + unfollow / reaction vào checkpoint của bạn + "người bạn follow đăng checkpoint mới". 3 loại đầu lưu Firestore `users/{uid}/notifications` (client tự ghi tại action, 1 write/lần, bỏ qua self); loại cuối **suy ra từ `GET /discover/feed/following`** theo lastSeen (không fan-out). Unread = `created_at > lastSeen` (localStorage), badge qua `onSnapshot`. `lib/notifications.ts` + `context/NotificationProvider` + `NotificationSheet` (tap → mở checkpoint/profile); ghi notif trong CommentSection/ReactionBar/UserProfileSheet/DiscoverPage FeedCard. `firestore.rules` thêm subcollection. **So sánh Firestore vs FCM**: Firestore = lưu + inbox realtime khi app mở (rẻ, gần free); FCM = push khi đóng app (gửi free nhưng nặng setup) — để sau. Không đụng backend Go.
- **Mới (2026-06-14):** **Huy hiệu SVG đẹp hơn + xem profile ở Bảng xếp hạng**. **Badge**: `gamification.Badge` thêm field `Color` (palette token), `badges.go` đổi `Icon` từ emoji → tên icon registry (`flag/compass/map/moon/luggage`) + màu (emerald/sky/violet/indigo/amber); catalog vẫn code-only (không seed DB). FE: component `BadgeMedal.tsx` (medallion gradient theo `color`, glyph trắng, ring; locked = đĩa xám + khoá; size sm/md/lg) — single source of truth, **dùng lại được để gắn flair lên avatar profile sau này**; `BadgesSection` + `BadgeUnlockToast` render qua `BadgeMedal`; `Badge` type FE thêm `color`; thêm icon `moon`. **Leaderboard**: mỗi hàng thành button mở `UserProfileSheet` (tái dùng component sẵn có) — bấm để xem profile người chơi.
- **Mới (2026-06-14):** **Reactions (BE Postgres) + bộ icon SVG tự host (bỏ lucide-react)**. **Reactions**: bảng `checkpoint_reactions` (PK `(checkpoint_id,user_id)` → 1 reaction/người/checkpoint, đổi loại = upsert `ON CONFLICT DO UPDATE`); package `internal/reaction` (model/repo/service/handler) mirror follow; `POST /checkpoints/{id}/reaction {reaction}` (set/switch), `DELETE /checkpoints/{id}/reaction` (clear), `GET /checkpoints/{id}/reactions → {counts,total,mine}`; route đăng ký bằng `r.With(auth)` full-path để không đụng subrouter `/checkpoints`; dùng **POST** thay PUT vì CORS chưa mở PUT; service validate set cố định (like/love/fire/haha/sad). FE: `lib/api.ts` getReactions/setReaction/clearReaction + `ReactionBar.tsx` (react-query optimistic) đặt trong CheckpointDetailSheet. **Icon SVG**: registry tự host `src/icons/registry.tsx` (50 icon, sao chép path lucide để giữ nguyên hình) + `components/ui/Icon.tsx` (`<Icon name size strokeWidth>`, màu `currentColor`); thay toàn bộ import lucide-react (19 file) + emoji inline (👁⭐📍🚩🥇🏆🏅🔒🛂🎉 + icon category) bằng `<Icon>`; gỡ dependency `lucide-react`. Emoji còn giữ: canvas shareCard (`categoryEmoji`/🧳/🛂), `Badge.icon` từ DB, vài chuỗi toast/hướng dẫn trình duyệt.
- **Mới (2026-06-16):** **Convert video sang MP4 chuyển sang backend** — trước đây FE convert client-side bằng `MediaRecorder` + `canvas.captureStream`, nhưng nhiều browser (Chrome/Firefox/Android) không hỗ trợ xuất `video/mp4` nên upload video fail. Giờ FE chỉ validate (duration ≤ 10s, size ≤ 60MB) + tạo thumbnail JPEG client-side, rồi gửi **video gốc (mọi định dạng)** multipart lên `POST /checkpoints/video`; backend chạy **ffmpeg** transcode → MP4 (H.264 baseline, ≤720, faststart, AAC, `-t 10`, auto-rotate), upload thẳng R2, trả `{ object_key, thumbnail_key }` để gắn vào `POST /checkpoints`. Validate size hai phía (client advisory + backend authoritative: input ≤ 60MB, output ≤ 12MB). Ảnh vẫn upload trực tiếp browser→R2; ảnh + video chạy song song trong `submit`. Dockerfile backend đổi base `distroless/static` → `alpine` + `apk add ffmpeg`. Files: `internal/checkpoint/transcode.go` (ffmpeg wrapper), `PrepareVideo` (service), `TranscodeVideo` (handler), `lib/video.ts` (bỏ `convertToMP4`/`MediaRecorder`), `lib/api.ts` `transcodeVideo`, `CreateCheckpointForm`.
- **Mới (2026-06-14):** **Xem profile người khác** — bấm avatar/username trong CheckpointDetailSheet (Map + Discover) hoặc feed Discover → mở `UserProfileSheet` (passport card + stats + nút Follow + lưới check-in xem ảnh). Route `/u/:username` (làm share-card link profile hoạt động). Backend: `GET /checkpoints/by-user?user_id=` (public, service `ListByUser`); FE `getUserByUsername` + `getUserCheckpoints`. Tái dùng `GET /users/{username}` sẵn có. Passport/Badges công khai để sau.
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
| + | Reactions (ngoài roadmap) | ✅ | ✅ | BE Postgres `checkpoint_reactions` (1/người/checkpoint, set/switch/clear); FE `ReactionBar` (optimistic) trong CheckpointDetailSheet, icon SVG tự host |

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
