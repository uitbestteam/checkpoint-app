# Frontend — Inventory

Vite + React 19 + TS · Tailwind v4 · React Router v7 · PWA · deploy Cloudflare.
Thư mục: [`../web`](../web). Design tokens: [`../design/tokens`](../design/tokens).

## Đã làm

### Hạ tầng
- Scaffold Vite + React 19 + TypeScript, **build/typecheck sạch**.
- **Tailwind CSS v4** với toàn bộ **design tokens** từ mockup (`src/index.css`): palette cam/clay/green, dark mode, shadow ấm, radius, font Fredoka + Be Vietnam Pro.
- **PWA đầy đủ**: icons 192/512 + maskable + apple-touch (orange + map-pin), manifest vi, installable; `wrangler.jsonc` (Cloudflare static-assets, SPA fallback).
- **i18n lỗi auth**: `lib/authErrors.ts` dịch message lỗi Supabase (EN) → tiếng Việt theo error code + fallback theo text.
- Router 5 route + `AppLayout` (header + `<Outlet/>` + bottom nav).

### Auth (đã nối end-to-end ✅)
- `lib/supabase.ts` — Supabase client (chỉ để login).
- `lib/api.ts` — token store (localStorage) + `apiFetch` tự gắn Bearer & **re-auth khi 401** + `exchange`/`getMe`/`logout`.
- **Re-auth 2 tầng + single-flight** (khi 401): (1) app refresh_token → (2) re-exchange từ Supabase session (tầng bền) → chỉ khi **cả 2 fail** mới `onAuthExpired` → logout. Single-flight để 401 đồng thời không đá nhau khi BE rotate refresh token. Refresh TTL nâng 7d→30d.
- `auth/AuthContext.tsx` — `AuthProvider` + `useAuth`: bootstrap session, login email/Google, sign out.
- `pages/LoginPage.tsx` — đăng nhập/đăng ký (email + Google + **khách/anonymous**), style theo mockup.
- `App.tsx` — gate: loading → splash, chưa login → LoginPage, đã login → app.
- `ProfilePage` nối `GET /users/me` (tên, @username, XP, level, số cờ, hành trình) + nút đăng xuất.
- `components/UpgradeBanner.tsx` + `upgradeAccount()` — khách nâng cấp lên tài khoản thật (`updateUser`), giữ nguyên data.

### Checkpoint / Map (Phase 2 ✅ — nối API thật)
- **MapPage**: `react-map-gl/maplibre` + OpenFreeMap, fetch theo viewport (`?bbox`) qua **TanStack Query**, markers theo category. Lazy-load (maplibre ~284KB tách chunk riêng).
- **CreateCheckpointSheet**: CHECK-IN lấy GPS → form (name/category/note/rating/ảnh) → `POST /checkpoints` + upload ảnh → invalidate query → toast `+XP`.
- **CheckpointDetailSheet**: tap marker → `GET /checkpoints/{id}` (ảnh, note, rating, author). Ảnh xem bằng **react-photo-view** (zoom / xoay / kéo).
- **Image picker** (lúc tạo): thumbnail list + preview (react-photo-view) + xóa từng ảnh; object URL được revoke khi xóa/unmount.
- **Check-in 2 kiểu** (content tách khỏi Sheet): `CreateCheckpointForm` + `LocationPermissionContent` render trong **Sheet** (nút Map, qua `useCheckin`) hoặc **full-page** (tab Create → success tự về Map).
- **LocationPermissionSheet**: chưa grant → popup giải thích rồi mới gọi native prompt. Khi **denied** → hướng dẫn bật lại **theo nền tảng + chế độ PWA** (Android/iOS/desktop × standalone/tab) + tự phát hiện khi user bật lại (Permissions API `onchange` → auto continue). Không có web API mở settings nên chỉ hướng dẫn được.
- **ProfilePage**: "Khoảnh khắc" nối `GET /checkpoints/me` (empty state khi chưa có).
- `lib/maps.ts` (style + categories), `lib/api.ts` (checkpoint endpoints), `components/ui/{Sheet,Toast}`.

### Discovery (Phase 4 ✅)
- **DiscoverPage**: feed cộng đồng thật qua **`useInfiniteQuery`** (cursor) + infinite scroll (IntersectionObserver); search địa điểm (debounce, pg_trgm) → kết quả → **PlaceDetailSheet**.
- **PlaceDetailSheet**: ảnh (react-photo-view), avg rating, số lượt cắm cờ, review gần đây, nút **"Cắm cờ tại đây"** → place-based check-in (gửi `place_id`, prefill+khóa tên).
- **Auth Google + anonymous**: `loginGoogle` rẽ nhánh — khách → `linkIdentity` (giữ data), thường → `signInWithOAuth`; nút "Liên kết Google" trong UpgradeBanner; bắt lỗi OAuth redirect (identity trùng) hiển thị tiếng Việt.

### Journey (Phase 3 ✅)
- **JourneysSection** (trong Profile): list hành trình + "Bắt đầu/Kết thúc hành trình" (banner active). Tạo journey → set active → check-in tự gắn vào.
- **JourneyDetailSheet** (lazy → maplibre tách chunk): stats + **map dotted route** (flex-1, cao lên khi kéo Sheet) + timeline. Mỗi point có ảnh → **StopPhotoStack** trên marker (2 lá xếp chồng + "+N" placeholder, bấm → lightbox ảnh của point đó, caption name/note/address); point không ảnh → chấm số. `Sheet grow` = body flex-col để map giãn theo kích thước sheet. BE: `Stop` kèm `note/address/images`.

### UI components & pages (tĩnh — chưa nối API)
- **UI primitives:** `Button` (primary/accent/green/outline, pill), `Chip`, `XPBadge`, `Card`, `ImagePlaceholder`.
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
