# Checkpoint: Kế hoạch Migration từ Web PWA sang React Native

**Quyết định: React Native (Expo).** Team chọn RN vì tận dụng được kỹ năng React/TypeScript hiện có, tái dùng code web tối đa, và không muốn duy trì codebase Dart dài hạn.

Cập nhật: 2026-06-23.  
Phạm vi quét: `web/` (React/Vite/TS) — toàn bộ src code.  
Tình trạng `mobile/` (Flutter scaffold cũ): **bỏ**, xây RN từ đầu.  
Nguồn tham khảo: `docs/flutter-migration-and-image-cache-plan.md` (kế hoạch cũ, giữ lại làm tài liệu tham khảo về API mapping, Firestore, media pipeline — dùng chung được vì backend contract không đổi).

---

## 1. Web hiện tại dưới dạng PWA

### 1.1 Stack thực tế

| Lớp | Công nghệ |
| --- | --- |
| UI framework | React 19 (`react`, `react-dom` ^19) |
| Build | Vite 6 + `@vitejs/plugin-react` |
| Styling | Tailwind CSS v4 (`@tailwindcss/vite`) |
| Routing | `react-router-dom` v7 (SPA, lazy `MapPage`) |
| Server state | TanStack Query v5 + `@tanstack/react-virtual` |
| Auth | Supabase (`@supabase/supabase-js`) + backend bearer token exchange |
| Realtime/data | Firebase/Firestore (`firebase` ^12) — comments, notifications |
| Bản đồ | MapLibre GL + `react-map-gl` + `supercluster` (clustering) |
| Media | `exifr` (EXIF), `heic2any` (HEIC→JPEG), `react-easy-crop`, `react-webcam`, `react-photo-view` |
| i18n | `i18next` + `react-i18next` (vi/en) |
| Khác | `qrcode`, `lucide-react` (icons), `axios` |
| Deploy | Cloudflare (`wrangler deploy`) |

Đây là **SPA thuần** (không SSR/Next.js). Backend là Go, hợp đồng API mô tả trong `web/src/lib/api.ts`.

### 1.2 Mức độ "PWA" của app — đã làm tốt

Cấu hình PWA khá nghiêm túc (`web/vite.config.ts`, `web/index.html`):

- **`vite-plugin-pwa` + Workbox** với `registerType: "autoUpdate"`, `cleanupOutdatedCaches`, `clientsClaim`, `skipWaiting`. Tự cập nhật SW nền + reload qua `PWAUpdatePrompt` (`virtual:pwa-register`).
- **Web App Manifest đầy đủ**: `display: standalone`, `orientation: portrait`, `theme_color #F4511E`, `background_color`, scope/start_url `/`, `categories: [travel, social, lifestyle]`, icon 192/512 (cả `any` lẫn `maskable`).
- **Deep-link handling cho PWA cài đặt**: `launch_handler: { client_mode: ["navigate-existing", "auto"] }` + `handle_links: "preferred"` → Android Chrome bắt link `/c/:id` vào app đã cài.
- **iOS standalone**: `apple-mobile-web-app-capable`, `status-bar-style: black-translucent`, apple-touch-icon + splash screens sinh tự động (`@vite-pwa/assets-generator`, `pwa-assets.config.ts`).
- **Safe-area**: `viewport-fit=cover` + `env(safe-area-inset-*)` trong layout.
- **Runtime cache ảnh**: Workbox `CacheFirst` cho ảnh checkpoint (maxEntries 100, TTL 1 năm, chấp nhận opaque status 0).
- **Install UX**: có `InstallHint` (gợi ý cài trên iOS) và bottom-nav login wall cho khách ẩn danh.

### 1.3 Hạn chế cố hữu của PWA (lý do cân nhắc native)

Đây là động lực chính để rời PWA — app phụ thuộc nhiều khả năng thiết bị:

1. **Camera / capture**: dùng `react-webcam` + `getUserMedia`. Trên iOS Safari/PWA, camera web bị giới hạn (không kiểm soát tốt zoom, lấy nét, hướng ảnh; không có chế độ chụp gốc; chất lượng kém hơn native).
2. **Ảnh HEIC**: phải convert client-side bằng `heic2any` (tốn CPU, chậm, dễ lỗi) — native xử lý HEIC + metadata gốc.
3. **EXIF GPS/taken_at**: web đọc EXIF bằng `exifr`; nhiều trình duyệt/iOS strip metadata khi chọn ảnh → mất GPS.
4. **Geolocation nền/độ chính xác**: chỉ có foreground geolocation; không có background location, độ chính xác/độ trễ kém hơn `geolocator` native.
5. **Push notification**: iOS chỉ hỗ trợ Web Push khi PWA đã được cài (A2HS) và hạn chế; hiện app dùng Firestore subscription + derived feed, **không có push thật**. Native (FCM/APNs) đáng tin cậy hơn.
6. **Cài đặt / khám phá**: PWA không có mặt trên App Store/Play Store; install trên iOS phải qua "Add to Home Screen" thủ công → tỷ lệ cài thấp.
7. **Lưu trữ & offline**: chỉ cache ảnh + SPA shell; check-in queue lưu `localStorage` (giới hạn, dễ bị xóa). Không offline-first thật.
8. **OAuth tích hợp (Google Drive/Photos)**: redirect web; trong PWA standalone dễ rớt context, cần xử lý callback riêng.

> Kết luận phần 1: PWA hiện tại **tốt cho web/share/deep-link** nhưng **chạm trần** ở camera, media metadata, location nền, và push — đúng những tính năng cốt lõi của một app "check-in du lịch". Đây là lý do hợp lý để có một app native song song (giữ PWA tiếp tục chạy).

---

## 2. Bản đồ tính năng cần port (nguồn từ `web/`)

### 2.1 Routes
- Công khai (ẩn danh): `/` (map), `/discover`, `/leaderboard`, `/c/:id`, `/p/:id`, `/j/:id`, `/u/:username`, `/login`, `/privacy`, `/terms`.
- Cần đăng nhập: `/create`, `/ai-plan`, `/profile`, `/badges` + các deep-link công khai với hành động đã đăng nhập.

### 2.2 Khối tính năng
Auth/guest (Supabase + token exchange) · Map + clustering + bbox fetch · Location (ambient vs mandatory) · Check-in form (place/journey/media) · Upload slots + direct R2 PUT · Photo check-in (EXIF) · Camera · Discover/following feed · Profile + followers/following · Comments & notifications (Firestore) · Journeys · Badges/leaderboard/passport · Google Drive/Photos OAuth · i18n (vi/en).

(Chi tiết hợp đồng API và Firestore mapping đã liệt kê đầy đủ trong `docs/flutter-migration-and-image-cache-plan.md`, mục "Backend API Mapping" và "Firestore Mapping" — dùng chung được vì backend contract không đổi.)

---

## 3. Stack React Native đề xuất

### 3.1 Công nghệ

| Vai trò | Thư viện / Tool | Lý do |
| ------- | --------------- | ----- |
| Framework | **Expo SDK 52+** (managed workflow) | EAS Build, OTA Update (EAS Update), prebuild cho native module |
| Ngôn ngữ | TypeScript | Tái dùng types từ web |
| Navigation | **expo-router** (file-based routing) | Deep link / universal links built-in, map 1:1 với web routes |
| Server state | **TanStack Query v5** (giữ nguyên) | Tái dùng keys, cache policy, invalidation pattern |
| HTTP | **axios** (giữ nguyên client) | Copy gần nguyên `lib/api.ts` |
| Auth | **@supabase/supabase-js** + **expo-secure-store** | Supabase JS SDK hỗ trợ RN |
| Map | **@maplibre/maplibre-react-native** | Giữ style/tiles/zoom với web |
| Location | **expo-location** | foreground + background + geofencing |
| Camera | **expo-camera** + **expo-image-picker** | Native camera control, gallery pick |
| Image processing | **expo-image-manipulator** | Resize, crop, compress |
| EXIF | **expo-media-library** + **exif-parser** (hoặc expo-image-manipulator) | GPS, takenAt |
| HEIC | Native iOS (bỏ heic2any) | iOS picker trả JPEG sẵn; Android không dùng HEIC |
| Video | **expo-video-thumbnails** | Thumbnail cho video pick |
| Firestore | **@react-native-firebase/firestore** | comments, notifications |
| Push | **@react-native-firebase/messaging** (FCM/APNs) | Nâng cấp so với PWA |
| Image cache | **expo-image** (built-in cache) | Thay Workbox runtime cache |
| i18n | **i18next** + **react-i18next** (giữ nguyên) | Seed từ `lib/locales/*.json` |
| Local storage | **expo-secure-store** + **@react-native-async-storage/async-storage** / **react-native-mmkv** | Thay localStorage keys (`cp_*`) |
| SVG icons | **react-native-svg** + **lucide-react-native** | Thay lucide-react DOM |
| Share sheet | **expo-sharing** | Native share sheet |
| OAuth browser | **expo-web-browser** | Google Drive/Photos auth |
| Styling | **NativeWind v4** (Tailwind CSS cho RN) | Giữ cú pháp Tailwind, giảm ma sát chuyển CSS |
| Animations | **react-native-reanimated** | Native animations |
| Gesture | **react-native-gesture-handler** | Swipe, sheet, drag |
| QR code | **react-native-qrcode-svg** | Thay qrcode package |
| Notifications | **expo-notifications** + FCM | Local + push notif |
| Compose avatar | **@shopify/react-native-skia** (hoặc Canvas API) | Thay canvas composite |

### 3.2 Tái dùng được gần như nguyên

Nhóm này copy trực tiếp từ `web/src/lib/`, chỉ cần thay đổi tối thiểu:

| File web | Vai trò | Sửa đổi cho RN |
| -------- | ------- | -------------- |
| `lib/api.ts` | Backend HTTP client + types + DTOs | Thay `localStorage` → MMKV, xoá `localStorage`-based token store, giữ nguyên axios client, interceptor, types |
| `lib/api.ts` — interfaces | `User`, `Checkpoint`, `Place`, `CheckinInput`, `Journey`, `Badge`, `UploadSlot`, etc. | Copy nguyên |
| `lib/geo.ts` | getCurrentCoords, canLocateSilently, location flags | Thay `navigator.geolocation` → `expo-location`, giữ logic flags |
| `lib/i18n.ts` + `locales/*.json` | i18next config + translation | Giữ nguyên (chỉ thay `LanguageDetector` bằng `expo-localization`) |
| `lib/settings.ts` | cp.settings.* keys | Thay `localStorage` → MMKV/AsyncStorage |
| `lib/guestSession.ts` | cp_has_real_account, cp_guest_logged_out | Thay `localStorage` → MMKV |
| `lib/share.ts` | Web Share API | Thay `navigator.share` → `expo-sharing` |
| `lib/authErrors.ts` | Auth error messages | Copy nguyên (logic thuần) |
| `lib/cn.ts` | clsx utility | Copy nguyên |
| `lib/maps.ts` | MAP_STYLE, DEFAULT_VIEW, CATEGORIES | Copy nguyên |
| `lib/checkpointImages.ts` | CDN URLs | Copy nguyên |

### 3.3 Phải viết lại

Nhóm này không thể tái dùng trực tiếp vì khác platform:

| Web | RN replacement | Lý do |
| --- | -------------- | ----- |
| Tailwind DOM components | NativeWind + RN components | DOM → RN, className → style |
| `react-router-dom` routes | expo-router file-based routes | Platform navigation khác |
| `lib/supabase.ts` (createClient) | `@supabase/supabase-js` + `expo-auth-session` | RN auth flow khác web |
| `auth/AuthContext.tsx` | Auth context/phần mới (React Context hoặc Zustand) | RN không có BrowserRouter |
| `lib/image.ts` prepareImage / prepareCheckpointImage | `expo-image-manipulator` | Canvas API không có trên RN |
| `lib/exif.ts` extractPhotoMetadata | `expo-media-library` + `exif-parser` | exifr không chạy RN |
| `lib/video.ts` | `expo-video-thumbnails` | Web video API khác |
| `lib/avatarComposite.ts` canvas composite | `@shopify/react-native-skia` | Canvas → Skia |
| `lib/comments.ts` (Firestore) | `@react-native-firebase/firestore` | Firebase SDK khác |
| `lib/notifications.ts` (Firestore) | `@react-native-firebase/firestore` | Firebase SDK khác |
| `lib/firebase.ts` | `@react-native-firebase/app` | Firebase config RN |
| `lib/observability.ts` | Firebase Analytics RN SDK | Firebase SDK RN |
| `lib/shareCard.ts` Canvas2D render | `react-native-view-shot` or Skia render | Canvas → native |
| `lib/platform.ts` | `expo-device` + `Platform.OS` | Platform detect RN |
| `components/` (toàn bộ UI) | RN components + NativeWind | DOM → RN, Tailwind → NativeWind |
| `context/` providers | React Context (giống pattern, viết lại logic) | RN không có Browser events |
| `hooks/` DOM-dependent | RN hooks | Platform adaptation |
| `LocationProvider` | `expo-location` + context | Platform-specific |
| Map clustering | `supercluster` JS (chạy được trên RN) | Giữ được supercluster |
| `react-webcam` CameraCaptureSheet | `expo-camera` CameraView | Native camera API |
| `heic2any` HEIC conversion | Bỏ (iOS picker trả JPEG) | Không cần convert |
| PWA helpers (InstallHint, PWAUpdatePrompt) | Bỏ | Thay bằng EAS Update OTA |

### 3.4 Tổ chức thư mục RN đề xuất

```
mobile-rn/
  app/                    # expo-router file-based routes
    _layout.tsx           # RootLayout (providers + shell)
    index.tsx             # Map tab
    discover.tsx
    create.tsx
    ai-plan.tsx
    profile.tsx
    leaderboard.tsx
    badges.tsx
    login.tsx
    [c]/[id].tsx          # Checkpoint deep link
    [p]/[id].tsx          # Place deep link
    [j]/[id].tsx          # Journey deep link
    [u]/[username].tsx    # User profile deep link
    privacy.tsx
    terms.tsx
  src/
    lib/                  # Copied & adapted from web/src/lib/
      api.ts              # axios client + all API functions + types
      geo.ts
      i18n.ts
      locales/
      settings.ts
      guestSession.ts
      authErrors.ts
      maps.ts
      checkpointImages.ts
      cn.ts
      share.ts
    services/             # RN-only service layer
      auth.ts             # Auth context + provider
      location.ts         # expo-location provider
      firebase.ts         # Firebase init
      comments.ts         # Firestore comments
      notifications.ts    # Firestore notifications + FCM
      image.ts            # expo-image-manipulator pipeline
      exif.ts             # EXIF extraction
      video.ts            # Thumbnail generation
      avatar.ts           # Skia composite
      observability.ts    # Firebase Analytics
    components/           # Shared RN components
      ui/                 # Button, Chip, Card, Sheet, Toast, Skeleton...
      MapView.tsx         # MapLibre RN wrapper
      CheckpointDetail.tsx
      PlaceDetail.tsx
      JourneyDetail.tsx
      CommentSection.tsx
      NotificationSheet.tsx
      ReactionBar.tsx
      CameraSheet.tsx
      MediaPreview.tsx
      UserAvatar.tsx
      ... (mirror web components)
    screens/              # Screen-level components (nếu ko dùng expo-router file colocation)
    hooks/                # Custom hooks
    context/              # React contexts
    theme/                # NativeWind config + tokens
    types/                # Shared types, re-exported from api.ts
    utils/                # Utility functions
  app.json                # Expo config
  tailwind.config.js      # NativeWind config
  package.json
  tsconfig.json
  eas.json                # EAS Build config
```

> **Lưu ý:** expo-router có thể dùng cả file-based (mỗi route 1 file trong `app/`) hoặc colocation code trong cùng file. Recommend: `app/` chỉ chứa route entry points mỏng, logic nặng đặt trong `src/screens/` và `src/components/`.

---

## 4. Lộ trình Phase chi tiết (React Native)

### Phase 0 — Contract freeze & Setup (1-2 ngày)

**Mục tiêu:** Xác định contracts, tạo project RN, config CI.

**Công việc:**
1. Tạo project Expo mới: `npx create-expo-app@latest mobile-rn --template blank-typescript`
2. Cài dependencies core: `expo-router`, `@tanstack/react-query`, `axios`, `@supabase/supabase-js`, `expo-secure-store`, `@react-native-async-storage/async-storage`, `nativewind`, `tailwindcss`, `i18next`, `react-i18next`, `expo-localization`
3. Cấu hình NativeWind v4 (giữ design tokens từ `web/src/index.css`)
4. Cấu hình expo-router với file-based routing + deep link scheme
5. Setup CI: `tsc --noEmit`, lint, test
6. Copy `web/src/lib/locales/*.json` vào project
7. Copy `web/src/lib/api.ts` — types + DTOs (chỉnh sửa token storage từ localStorage → MMKV/secure-store)

**Backend:** Verify only — xác nhận endpoints cho mobile.

### Phase 1 — Auth & Session (3-4 ngày)

**Mục tiêu:** Login, register, guest, token exchange, session restore.

**Công việc:**
1. Setup Supabase client RN (`@supabase/supabase-js` + `expo-auth-session`)
2. Port `lib/guestSession.ts` → MMKV storage
3. Port `lib/api.ts` auth functions: `exchange()`, `getMe()`, `loginWithPassword()`, `logout()`
4. Build `AuthContext` (React Context): session restore, Supabase exchange, token interceptor, onAuthExpired
5. Build Login screen: email/password, Google OAuth (`expo-auth-session`), anonymous guest, upgrade account
6. Bearer token interceptor (axios interceptor): attach token, 401→refresh→retry→logout
7. Secure token storage: `expo-secure-store` for `cp_access_token` / `cp_refresh_token`

**Web files cần đọc:** `lib/supabase.ts`, `lib/api.ts` (auth section), `lib/guestSession.ts`, `lib/authErrors.ts`, `auth/AuthContext.tsx`, `pages/LoginPage.tsx`, `components/UpgradeBanner.tsx`.

**Exit criteria:** Cold start restores session, login/logout/guest flow hoạt động.

### Phase 2 — Shell, Theme, i18n, Assets (3-4 ngày)

**Mục tiêu:** App shell giống PWA, navigation, theme, locale, static assets.

**Công việc:**
1. Thiết kế NativeWind theme tokens dựa trên `web/src/index.css` (primary/clay/green/accent/neutral palette)
2. Build app shell: Header (brand + notification bell), BottomNav (5 tabs), content area, safe-area
3. Route guard: anonymous routes (public) vs signed-in routes (private)
4. Port i18n config: `i18next` + `react-i18next` + `expo-localization`
5. BottomNav: 5 tabs giống web (Map, Discover, Create, AI Plan, Profile) + active state styling
6. Static art từ CDN `media.checkpoint-app.space` (giống web `lib/checkpointImages.ts`)
7. UI primitives: `Button` (primary/accent/green/outline), `Chip`, `Card`, `Skeleton`, `Sheet` (bottom sheet), `Toast`, `UserAvatar`, `Icon` (SVG registry từ `lucide-react-native`)

**Web files cần đọc:** `App.tsx`, `components/AppLayout.tsx`, `components/BottomNav.tsx`, `components/nav/*`, `components/ui/*`, `lib/checkpointImages.ts`, `lib/platform.ts`, `context/AuthGate.tsx`.

**Exit criteria:** App hiển thị shell với navigation, theme giống web, locale switching hoạt động.

### Phase 3 — Map, Location & Deep Links (4-5 ngày)

**Mục tiêu:** MapLibre map, user location, markers, clustering, deep links.

**Công việc:**
1. Setup `@maplibre/maplibre-react-native` với map style từ `lib/maps.ts`
2. Copy `lib/maps.ts` — MAP_STYLE, DEFAULT_VIEW, CATEGORIES
3. Build `LocationProvider` (context) với `expo-location`:
   - Ambient vs mandatory location (giống web)
   - Permission request + explainer sheet
   - `getCurrentCoords()`, `canLocateSilently()`, location flags (`cp.geo.*`)
4. Map screen:
   - Fetch checkpoints theo bbox (`/checkpoints?bbox=...&limit=300`) với debounce
   - Category filter pills (cafe/food/view/nature/other)
   - Filter "all / mine / following"
   - Giữ markers cũ khi đang fetch bbox mới
5. Clustering với `supercluster` (JS, chạy được trên RN)
6. User location marker + fly-to
7. Deep links: `expo-router` path-based cho `/c/:id`, `/p/:id`, `/j/:id`, `/u/:username`
   - Cấu hình `app.json` scheme + universal links (iOS) + app links (Android)
8. Map skeleton loading state

**Web files cần đọc:** `lib/geo.ts`, `lib/maps.ts`, `location/LocationProvider.tsx`, `components/LocationPermissionSheet.tsx`, `components/MapSkeleton.tsx`, `pages/MapPage.tsx`, `pages/LinkRoutes.tsx`.

**Exit criteria:** Map hiển thị với markers, bbox fetch hoạt động, deep links từ cold start mở đúng màn hình.

### Phase 4 — Check-in & Media Pipeline (5-7 ngày)

**Mục tiêu:** Check-in flow: GPS + photo + camera, upload slots, image processing.

**Công việc:**
1. **Image pipeline** (`src/services/image.ts`):
   - `prepareCheckpointImage()`: resize max edge 2560, JPEG q0.9, thumbnail 640×360 (giống web)
   - Dùng `expo-image-manipulator` thay canvas API
   - HEIC: iOS picker trả JPEG sẵn (test + fallback nếu cần)
2. **EXIF extraction** (`src/services/exif.ts`):
   - Dùng `expo-media-library` hoặc `exif-parser` để đọc GPS + takenAt
   - Filter null-island (0,0)
3. **Video pipeline** (`src/services/video.ts`):
   - `expo-video-thumbnails` cho thumbnail
   - Giới hạn 10s/60MiB (giống web)
4. **Upload pipeline**:
   - Copy logic `getUploadSlots()` + `putFilesToSlots()` từ `lib/api.ts`
   - Upload trực tiếp R2 bằng `fetch()` (có sẵn trên RN)
   - Queue retry với MMKV khi offline
5. **Create check-in screen**:
   - Tab GPS: lấy location → form (name, category, note, rating, journey picker, image picker)
   - Tab Photo: pick ảnh từ gallery → EXIF GPS → form prefill (giống `PhotoCheckinTab`)
   - Camera sheet: `expo-camera` front/back, flash, chụp nhiều ảnh
   - Journey picker dropdown (list active journeys, mặc định chọn mới nhất)
   - Nearby place suggestions (khoảng 50m)
6. **Upload success → XP toast + badge unlock**
7. **Check-in queue offline**: MMKV persist + retry khi online lại

**Web files cần đọc:** `lib/api.ts` (check-in functions, upload slots), `lib/image.ts`, `lib/exif.ts`, `lib/video.ts`, `components/CreateCheckpointForm.tsx`, `components/CreateCheckpointSheet.tsx`, `components/CameraCaptureSheet.tsx`, `components/PhotoCheckinTab.tsx`, `components/MediaPreview.tsx`, `hooks/useCheckin.tsx`, `context/CheckinQueue.tsx`, `pages/CreatePage.tsx`.

**Exit criteria:** Check-in online hoạt động (GPS + photo + camera), upload R2 thành công, queue retry khi offline.

### Phase 5 — Detail Surfaces (3-4 ngày)

**Mục tiêu:** Checkpoint, Place, Journey detail screens, reactions, share.

**Công việc:**
1. **CheckpointDetailScreen** (giống `CheckpointDetailSheet`):
   - Image carousel + zoom (photo viewer)
   - Checkpoint info: name, category, rating, note, address, XP
   - Author info + profile link
   - Reaction bar (5 reactions: like/love/fire/haha/sad) với optimistic UI
   - Comment section (Firestore — Phase 5b)
   - Share button
   - Delete (owner only) — 2-step confirm
2. **PlaceDetailScreen** (giống `PlaceDetailSheet`):
   - Place images, avg rating, checkin count
   - Recent reviews
   - "Cắm cờ tại đây" button → place-based check-in
3. **JourneyDetailScreen** (giống `JourneyDetailSheet`):
   - Stats (checkpoint_count, total_xp, distance_km)
   - Map route (dotted line)
   - Timeline stops với ảnh
4. **ReactionBar** component:
   - GET/POST/DELETE `/checkpoints/{id}/reaction(s)`
   - Optimistic update (giống web `applyOptimistic`)
   - Login prompt cho anonymous user
5. **ShareButton**: `expo-sharing` share link + text
6. **View count**: `POST /checkpoints/{id}/view` fire-and-forget

**Web files cần đọc:** `components/CheckpointDetailSheet.tsx`, `components/PlaceDetailSheet.tsx`, `components/JourneyDetailSheet.tsx`, `components/ReactionBar.tsx`, `components/MediaPreview.tsx`, `components/share/ShareButton.tsx`, `components/CommentSection.tsx`, `hooks/useDeleteCheckpoint.tsx`, `lib/share.ts`.

**Exit criteria:** Detail screens hiển thị đúng dữ liệu, reactions hoạt động, share mở native sheet.

### Phase 5b — Comments & Notifications (Firestore) (3-4 ngày)

**Mục tiêu:** Comments và notification system giống web.

**Công việc:**
1. Setup `@react-native-firebase/app` + `@react-native-firebase/firestore`
2. Port `lib/comments.ts` → Firestore service:
   - `fetchComments()` cursor pagination (20 items/page)
   - `addComment()`, `deleteComment()`
   - `getCommentCount()`
   - Author hydration qua `getUsersByIDs()`
3. **CommentSection** component:
   - Infinite scroll (Firestore cursor)
   - Text input (chỉ hiện khi đã login)
   - Delete button (chỉ comment của mình)
4. Port `lib/notifications.ts`:
   - `subscribeNotifications()` Firestore onSnapshot
   - `addCommentNotification()`, `addFollowNotification()`, `addReactionNotification()`
5. **NotificationProvider** (context):
   - Merge Firestore notifications + derived following-feed notifications
   - `unreadCount` + `markAllSeen` (local storage)
6. **NotificationSheet**: list notifications, tap → navigate to detail
7. **NotificationBell**: badge count + sheet trigger

**Web files cần đọc:** `lib/firebase.ts`, `lib/comments.ts`, `lib/notifications.ts`, `firestore.rules`, `components/CommentSection.tsx`, `components/NotificationSheet.tsx`, `context/NotificationProvider.tsx`.

**Exit criteria:** Comment CRUD + realtime hoạt động, notifications hiển thị và cập nhật live.

### Phase 6 — Discover & Social (3-4 ngày)

**Mục tiêu:** Feed, search, places, follow/unfollow.

**Công việc:**
1. **DiscoverScreen**:
   - Feed infinite scroll với keyset cursor (`/discover/feed`)
   - Tab "For you" + "Following" (`/discover/feed/following`)
   - Search places với debounce (`/places/search?q=`)
   - Filter chips: "Tất cả", "Đang hot", "Cafe", "Ăn uống"
   - FeedCard: image, distance_m, author, delete (mine)
   - Pull-to-refresh
2. **Place search**: popular strip + nearby places list
3. **Follow/unfollow**:
   - Follow button trên UserProfile
   - `GET /users/following` (id list)
   - `POST/DELETE /users/{ref}/follow`
4. **Profile followers/following lists** (modal)
5. **Reactions count** trên feed cards

**Web files cần đọc:** `pages/DiscoverPage.tsx`, `lib/api.ts` (feed/place/follow functions), `components/ProfileFollowSection.tsx`, `lib/maps.ts`.

**Exit criteria:** Feed load + pagination hoạt động, follow/unfollow flow OK.

### Phase 7 — Profile & Gamification (4-5 ngày)

**Mục tiêu:** Profile, edit profile, avatar, passport, badges, leaderboard, journeys.

**Công việc:**
1. **ProfileScreen** (của mình):
   - Hero card: avatar, display_name, @username, bio, stats (XP, level, cờ, journeys)
   - Progress bar XP → next level
   - "Khoảnh khắc" checkpoint grid (pagination)
   - Edit profile button
   - Settings button
2. **EditProfileScreen**:
   - Display name, bio, username (với availability check `isUsernameAvailable()`)
   - Avatar: pick → crop (`expo-image-crop` hoặc resize) → upload (`POST /users/me/avatar`)
   - Avatar frame picker (Skia composite: avatar + frame SVG → PNG upload)
3. **PassportSection**: province stamps grid (`GET /me/passport`)
4. **BadgesSection**: badge catalog + locked/unlocked (`GET /me/badges`)
5. **LeaderboardScreen**: podium + ranked list + "me" highlight (`GET /leaderboard`)
6. **BadgeUnlockToast**: khi check-in trả `new_badges`
7. **JourneysSection**: list active journeys + "Bắt đầu" / "Kết thúc"
   - CRUD journeys (`GET /journeys/me`, `POST /journeys`, `PATCH /journeys/{id}`)
   - Assign checkpoints to journey
8. **SettingsScreen**: language, openCreateOnLaunch, preferCameraOnCheckin, logout
9. **Public profile screen** (`/u/:username`): hero + passport + badges + checkpoint grid

**Web files cần đọc:** `pages/ProfilePage.tsx`, `pages/LeaderboardPage.tsx`, `pages/BadgeCollectionPage.tsx`, `components/EditProfileSheet.tsx`, `components/AvatarCropSheet.tsx`, `components/AvatarFramePicker.tsx`, `components/PassportSection.tsx`, `components/BadgesSection.tsx`, `components/JourneysSection.tsx`, `components/BadgeUnlockToast.tsx`, `components/BadgeUnlockModal.tsx`, `components/SettingsSheet.tsx`, `components/ProfileHeader.tsx`, `components/ProfileHeroCard.tsx`, `components/MyCheckpointsSheet.tsx`, `lib/avatarComposite.ts`, `lib/avatarFrames.ts`, `lib/settings.ts`.

**Exit criteria:** Profile đầy đủ, passport/badges/leaderboard hiển thị, avatar upload + frame hoạt động.

### Phase 8 — Integrations & Polish (3-4 ngày)

**Mục tiêu:** Google Drive/Photos OAuth, remaining screens, release prep.

**Công việc:**
1. **Google Drive connect/disconnect** UI:
   - `POST /integrations/drive/init` → mở `expo-web-browser` auth URL
   - Deep-link callback → lưu kết nối
   - `GET /integrations/drive/status`, `DELETE /integrations/drive/disconnect`
2. **Google Photos connect/disconnect** UI (tương tự)
3. **Badge collection page** (`/badges`)
4. **AI Plan page** (`/ai-plan`) — placeholder/data giả (giống web)
5. **Privacy & Terms** screens
6. **Error boundary** (wrapper app)
7. **Skeleton loading states** cho mọi screen
8. **Setup FCM push notifications** (`expo-notifications` + `@react-native-firebase/messaging`)
9. **Cấu hình EAS Build** + OTA Update

**Web files cần đọc:** `components/DriveConnectCard.tsx`, `components/GooglePhotosConnectCard.tsx`, `lib/api.ts` (integration functions), `components/ErrorBoundary.tsx`, `pages/LegalPages.tsx`, `pages/AIPlanPage.tsx`, `pages/BadgeCollectionPage.tsx`.

**Exit criteria:** Integrations UI hoạt động, app sẵn sàng cho beta test.

### Phase 9 — Parity QA & Cutover (3-5 ngày)

**Mục tiêu:** Verify feature parity với web PWA, release lên stores.

**Công việc:**
1. Route-by-route parity QA checklist
2. Auth/session test: cold start, reinstall, logout, upgrade, token expiry
3. Map/location test: permission denied, approximate location, bbox changes
4. Media upload test: image, HEIC, video, camera, EXIF photo check-in — real devices
5. Comments/notifications test: multi-account
6. Follow/unfollow + feed test
7. Store assets: screenshots, description, privacy strings
8. Beta: TestFlight + Play Store internal test
9. Giữ PWA tiếp tục chạy; chỉ cut over sau parity

---

## 5. File mapping: Web PWA → React Native

### 5.1 Lib layer — tái dùng nhiều nhất

| Web (`web/src/lib/`) | RN (`mobile-rn/src/lib/`) | Mức độ sửa |
| -------------------- | ------------------------- | ---------- |
| `api.ts` | `lib/api.ts` | 🟡 Sửa nhẹ (token storage → secure-store, xoá localStorage) |
| `maps.ts` | `lib/maps.ts` | ✅ Copy nguyên |
| `geo.ts` | `lib/geo.ts` | 🟡 Sửa: `navigator.geolocation` → `expo-location` helpers |
| `cn.ts` | `lib/cn.ts` | ✅ Copy nguyên |
| `i18n.ts` + `locales/*.json` | `lib/i18n.ts` + `locales/` | 🟡 Sửa: LanguageDetector → expo-localization |
| `settings.ts` | `lib/settings.ts` | 🟡 Sửa: localStorage → MMKV/AsyncStorage |
| `guestSession.ts` | `lib/guestSession.ts` | 🟡 Sửa: localStorage → MMKV |
| `authErrors.ts` | `lib/authErrors.ts` | ✅ Copy nguyên |
| `share.ts` | `lib/share.ts` | 🟡 Sửa: `navigator.share` → `expo-sharing` |
| `checkpointImages.ts` | `lib/checkpointImages.ts` | ✅ Copy nguyên |
| `image.ts` | **Bỏ** — viết lại bằng `expo-image-manipulator` | ❌ Viết mới |
| `exif.ts` | **Bỏ** — viết lại bằng `expo-media-library` | ❌ Viết mới |
| `video.ts` | **Bỏ** — viết lại bằng `expo-video-thumbnails` | ❌ Viết mới |
| `avatarComposite.ts` | **Bỏ** — viết lại bằng Skia | ❌ Viết mới |
| `avatarFrames.ts` | `lib/avatarFrames.ts` | ✅ Copy nguyên (CDN URLs) |
| `comments.ts` | **Bỏ** — viết lại Firestore service | ❌ Viết mới |
| `notifications.ts` | **Bỏ** — viết lại Firestore service | ❌ Viết mới |
| `firebase.ts` | **Bỏ** — dùng `@react-native-firebase/app` | ❌ Viết mới |
| `supabase.ts` | `lib/supabase.ts` | 🟡 Sửa: createClient options cho RN |
| `observability.ts` | **Bỏ** — dùng Firebase Analytics RN SDK | ❌ Viết mới |
| `platform.ts` | **Bỏ** — dùng `expo-device` + `Platform.OS` | ❌ Viết mới |

### 5.2 Context & State

| Web (`web/src/`) | RN | Mức độ sửa |
| ---------------- | -- | ---------- |
| `auth/AuthContext.tsx` | `src/services/auth.ts` hoặc context | 🟡 Cấu trúc giống, logic platform-specific cho OAuth |
| `location/LocationProvider.tsx` | `src/services/location.ts` | 🟡 Giống pattern, `expo-location` thay browser API |
| `context/NotificationProvider.tsx` | `src/services/notifications.ts` | 🟡 Giống pattern, Firestore SDK RN thay web |
| `context/CheckinQueue.tsx` | `src/services/queue.ts` | 🟡 Giống pattern, MMKV thay localStorage |
| `context/AuthGate.tsx` | routes guard | ✅ Tương đương |
| `context/UserProfileProvider.tsx` | state trong screen | 🟡 Đơn giản hơn |
| TanStack Query setup (`main.tsx`) | QueryClientProvider | ✅ Giống nguyên |

### 5.3 Pages & Components

| Web | RN | Mức độ |
| --- | -- | ------ |
| `App.tsx` (routes) | `app/_layout.tsx` (expo-router) | ❌ Viết mới |
| `main.tsx` (entry) | `app/_layout.tsx` | ❌ Viết mới |
| `components/AppLayout.tsx` | `app/_layout.tsx` (shell) | ❌ Viết mới |
| `components/BottomNav.tsx` | expo-router tab navigator | ❌ Viết mới |
| `components/nav/*` | expo-router + components | ❌ Viết mới |
| `components/ui/*` | `src/components/ui/*` | ❌ Viết mới (NativeWind) |
| `components/CheckpointDetailSheet.tsx` | `src/components/CheckpointDetail.tsx` | ❌ Viết mới |
| `components/PlaceDetailSheet.tsx` | `src/components/PlaceDetail.tsx` | ❌ Viết mới |
| `components/JourneyDetailSheet.tsx` | `src/components/JourneyDetail.tsx` | ❌ Viết mới |
| `components/UserProfileSheet.tsx` | `src/components/UserProfile.tsx` | ❌ Viết mới |
| `components/CommentSection.tsx` | `src/components/CommentSection.tsx` | ❌ Viết mới |
| `components/NotificationSheet.tsx` | `src/components/NotificationSheet.tsx` | ❌ Viết mới |
| `components/ReactionBar.tsx` | `src/components/ReactionBar.tsx` | ❌ Viết mới |
| `components/CreateCheckpointForm.tsx` | `src/components/CreateCheckpointForm.tsx` | ❌ Viết mới |
| `components/CameraCaptureSheet.tsx` | `src/components/CameraSheet.tsx` | ❌ Viết mới (expo-camera) |
| `components/PhotoCheckinTab.tsx` | `src/components/PhotoCheckinTab.tsx` | ❌ Viết mới |
| `components/EditProfileSheet.tsx` | `src/components/EditProfile.tsx` | ❌ Viết mới |
| `components/AvatarCropSheet.tsx` | `src/components/AvatarCrop.tsx` | ❌ Viết mới |
| `components/AvatarFramePicker.tsx` | `src/components/AvatarFramePicker.tsx` | ❌ Viết mới |
| `components/SettingsSheet.tsx` | `src/components/Settings.tsx` | ❌ Viết mới |
| `components/MediaPreview.tsx` | `src/components/MediaPreview.tsx` | ❌ Viết mới |
| `components/LocationPermissionSheet.tsx` | `src/components/LocationPermission.tsx` | ❌ Viết mới |
| `components/MapSkeleton.tsx` | `src/components/MapSkeleton.tsx` | ❌ Viết mới |
| `components/UpgradeBanner.tsx` | `src/components/UpgradeBanner.tsx` | ❌ Viết mới |
| `components/BadgeUnlockToast.tsx` | `src/components/BadgeUnlockToast.tsx` | ❌ Viết mới |
| `components/BadgeUnlockModal.tsx` | `src/components/BadgeUnlockModal.tsx` | ❌ Viết mới |
| `components/JourneysSection.tsx` | `src/components/JourneysSection.tsx` | ❌ Viết mới |
| `components/ProfileFollowSection.tsx` | `src/components/ProfileFollowSection.tsx` | ❌ Viết mới |
| `components/ProfileHeader.tsx` | `src/components/ProfileHeader.tsx` | ❌ Viết mới |
| `components/ProfileHeroCard.tsx` | `src/components/ProfileHeroCard.tsx` | ❌ Viết mới |
| `components/PassportSection.tsx` | `src/components/PassportSection.tsx` | ❌ Viết mới |
| `components/BadgesSection.tsx` | `src/components/BadgesSection.tsx` | ❌ Viết mới |
| `components/DriveConnectCard.tsx` | `src/components/DriveConnectCard.tsx` | ❌ Viết mới |
| `components/GooglePhotosConnectCard.tsx` | `src/components/GooglePhotosConnectCard.tsx` | ❌ Viết mới |
| `components/MyCheckpointsSheet.tsx` | `src/components/MyCheckpoints.tsx` | ❌ Viết mới |
| `components/ErrorBoundary.tsx` | `src/components/ErrorBoundary.tsx` | ❌ Viết mới |
| `components/PWAUpdatePrompt.tsx` | **Bỏ** (EAS Update) | ✅ Bỏ |
| `components/InstallHint.tsx` | **Bỏ** (App Store) | ✅ Bỏ |
| `pages/MapPage.tsx` | `app/index.tsx` | ❌ Viết mới |
| `pages/DiscoverPage.tsx` | `app/discover.tsx` | ❌ Viết mới |
| `pages/CreatePage.tsx` | `app/create.tsx` | ❌ Viết mới |
| `pages/ProfilePage.tsx` | `app/profile.tsx` | ❌ Viết mới |
| `pages/LeaderboardPage.tsx` | `app/leaderboard.tsx` | ❌ Viết mới |
| `pages/BadgeCollectionPage.tsx` | `app/badges.tsx` | ❌ Viết mới |
| `pages/AIPlanPage.tsx` | `app/ai-plan.tsx` | ❌ Viết mới (placeholder) |
| `pages/LoginPage.tsx` | `app/login.tsx` | ❌ Viết mới |
| `pages/LinkRoutes.tsx` | expo-router deep link routes | ❌ Viết mới |
| `pages/LegalPages.tsx` | `app/privacy.tsx`, `app/terms.tsx` | ❌ Viết mới |
| `pages/FeedPage.tsx` | (dùng DiscoverScreen) | ✅ Bỏ |

### 5.4 Hooks

| Web (`web/src/hooks/`) | RN | Sửa |
| ---------------------- | -- | --- |
| `useCheckin.tsx` | `src/hooks/useCheckin.ts` | 🟡 Logic giữ, UI thành RN components |
| `useDeleteCheckpoint.tsx` | `src/hooks/useDeleteCheckpoint.ts` | 🟡 Giữ logic, RN alert thay DOM confirm |
| `useGeocode.ts` | `src/hooks/useGeocode.ts` | ✅ Copy (logic thuần + cache Map) |
| `useLocationLabel.ts` | `src/hooks/useLocationLabel.ts` | ✅ Copy (logic thuần) |
| `useDismissableLayer.ts` | RN gesture handler | ❌ Viết mới |
| `usePullToRefresh.ts` | RN RefreshControl | ❌ Viết mới |

---

## 6. RN vs Flutter — so sánh & lý do chọn RN

### 6.1 So sánh

| Tiêu chí | React Native (Expo) | Flutter |
| --- | --- | --- |
| **Tái dùng code hiện có** | ✅ Cao: TS types, api.ts, TanStack Query, i18next | ❌ Thấp: viết lại Dart |
| **Kỹ năng team** | ✅ Team React/TS | ❌ Cần học Dart |
| **MapLibre** | ⚠️ Plugin nhỏ hơn | ⚠️ Plugin community |
| **Camera/media/EXIF** | ⚠️ Expo SDK tốt | ✅ Control sâu hơn |
| **Hiệu năng UI** | ⚠️ Fabric đã ổn | ✅ Đồng nhất 60-120fps |
| **OTA update** | ✅ EAS Update mạnh | ⚠️ Shorebird (bên thứ 3) |
| **Supabase + Firebase** | ✅ SDK chính thức | ✅ SDK tốt |
| **Chia sẻ code với web** | ✅ Có thể monorepo | ❌ Không |
| **Codebase đã có** | ❌ Làm lại từ đầu | ✅ Đã ~60% |

### 6.2 Lý do chọn React Native

1. **Team là React/TS** — không cần học ngôn ngữ mới
2. **Tái dùng code tối đa** — ~15 file `lib/` copy được, tiết kiệm ~30-40% thời gian so với viết lại Dart
3. **Monorepo tương lai** — chia sẻ `lib/` giữa web và mobile
4. **OTA update qua EAS** — deploy nhanh không qua App Store review
5. **Chi phí bảo trì dài hạn thấp hơn** — một ngôn ngữ (TS) cho cả web + mobile

### 6.3 Chi phí

| Hạng mục | Flutter (đã có ~60%) | RN (làm mới) |
| -------- | -------------------- | ------------ |
| Auth + API | ✅ 100% done | ⏳ ~3 ngày |
| Shell + theme | ✅ 100% done | ⏳ ~3 ngày |
| Map + location | ✅ 90% done | ⏳ ~4 ngày |
| Check-in + upload | ✅ 80% done | ⏳ ~5 ngày |
| Detail surfaces | ✅ 80% done | ⏳ ~4 ngày |
| Comments + notifs | ❌ 0% (chưa làm cả 2) | ⏳ ~3 ngày |
| Discover + social | ✅ 80% done | ⏳ ~3 ngày |
| Profile + gamification | ✅ 70% done | ⏳ ~4 ngày |
| Media (camera/HEIC/EXIF) | 🟡 40% done | ⏳ ~2 ngày |
| Integrations | ❌ 0% (chưa làm cả 2) | ⏳ ~2 ngày |
| QA + release | ❌ 0% | ⏳ ~3 ngày |
| **Tổng còn lại** | **~3-4 tuần** | **~5-7 tuần** |
| **Tổng từ đầu** | **~8-10 tuần** | **~5-7 tuần** |

> Mặc dù Flutter đã làm ~60%, chi phí bảo trì 2 codebase (web TS + mobile Dart) và học Dart cho team là lý do chính để chọn RN. Thời gian hoàn thành RN dự kiến **5-7 tuần** với 1-2 devs full-time.

---

## Phụ lục A: Tài liệu tham khảo từ kế hoạch Flutter cũ

Kế hoạch chi tiết trong `docs/flutter-migration-and-image-cache-plan.md` có các phần dùng chung cho RN:

- **Backend API Mapping** (đầy đủ endpoints, request/response shapes) — dùng chung, không đổi
- **Firestore Mapping** (comments, notifications collections) — dùng chung, không đổi
- **Media Pipeline** (upload slot flow, R2 direct PUT, image dimensions, video limits) — dùng chung
- **Risk Register** (static-art cache, native OAuth callback, Firestore rules, media parity, queue correctness) — dùng chung
- **Non-Goals** (backend redesign, schema migration, offline-first) — dùng chung

## Phụ lục B: Risk Register

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Static-art cache mismatch | Ảnh không load | Đồng bộ CDN URL về `media.checkpoint-app.space` |
| Native OAuth callback | Drive/Photos không connect | Xác minh sớm với `expo-web-browser` + deep link |
| Firestore rules security | Dữ liệu public | Review rules trước release; mint Firebase custom token nếu cần |
| Media parity | HEIC/EXIF/camera orientation | Test real device iOS + Android sớm |
| Map parity | Clustering khác web | Early spike với `@maplibre/maplibre-react-native` |
| Queue correctness | Check-in trùng | Idempotency key từ client |
| Notification split | Feed pagination corrupt | Cache riêng cho derived + stored notifications |
| R2 CORS | Upload fail | Kiểm tra CORS policy allow PUT từ mobile origin |
| HEIC trên Android | Android không hỗ trợ HEIC phổ biến | Fallback convert bằng `expo-image-manipulator` nếu cần |

## Phụ lục C: Non-Goals cho V1

- Backend API redesign
- Database schema migration
- Offline-first full app behavior
- Replacing React web/PWA trước khi native parity verified
- Background location tracking / geofencing
- Apple Watch / Wear OS
- Widget (iOS/Android)
- SSR version của web (Next.js)

---

## 7. Việc cần làm tiếp (Sprint plan)

### Ngay lập tức (Sprint 0)

1. ✅ Quyết định: **React Native** — đã chọn.
2. Tạo project Expo: `npx create-expo-app@latest mobile-rn --template blank-typescript`
3. Cài dependencies core (xem Phase 0).
4. Cấu hình NativeWind v4 với design tokens từ `web/src/index.css`.
5. Copy `web/src/lib/api.ts` + `lib/maps.ts` + `lib/geo.ts` + `lib/i18n.ts` + `locales/` + `lib/cn.ts` + `lib/settings.ts` + `lib/guestSession.ts` + `lib/authErrors.ts` + `lib/checkpointImages.ts` + `lib/share.ts` vào `mobile-rn/src/lib/`.
6. Setup CI: `tsc --noEmit`, lint, test.
7. **Dọn risk static-art**: đồng bộ CDN URL trong web Workbox config + Flutter config → tất cả về `media.checkpoint-app.space`.
8. **Xác minh native OAuth callback** cho Google Drive/Photos.
9. **Review Firestore rules** trước khi release native.

### Sprint 1-2 (Phase 0-1)

- Auth + session (Expo Supabase + secure-store + token exchange)
- Login screen (email, Google, anonymous, upgrade)
- Shell, theme, i18n, assets

### Sprint 3-4 (Phase 2-3)

- Map + location + deep links
- Check-in form + upload pipeline
- Detail surfaces (checkpoint, place, journey)

### Sprint 5-6 (Phase 4-5b)

- Comments + notifications (Firestore)
- Discover + social (feed, search, follow)

### Sprint 7-8 (Phase 6-7)

- Profile + edit profile + avatar
- Passport, badges, leaderboard, journeys
- Settings, integrations

### Sprint 9 (Phase 8-9)

- Parity QA, beta test, store release
- Giữ PWA chạy song song
| `PlaceDetailSheet` — "Cắm cờ tại đây" → place-based check-in | `PlaceDetailScreen` + create nav | ✅ |
| Pull-to-refresh | Cần port | 🟡 |
| Virtual scrolling (`@tanstack/react-virtual`) | Không cần (native ListView) | ✅ Bỏ |
| `UserProfileSheet` — từ avatar click | `PublicProfileScreen` | ✅ |
| Follow/unfollow UI | Cần follow button logic | 🟡 |
| `ProfileFollowSection` — followers/following lists | Cần port | ❌ |
| `FeedCard` — image, distance, author, delete (mine) | Feed card widget | ✅ |

### 5.9 Profile & Gamification — 🟡 Đã làm phần lớn

| Web | Flutter | Trạng thái |
| --- | ------- | ---------- |
| `ProfilePage` — hero/stats/progress/checkpoint grid | `ProfileScreen` | ✅ |
| `EditProfileSheet` — display_name, bio, username, avatar | Cần port | ❌ |
| `uploadAvatar()` — multipart | `UserRepository` có API | ❌ Chưa có UI |
| `AvatarComposite.tsx` — canvas composite avatar + frame | Cần port (CustomPainter) | ❌ |
| `AvatarFramePicker.tsx` — frame selection sheet | Cần port | ❌ |
| `AvatarCropSheet.tsx` — react-easy-crop avatar | Cần port | ❌ |
| `PassportSection` — province stamps grid | `PassportSection` | ✅ |
| `BadgesSection` — badge catalog + locked/unlocked | `BadgesSection` | ✅ |
| `LeaderboardPage` — podium + ranked list + "me" highlight | `LeaderboardScreen` | ✅ |
| `BadgeUnlockToast` / `BadgeUnlockModal` | Cần port | ❌ |
| `JourneysSection` — active journey list + create/end | Cần port | ❌ |
| `MyCheckpointsSheet` — "Khoảnh khắc" gallery | Profile screen có grid | ✅ |
| `SettingsSheet` — language, openCreateOnLaunch, preferCamera | Cần port | ❌ |
| `UpgradeBanner` — guest → real account CTA | Cần port | ❌ |
| Share card (`lib/shareCard.ts` — Canvas2D render) | Native share: không cần canvas card | 🟡 |
| `ShareButton` — Web Share API | `share_plus` | 🟡 |

### 5.10 Firestore Features — ❌ Chưa làm

| Web | Flutter | Trạng thái |
| --- | ------- | ---------- |
| `lib/firebase.ts` — Firebase init | `firebase_core` | ❌ Chưa config |
| `lib/comments.ts` — Firestore CRUD + cursor pagination | Chưa có | ❌ |
| `CommentSection.tsx` — comment UI + infinite scroll | Chưa có | ❌ |
| `lib/notifications.ts` — Firestore write + subscribe | Chưa có | ❌ |
| `NotificationProvider.tsx` — merge Firestore + derived feed | Chưa có | ❌ |
| `NotificationSheet.tsx` — notification list + markAllSeen | Chưa có | ❌ |
| `NotificationBell` — badge + sheet trigger | Chưa có | ❌ |
| FCM push notifications | Chưa có | ❌ |
| `firestore.rules` review | 📝 Cần làm trước release | 📝 |

### 5.11 Integrations — ❌ Chưa làm

| Web | Flutter | Trạng thái |
| --- | ------- | ---------- |
| `DriveConnectCard.tsx` — Google Drive connect/disconnect | Cần port | ❌ |
| `GooglePhotosConnectCard.tsx` — Google Photos connect/disconnect | Cần port | ❌ |
| OAuth flow (redirect → deep-link callback) | `url_launcher` + deep link | ❌ |
| `IntegrationRepository` | Có API (chưa nối UI) | 🟡 |

### 5.12 Deep Links — ✅ Đã xong

| Web | Flutter | Trạng thái |
| --- | ------- | ---------- |
| `/c/:id` → CheckpointDetail | GoRouter `/c/:id` | ✅ |
| `/p/:id` → PlaceDetail | GoRouter `/p/:id` | ✅ |
| `/j/:id` → JourneyDetail | GoRouter `/j/:id` (stub) | ❌ |
| `/u/:username` → PublicProfile | GoRouter `/u/:username` | ✅ |
| Universal links (iOS) / App links (Android) | Cần cấu hình native | ❌ |
| Deep link → Login → continue to destination | GoRouter redirect | 🟡 |

### 5.13 Chưa làm trên Flutter — tổng hợp

**Priority cao (cần cho MVP parity):**

| # | Tính năng | Web file gốc | Phụ thuộc |
| - | --------- | ------------ | ---------- |
| 1 | Journey detail screen (`/j/:id`) | `JourneyDetailSheet.tsx` | Map + API ready |
| 2 | Comment section | `CommentSection.tsx`, `lib/comments.ts` | Firebase config |
| 3 | Notification system | `NotificationProvider.tsx`, `NotificationSheet.tsx`, `lib/notifications.ts` | Firebase config |
| 4 | Edit profile + avatar upload | `EditProfileSheet.tsx`, `uploadAvatar()` | Auth ready |
| 5 | Avatar frame composite + picker | `AvatarComposite.tsx`, `AvatarFramePicker.tsx`, `AvatarCropSheet.tsx` | Edit profile |
| 6 | Follow/unfollow UI | `ProfileFollowSection.tsx` + follow buttons | API ready |
| 7 | Reaction bar with optimistic UI | `ReactionBar.tsx` | API ready |
| 8 | Check-in queue offline retry | `CheckinQueueProvider.tsx` | Local storage + API |
| 9 | Settings screen | `SettingsSheet.tsx`, `lib/settings.ts` | - |
| 10 | Camera native sheet (front/back/flash/preferences) | `CameraCaptureSheet.tsx` | Camera permission |
| 11 | HEIC handling + EXIF extraction | `lib/image.ts`, `lib/exif.ts` | Native libs |
| 12 | Video picker + thumbnail | `lib/video.ts` | Video permission |
| 13 | Badge unlock toast/modal | `BadgeUnlockToast.tsx`, `BadgeUnlockModal.tsx` | API returns `new_badges` |
| 14 | Google Drive/Photos integration UI | `DriveConnectCard.tsx`, `GooglePhotosConnectCard.tsx` | OAuth callback |
| 15 | Share button + native share | `ShareButton.tsx`, `lib/share.ts` | `share_plus` |

**Priority thấp (sau MVP, hoặc native-specific):**

| # | Tính năng | Ghi chú |
| - | --------- | ------- |
| 16 | AI Plan screen | Placeholder, data giả trên web |
| 17 | Badges collection page | Có thể reuse BadgesSection |
| 18 | Privacy/Terms screens | Legal text |
| 19 | Upgrade guest banner | LoginScreen có upgrade |
| 20 | Error boundary + skeleton loading | UI polish |
| 21 | Pull-to-refresh | UX polish |
| 22 | FCM push notifications | Post-MVP |
| 23 | App Clip / Instant App | Post-MVP |

### 5.14 Lộ trình triển khai chi tiết (Phase bổ sung)

Dựa trên phân tích, đề xuất bổ sung các phase sau vào kế hoạch Flutter hiện tại:

**Phase 6.5 — Comments & Notifications** (ước lượng: 3-5 ngày)
1. Cấu hình Firebase cho Flutter (`firebase_core`, `cloud_firestore`)
2. Port `lib/comments.ts` → Firestore comment repository
3. Port `CommentSection.tsx` widget → Flutter
4. Port `lib/notifications.ts` → Firestore notification service
5. Port `NotificationProvider` + `NotificationSheet` + `NotificationBell`
6. Test comment CRUD + notification sync

**Phase 7.5 — Profile & Social chi tiết** (ước lượng: 5-7 ngày)
1. `EditProfileScreen` — display_name, bio, username availability check
2. Avatar upload flow: pick → crop → composite with frame → upload
3. `AvatarFramePicker` + frame catalog
4. Follow/unfollow buttons + `ProfileFollowSection`
5. `ReactionBar` widget với optimistic update
6. Settings screen: language, openCreateOnLaunch, preferCamera
7. `BadgeUnlockToast` khi nhận được `new_badges` từ API
8. `JourneysSection` — create/end journey + list active
9. `UpgradeBanner` for guest accounts

**Phase 8.5 — Media hoàn thiện** (ước lượng: 4-6 ngày)
1. Native camera sheet (front/back/flash toggle, lens preference)
2. EXIF GPS/taken_at extraction (native)
3. HEIC handling (test native iOS auto-conversion, fallback nếu cần)
4. Video picker + thumbnail generation
5. Check-in queue persistence + retry (`local storage` → `hive`)
6. `MediaPreview` — full-screen photo viewer

**Phase 9.5 — Integrations & Release** (ước lượng: 3-5 ngày)
1. Google Drive connect/disconnect UI
2. Google Photos connect/disconnect UI
3. Native OAuth callback handling (`universal links` / `app links`)
4. Deep link config cho iOS/Android
5. CORS / R2 upload headers verification
6. Push notification (FCM) — optional, post-MVP
7. Store listing assets, privacy strings, permission descriptions
8. Beta test flight + Play Store internal test

### 5.15 File mapping: Web → Flutter migration cheat sheet

| Web file | Flutter destination | Tính năng |
| --------- | ------------------- | --------- |
| `auth/AuthContext.tsx` | `features/auth/application/auth_controller.dart` | Auth state |
| `lib/api.ts` | `core/api/` (models + repositories) | API layer |
| `lib/geo.ts` | `features/location/application/location_controller.dart` | Geolocation |
| `lib/maps.ts` | `features/map/` constants | Map config |
| `lib/image.ts` | `core/media/image_helper.dart` | Image processing |
| `lib/exif.ts` | `core/media/exif_helper.dart` | EXIF metadata |
| `lib/video.ts` | `core/media/video_helper.dart` | Video processing |
| `lib/comments.ts` | `features/social/data/comment_repository.dart` | Firestore comments |
| `lib/notifications.ts` | `features/social/data/notification_repository.dart` | Firestore notifications |
| `lib/firebase.ts` | Firebase config | Firebase init |
| `lib/supabase.ts` | Supabase init | Supabase config |
| `lib/guestSession.ts` | `core/storage/guest_session.dart` | Guest flags |
| `lib/settings.ts` | `core/storage/settings_storage.dart` | User settings |
| `lib/i18n.ts` + `locales/` | `app/localization/` | i18n |
| `lib/share.ts` | `features/share/share_service.dart` | Native share |
| `lib/avatarComposite.ts` | `features/profile/` | Avatar composition |
| `lib/cn.ts` | Bỏ (không cần) | CSS utility |
| `lib/platform.ts` | Flutter native (Platform.xxx) | Platform detect |
| `lib/observability.ts` | Firebase Analytics | Observability |
| `context/NotificationProvider.tsx` | `features/social/` | Notification state |
| `context/CheckinQueue.tsx` | `features/checkpoints/` | Offline queue |
| `context/AuthGate.tsx` | Auth controller | Auth guard |
| `context/UserProfileProvider.tsx` | Profile navigation | Profile sheet state |
| `location/LocationProvider.tsx` | `features/location/` | Location state |
| `hooks/useCheckin.tsx` | `features/create/` | Check-in flow |
| `hooks/useDeleteCheckpoint.tsx` | `features/checkpoints/` | Delete flow |
| `hooks/useGeocode.ts` | `features/location/` | Reverse geocode |
| `hooks/useLocationLabel.ts` | `features/location/` | Location label |
| `hooks/useDismissableLayer.ts` | Shared widget | Dismissible |
| `hooks/usePullToRefresh.ts` | Shared widget | Pull to refresh |
| `components/AppLayout.tsx` | `features/shell/home_shell.dart` | App shell |
| `components/BottomNav.tsx` | `features/shell/` + `BottomNav` | Navigation |
| `components/nav/` | Shell components | Top nav / menu |
| `components/ui/` | `shared/widgets/` | UI primitives |
| `components/share/` | `features/share/` | Share card |
| `components/CheckpointDetailSheet.tsx` | `features/checkpoints/presentation/` | Detail screen |
| `components/PlaceDetailSheet.tsx` | `features/places/presentation/` | Place detail |
| `components/JourneyDetailSheet.tsx` | `features/journeys/presentation/` | Journey detail |
| `components/UserProfileSheet.tsx` | `features/user/presentation/` | Public profile |
| `components/CommentSection.tsx` | `features/social/presentation/` | Comments |
| `components/NotificationSheet.tsx` | `features/social/presentation/` | Notifications |
| `components/ReactionBar.tsx` | `features/social/presentation/` | Reactions |
| `components/CreateCheckpointForm.tsx` | `features/create/presentation/` | Check-in form |
| `components/CreateCheckpointSheet.tsx` | `features/create/presentation/` | Check-in sheet |
| `components/CameraCaptureSheet.tsx` | `features/create/presentation/` | Camera |
| `components/PhotoCheckinTab.tsx` | `features/create/presentation/` | Photo check-in |
| `components/EditProfileSheet.tsx` | `features/profile/presentation/` | Edit profile |
| `components/AvatarCropSheet.tsx` | `features/profile/presentation/` | Avatar crop |
| `components/AvatarFramePicker.tsx` | `features/profile/presentation/` | Frame picker |
| `components/SettingsSheet.tsx` | `features/profile/presentation/` | Settings |
| `components/MyCheckpointsSheet.tsx` | `features/profile/presentation/` | My checkpoints |
| `components/UpgradeBanner.tsx` | `features/auth/presentation/` | Guest upgrade |
| `components/BadgeUnlockToast.tsx` | Widget overlay | Badge toast |
| `components/BadgeUnlockModal.tsx` | Widget overlay | Badge modal |
| `components/JourneysSection.tsx` | `features/journeys/presentation/` | Journey list |
| `components/ProfileFollowSection.tsx` | `features/profile/presentation/` | Follow list |
| `components/ProfileHeader.tsx` | `features/profile/presentation/` | Profile header |
| `components/ProfileHeroCard.tsx` | `features/profile/presentation/` | Hero card |
| `components/PassportSection.tsx` | `features/gamification/presentation/` | Passport |
| `components/BadgesSection.tsx` | `features/gamification/presentation/` | Badges |
| `components/DriveConnectCard.tsx` | `features/integrations/` | Google Drive |
| `components/GooglePhotosConnectCard.tsx` | `features/integrations/` | Google Photos |
| `components/MediaPreview.tsx` | `shared/widgets/` | Photo viewer |
| `components/LocationPermissionContent.tsx` | `features/location/` | Location UI |
| `components/LocationPermissionSheet.tsx` | `features/location/` | Location sheet |
| `components/MapSkeleton.tsx` | `features/map/` | Map loading |
| `pages/MapPage.tsx` | `features/map/presentation/map_screen.dart` | Map page |
| `pages/DiscoverPage.tsx` | `features/discover/presentation/` | Discover page |
| `pages/CreatePage.tsx` | `features/create/presentation/` | Create page |
| `pages/ProfilePage.tsx` | `features/profile/presentation/` | Profile page |
| `pages/LeaderboardPage.tsx` | `features/leaderboard/presentation/` | Leaderboard |
| `pages/BadgeCollectionPage.tsx` | Placeholder | Badge collection |
| `pages/AIPlanPage.tsx` | Placeholder | AI Plan |
| `pages/LoginPage.tsx` | `features/auth/presentation/` | Login |
| `pages/LinkRoutes.tsx` | GoRouter routes | Deep link routes |
| `pages/LegalPages.tsx` | Placeholder | Privacy/Terms |
| `pages/FeedPage.tsx` | `features/discover/presentation/` | Feed page (unused?) |

---

## 6. Kế hoạch triển khai React Native (tài liệu tham khảo)

Nếu team quyết định chọn React Native thay vì Flutter, đây là kế hoạch chi tiết dựa trên phân tích web.

### 6.1 Stack RN đề xuất

| Layer | Lựa chọn | Lý do |
| ----- | -------- | ----- |
| Framework | Expo SDK 52+ | Managed workflow, EAS Build, OTA update |
| Routing | expo-router (file-based) | Map 1:1 với React Router routes + deep link |
| State | TanStack Query v5 (giữ nguyên) | Tái dùng keys, cache policy, invalidation |
| HTTP | axios (giữ nguyên client) | Copy gần nguyên `lib/api.ts` |
| Auth | @supabase/supabase-js + expo-secure-store | Supabase JS SDK hỗ trợ RN |
| Map | @maplibre/maplibre-react-native | Cùng style/tiles với web |
| Location | expo-location | Native location API |
| Camera | expo-camera + expo-image-picker | Native camera control |
| Media | expo-image-manipulator, expo-media-library | Resize, EXIF, thumbnail |
| Firestore | @react-native-firebase/firestore | Comments/notifications |
| Push | @react-native-firebase/messaging | FCM/APNs |
| i18n | i18next + react-i18next (giữ nguyên) | Seed từ `locales/*.json` |
| Storage | expo-secure-store + AsyncStorage/MMKV | Thay localStorage |
| Animations | react-native-reanimated | Native animations |
| SVG | react-native-svg | Thay canvas share cards |

### 6.2 Lợi thế khi chọn RN

1. **Tái dùng code tối đa**: `web/src/lib/api.ts` types + DTOs, `lib/geo.ts` (logic thuần), `lib/i18n.ts` + locales, TanStack Query keys/invalidation, `lib/settings.ts` — tất cả copy gần như nguyên
2. **Team skill**: Nếu team đã là React/TS, không cần học Dart
3. **Monorepo**: Có thể chia sẻ `lib/` giữa web và mobile
4. **OTA update**: EAS Update mạnh hơn Shorebird

### 6.3 RN lộ trình (Phase)

| Phase | Tính năng | Phụ thuộc | Ước lượng |
| ----- | --------- | --------- | ---------- |
| P0 | Contract freeze (dùng chung với Flutter) | - | - |
| P1 | Expo scaffold + routing + TanStack Query + Supabase + Firebase | Stack quyết định | 2-3 ngày |
| P2 | Auth/session (supabase-js + secure-store + token exchange) | P1 | 2-3 ngày |
| P3 | API repositories + cache (copy `api.ts` types) | P2 | 2 ngày |
| P4 | Shell/theme/i18n (NativeWind hoặc StyleSheet) + assets | P3 | 3-4 ngày |
| P5 | Map + location + deep links | P4 | 4-5 ngày |
| P6 | Check-in + media (picker, camera, upload, EXIF, HEIC) | P5 | 5-7 ngày |
| P7 | Discover + social (feed, search, follow, comments, notif) | P6 | 5-7 ngày |
| P8 | Profile + gamification + journeys + integrations | P7 | 5-7 ngày |
| P9 | Parity QA + cutover | P8 | 3-5 ngày |

**Tổng ước lượng RN: ~6-8 tuần** (full-time 1-2 devs). Flutter đã làm ~50-60% nên thời gian hoàn thiện Flutter còn **~3-4 tuần**.

---

## 5. Việc cần làm tiếp (bất kể lựa chọn)

### 5.1 Pre-migration checklist

1. **Quyết định RN vs Flutter** dựa trên mục 4.3 + team capability.
2. **Dọn risk static-art**: `checkpointImages.ts` trỏ `media.checkpoint-app.space` nhưng Workbox còn trỏ origin Supabase cũ (`zngdcfoeklogvjphhjkp.supabase.co`) trong `vite.config.ts` — đồng bộ một nguồn asset. **Kiểm tra**:
   - `web/vite.config.ts` — Workbox runtimeCache `urlPattern` còn `zngdcfoeklogvjphhjkp.supabase.co` không?
   - Flutter cache plan dùng URL gì? Đồng bộ về `media.checkpoint-app.space`.
3. **Xác minh native OAuth callback** cho Google Drive/Photos sớm — rủi ro chung cả 2 hướng.
4. **Review Firestore rules** trước khi release native (web đang ghi trực tiếp Firestore không qua Firebase Auth làm nguồn auth chính).
5. **Kiểm tra R2 CORS headers** — `putFilesToSlots` dùng `fetch(presignedUrl, PUT)` từ native client. Đảm bảo CORS policy cho phép PUT từ mobile app origin (hoặc `*`).
6. **Kiểm tra API response nullable fields** — Dart/TS decode có thể khác ở edge cases (số thành viên của Place `checkin_count` khai báo 2 lần).
7. **Giữ PWA tiếp tục chạy** trong suốt quá trình; chỉ cut over sau khi parity được chứng minh.

### 5.2 Nếu chọn Flutter: priority work

1. **Journey detail screen** (`/j/:id`) — chỉ còn DetailShell stub
2. **Comments** (Firestore) — feature xã hội quan trọng
3. **Notifications** (Firestore + bell badge) — engagement
4. **Edit profile + avatar upload** — UX cơ bản
5. **Reaction bar** — social engagement
6. **Settings screen** — user control
7. **Camera native sheet** — thay thế react-webcam
8. **HEIC + EXIF** — test real device

### 5.3 Nếu chọn RN: priority work

1. Scaffold Expo + routing (P1)
2. Auth + session (P2)
3. Copy `api.ts` types + TanStack Query (P3)
4. Shell + NativeWind theme + i18n (P4)
5. Map + location (P5)
6. Check-in form + upload (P6)
7. Discover + social (P7)
8. Profile + gamification (P8)

---

## Phụ lục A: Nguồn quét
- `web/package.json`, `web/vite.config.ts`, `web/index.html`, `web/src/App.tsx`.
- `web/src/lib/api.ts` (full endpoints mapping).
- `web/src/lib/` (geo, image, exif, video, comments, notifications, firebase, supabase, i18n, settings, share, avatarComposite, observability, platform, guestSession).
- `web/src/auth/AuthContext.tsx`.
- `web/src/context/` (NotificationProvider, CheckinQueue, AuthGate, UserProfileProvider).
- `web/src/location/LocationProvider.tsx`.
- `web/src/hooks/` (useCheckin, useDeleteCheckpoint, useGeocode, useLocationLabel, usePullToRefresh).
- `web/src/components/` (toàn bộ 30+ component).
- `web/src/pages/` (MapPage, DiscoverPage, CreatePage, ProfilePage, LeaderboardPage, AIPlanPage, LoginPage, LinkRoutes).
- `mobile/` Flutter scaffold (app, router, theme, auth controller, 33 DTOs, repositories, 8 feature screens).
- `backend/internal/` (checkpoint, place, journey, auth handler).
- `docs/flutter-migration-and-image-cache-plan.md` (10-phase plan).
- `design/tokens/theme.css` (design tokens gốc).

## Phụ lục B: React native vs Flutter thời gian hoàn thiện

| Hạng mục | Flutter (đã làm) | RN (làm mới) |
| --------- | ---------------- | ------------ |
| Auth + API layer | ✅ 100% | ⏳ 3-4 ngày |
| Shell + theme | ✅ 100% | ⏳ 3-4 ngày |
| Map + location | ✅ 90% | ⏳ 4-5 ngày |
| Check-in + upload | ✅ 80% | ⏳ 5-7 ngày |
| Discover + feed | ✅ 80% | ⏳ 4-5 ngày |
| Comments + notifications | ❌ 0% | ⏳ 3-4 ngày |
| Profile + gamification | ✅ 70% | ⏳ 4-5 ngày |
| Journeys | 🟡 30% | ⏳ 2-3 ngày |
| Media (camera/HEIC/EXIF/video) | 🟡 40% | ⏳ 3-4 ngày |
| Integrations (Drive/Photos) | ❌ 0% | ⏳ 2-3 ngày |
| QA + release prep | ❌ 0% | ❌ 0% |
| **Tổng thời gian còn lại** | **~3-4 tuần** | **~6-8 tuần** |
| **Tổng thời gian từ đầu** | **~8-10 tuần** | **~6-8 tuần** |
