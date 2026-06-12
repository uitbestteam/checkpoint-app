# Frontend — Inventory

Vite + React 19 + TS · Tailwind v4 · React Router v7 · PWA · deploy Cloudflare.
Thư mục: [`../web`](../web). Design tokens: [`../design/tokens`](../design/tokens).

## Đã làm

### Hạ tầng
- Scaffold Vite + React 19 + TypeScript, **build/typecheck sạch**.
- **Tailwind CSS v4** với toàn bộ **design tokens** (`src/index.css`): palette cam/clay/green, dark mode, shadow ấm, radius, font **Montserrat** (hỗ trợ tiếng Việt, dùng cho cả display + body). ⚠️ **Token đồng bộ tay** từ design repo riêng (`design/tokens/theme.css`) — sửa bên design trước rồi copy sang; phần PWA no-zoom (`touch-action`/`text-size-adjust`) là web-only. *(TODO: tự động hoá sync — npm package / git submodule / CI copy.)*
- **PWA đầy đủ**: icons 192/512 + maskable + apple-touch (orange + map-pin), manifest vi, installable; `wrangler.jsonc` (Cloudflare static-assets, SPA fallback).
- **Mở link trong PWA đã cài**: manifest `id` + `launch_handler: navigate-existing` + `handle_links: preferred` → **Android Chrome** bắt link in-scope (vd `/c/:id` từ share) vào app đã cài, dùng lại cửa sổ đang chạy. ⚠️ **iOS không hỗ trợ** (mở link luôn vào Safari, không vào PWA — giới hạn nền tảng, cần native wrapper mới làm được).
- **Fix map prod + cache**: `vite.config` `manualChunks` gộp maplibre thành **1 chunk `maplibre`** (tránh lệch tên `gl-*` vs `maplibre-gl-*` → dangling → mất map). Workbox `cleanupOutdatedCaches`+`skipWaiting`+`clientsClaim`+`navigateFallbackDenylist:[/^\/assets\//]` để bản mới được nhận sau deploy. `lazyWithRetry` chỉ **reload đơn giản** (không unregister-all SW) → **an toàn khi sau này thêm Firebase Cloud Messaging** (FCM dùng SW riêng `firebase-messaging-sw.js`).
- **i18n lỗi auth**: `lib/authErrors.ts` dịch message lỗi Supabase (EN) → tiếng Việt theo error code + fallback theo text.
- Router 5 route + `AppLayout` (header + `<Outlet/>` + bottom nav).

### Auth (đã nối end-to-end ✅)
- `lib/supabase.ts` — Supabase client (chỉ để login).
- `lib/api.ts` — token store (localStorage) + `apiFetch` tự gắn Bearer & **re-auth khi 401** + `exchange`/`getMe`/`logout`.
- **Re-auth 2 tầng + single-flight** (khi 401): (1) app refresh_token → (2) re-exchange từ Supabase session (tầng bền) → chỉ khi **cả 2 fail** mới `onAuthExpired` → logout. Single-flight để 401 đồng thời không đá nhau khi BE rotate refresh token. Refresh TTL nâng 7d→30d.
- `auth/AuthContext.tsx` — `AuthProvider` + `useAuth`: bootstrap session, login email/Google, sign out.
- `pages/LoginPage.tsx` — đăng nhập/đăng ký (email + Google + **khách/anonymous**), style theo mockup.
- `App.tsx` — gate: loading → splash, chưa login → LoginPage, đã login → app.
- `ProfilePage` nối `GET /users/me` (tên, @username, bio, XP, level, số cờ, hành trình) + nút đăng xuất. **Sửa hồ sơ** qua `EditProfileSheet`: đổi `display_name`/`bio` (`PATCH /users/me`) + upload avatar (`POST /users/me/avatar`, multipart) → `applyUser()` cập nhật user trong AuthContext ngay (không reload).
- `components/UpgradeBanner.tsx` + `upgradeAccount()` — khách nâng cấp lên tài khoản thật (`updateUser`), giữ nguyên data.

### Checkpoint / Map (Phase 2 ✅ — nối API thật)
- **MapPage**: `react-map-gl/maplibre` + OpenFreeMap, fetch theo viewport (`?bbox`) qua **TanStack Query**, markers theo category. Lazy-load (maplibre ~284KB tách chunk riêng).
- **CreateCheckpointSheet**: CHECK-IN lấy GPS → form (name/category/note/rating/ảnh) → `POST /checkpoints` + upload ảnh → invalidate query → toast `+XP`.
- **CheckpointDetailSheet**: tap marker → `GET /checkpoints/{id}` (ảnh, note, rating, author). Ảnh xem bằng **react-photo-view** (zoom / xoay / kéo). **Xóa check-in** (chỉ chủ sở hữu — `user_id === user.id`) qua hook chung `useDeleteCheckpoint` (xem dưới).
- **`hooks/useDeleteCheckpoint(id, {onDeleted})`** — flow xóa **dùng chung** (detail sheet + Discover feed card): sở hữu confirm 2 bước (`requestDelete`/`confirming`/`confirmBox` — caller tự đặt trigger + vị trí confirm box, không dùng window.confirm) → `DELETE /checkpoints/{id}` (hard) → invalidate checkpoints/feed/passport/journeys + refresh `getMe` (XP bị trừ lại). Pattern giống `useCheckin` (hook trả UI node).
- **Image picker** (lúc tạo): thumbnail list + preview (react-photo-view) + xóa từng ảnh; object URL được revoke khi xóa/unmount.
- **Camera check-in**: trên thiết bị touch và secure context, khu vực ảnh mở `CameraCaptureSheet` dùng `react-webcam`, hỗ trợ preview, lật camera trước/sau, chọn lens và ghi nhớ lens theo từng hướng camera. Nếu camera không mở được, người dùng vẫn có thể chọn ảnh từ thư viện. Desktop dùng file picker. Tất cả ảnh đều qua `prepareImage` (HEIC → JPEG + downscale).
- **Check-in 2 kiểu** (content tách khỏi Sheet): `CreateCheckpointForm` + `LocationPermissionContent` render trong **Sheet** (nút Map, qua `useCheckin`) hoặc **full-page** (tab Create → success tự về Map). Form hiện **banner hành trình đang active** (🧳 "Đang ghi cho hành trình '…'") khi có — vì BE tự gắn check-in vào active journey.
- **LocationPermissionSheet**: chưa grant → popup giải thích rồi mới gọi native prompt. Khi **denied** → hướng dẫn bật lại **theo nền tảng + chế độ PWA** (Android/iOS/desktop × standalone/tab) + tự phát hiện khi user bật lại (Permissions API `onchange` → auto continue). Không có web API mở settings nên chỉ hướng dẫn được.
- **`lib/geo.ts` — định vị bền cho PWA**: Permissions API (`navigator.permissions.query`) **không đáng tin trên iOS Safari/PWA** (mở lại app trả `"prompt"` dù OS vẫn nhớ đã cấp → app xin quyền lại = "mất permission"). Fix: coi Permissions API là *gợi ý*, cứ **thử `getCurrentPosition`** (không hiện prompt nếu còn quyền), chỉ fallback UI khi `PERMISSION_DENIED`; + cờ `localStorage` (`cp.geo.located`) đánh dấu "đã định vị thành công" làm tín hiệu bền. Helper: `canLocateSilently()`, `getCurrentCoords()`, `markAutoAskDismissed()`/`wasAutoAskDismissed()` (`cp.geo.autoAskDismissed`).
- **`location/LocationProvider.tsx` — vị trí dùng chung (context + `useUserLocation`)**: mount 1 lần ở `AppLayout`, locate 1 lần, mọi page lấy `lat/lng` qua `const { coords, status, request } = useUserLocation()` thay vì tự `useEffect`. **Vào app lần đầu**: nếu chưa định vị im lặng được → **tự hỏi 1 lần** (explainer sheet); user **hủy → nhớ** (`autoAskDismissed`), không tự hỏi lại. Nghe `permissions` `onchange` để bắt khi user bật quyền ở Settings. Dùng ở **DiscoverPage** (feed "gần bạn") + **MapPage** (`flyTo` về vị trí user lần đầu biết).
- **2 loại định vị tách bạch**: *Ambient* (provider, best-effort, tôn trọng cờ hủy) vs *Bắt buộc* (`useCheckin` — check-in/cắm cờ **luôn hỏi**, lấy vị trí tươi, **không** đọc cờ hủy).
- **ProfilePage**: "Khoảnh khắc" nối `GET /checkpoints/me` (empty state khi chưa có). Nút 📷 ở tiêu đề mở luôn flow **check-in** (qua `useCheckin` — cùng GPS/permission/form/toast như nút CHECK-IN ở Map); xong tự invalidate `["checkpoints"]` → gallery cập nhật.
- `lib/maps.ts` (style + categories), `lib/api.ts` (checkpoint endpoints), `components/ui/{Sheet,Toast}`.

### Discovery (Phase 4 ✅)
- **DiscoverPage**: feed cộng đồng **sắp gần → xa** (`distance_m`, hiện "cách X km") qua **`useInfiniteQuery`** (keyset cursor) + infinite scroll (IntersectionObserver callback-ref); search địa điểm (debounce, pg_trgm) → **PlaceDetailSheet**. **Xóa từ feed**: icon 🗑 trên card **chỉ với check-in của mình** (so `author.username === user.username` — feed không trả `user_id`) → dùng chung `useDeleteCheckpoint`.
- **PWA no-zoom**: viewport `maximum-scale=1, user-scalable=no` + `touch-action: manipulation` (tắt pinch/double-tap zoom toàn app; map giữ gesture riêng).
- **PlaceDetailSheet**: ảnh (react-photo-view), avg rating, số lượt cắm cờ, review gần đây, nút **"Cắm cờ tại đây"** → place-based check-in (gửi `place_id`, prefill+khóa tên).
- **Auth Google + anonymous**: `loginGoogle` rẽ nhánh — khách → `linkIdentity` (giữ data), thường → `signInWithOAuth`; nút "Liên kết Google" trong UpgradeBanner; bắt lỗi OAuth redirect (identity trùng) hiển thị tiếng Việt.

### Gamification (Phase 5 ✅)
- **Profile edit** (`EditProfileSheet`): sửa tên/bio + đổi avatar → `applyUser()` cập nhật ngay (xem mục Auth/Checkpoint).
- **Cấp độ (G1)**: ProfilePage progress bar dùng `level_progress`/`xp_to_next` thật (bỏ hardcode).
- **Hộ chiếu (G2)** `PassportSection`: lưới con dấu tỉnh đã check-in (`GET /me/passport`) — tên tỉnh, số lần, ảnh đại diện; empty state.
- **Bảng xếp hạng (G3)** `LeaderboardPage` (route `/leaderboard`, link từ Profile): top theo XP (`GET /leaderboard`), huy chương 🥇🥈🥉, highlight mình, ghim hàng "mình" nếu ngoài top.
- **Huy hiệu (G4)** `BadgesSection`: lưới catalog thật (`GET /me/badges`) mở khóa/khóa (🔒 + grayscale), đếm `unlocked/total`.
- **Toast khoe huy hiệu**: check-in trả `new_badges` (object có tên/icon) → `BadgeUnlockToast` (Map) + màn success place check-in hiện huy hiệu vừa mở. Invalidate `["badges"]`/`["passport"]` sau check-in.
- **Share card (#9 + J5)** — **Canvas2D** (`lib/shareCard.ts`): vẽ card→PNG bằng `<canvas>` (`drawImage` ảnh object-cover + `fillText` wrap + gradient + font Montserrat qua `document.fonts.load`). **Lý do bỏ html-to-image**: nó dùng SVG `<foreignObject>` → **WebKit/iOS render `<img>` bên trong ra TRẮNG** (desktop OK, iPhone mất ảnh). Canvas2D chạy mọi nền tảng. `renderCheckpointCard`/`renderJourneyCard`/`renderProfileCard` (model "block" stack: photos/header/quote/stats/footer). `ShareButton` nhận `render: () => Promise<Blob>` → `shareImageBlob` (Web Share file + `url` → fallback download → text).
  - Ảnh load `crossOrigin="anonymous"` + query `?cors=1` (né bản `<img>` cache không-CORS); cần **R2 CORS** (đã bật — r2.dev trả ACAO đúng). Ảnh fail → bỏ qua.
  - **Deep link**: Web Share **`url`** (`${window.location.origin}/c/{id}` · `/j/{id}`). Route `/c/:id` `/j/:id` (`pages/LinkRoutes.tsx`) mở detail sheet; URL sống qua màn login. `JourneyLink` lazy.

### Journey (Phase 3 ✅)
- **JourneysSection** (trong Profile): list hành trình + "Bắt đầu/Kết thúc hành trình" (banner active). Tạo journey → set active → check-in tự gắn vào.
- **JourneyDetailSheet** (lazy → maplibre tách chunk): stats + **map dotted route** (flex-1, cao lên khi kéo Sheet) + timeline. Mỗi point có ảnh → **StopPhotoStack** trên marker (2 lá xếp chồng + "+N" placeholder, bấm → lightbox ảnh của point đó, caption name/note/address); point không ảnh → chấm số. `Sheet grow` = body flex-col để map giãn theo kích thước sheet. BE: `Stop` kèm `note/address/images`.

### UI components & pages (tĩnh — chưa nối API)
- **UI primitives:** `Button` (primary/accent/green/outline, pill), `Chip`, `XPBadge`, `Card`, `ImagePlaceholder`, `Skeleton` (+ `DetailSheetSkeleton` dùng chung).
- **Skeleton loading:** thay text "Đang tải..." bằng skeleton khớp layout (chống nhảy CLS) ở Discover feed (+load thêm), Leaderboard, Hộ chiếu, Huy hiệu, Khoảnh khắc (Profile), và 3 detail sheet (checkpoint/place/journey). Giữ pin-pulse cho splash app + spinner định vị GPS.
- **Map skeleton** (`MapSkeleton`, ở main bundle): overlay faux-map + pin pulse phủ map tới khi maplibre `onLoad` (`mapReady`) rồi fade. Dùng **chung** làm Suspense fallback của route map → liền mạch: vào tab → tải chunk → init map → map hiện.
- **Resilience:** `ErrorBoundary` (bọc App) → crash hiện "Có lỗi, tải lại" thay vì trắng màn hình; `lib/lazyWithRetry` → import chunk fail (PWA stale-SW sau deploy) tự reload 1 lần (cờ sessionStorage chống loop), áp cho MapPage; `<Map onError>` log lỗi maplibre.
- **Image pipeline** (`lib/image.ts` `prepareImage`): ảnh check-in qua **HEIC→JPEG** (`heic2any`, lazy-import — tách chunk, chỉ tải khi gặp HEIC) + **downscale canvas** (max cạnh 1600px, JPEG q0.85) → mọi upload là JPEG nhẹ (< 10 MiB, đúng whitelist BE). Check-in tách lỗi nửa chừng: tạo checkpoint OK nhưng upload ảnh fail → vẫn hoàn tất (không tạo trùng, không báo lỗi sai); `uploadCheckpointImages` map 415/413 → message VN.
- **BottomNav:** 5 tab Map · Discover · Create · AI Plan · Profile (active pill cam/xanh).
- **5 màn** dựng theo mockup: MapPage (search + level + faux map + CHECK-IN), DiscoverPage (feed + tabs), CreatePage (form cắm cờ), AIPlanPage (trợ lý AI + timeline), ProfilePage (hộ chiếu + huy hiệu).

## File chính

```
src/
  main.tsx App.tsx index.css      (router + tokens)
  lib/cn.ts
  components/ AppLayout BottomNav  ui/{Button,Card,Chip}
  pages/ Map Discover Create AIPlan Profile
vite.config.ts  wrangler.jsonc  index.html
```

## Còn thiếu (quan trọng)

- 🟡 **Discover + AIPlan vẫn data giả** — Map/Profile/auth đã nối thật. (CreatePage tab cũ giờ thừa, check-in thật qua sheet trên Map.)
- ❌ Chưa có state management / data fetching cache (gợi ý: TanStack Query) — hiện gọi fetch trực tiếp.
- ❌ Chưa có map thật (gợi ý: Mapbox GL), ảnh thật, hay xử lý GPS.
- ⚠️ `npm audit` báo vài lỗ hổng từ dev-deps (không ảnh hưởng bundle production).

## Cách chạy

```bash
cd web
npm install
npm run dev          # http://localhost:5173
npm run build        # -> dist/
npm run deploy       # build + wrangler deploy
```

## Bước kế hợp lý cho FE

1. `lib/supabase` (Supabase JS client) → login → lấy supabase_token.
2. `lib/api` → `POST /auth/exchange` → lưu app_token/refresh_token, interceptor tự refresh.
3. Thay data giả ở ProfilePage bằng `GET /users/me` (feature đầu tiên BE đã sẵn sàng).
