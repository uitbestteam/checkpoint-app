# Frontend — Inventory

Vite + React 19 + TS · Tailwind v4 · React Router v7 · PWA · deploy Cloudflare.
Thư mục: [`../web`](../web). Design tokens: [`../design/tokens`](../design/tokens).

## Đã làm

### Hạ tầng
- Scaffold Vite + React 19 + TypeScript, **build/typecheck sạch**.
- **Tailwind CSS v4** với toàn bộ **design tokens** từ mockup (`src/index.css`): palette cam/clay/green, dark mode, shadow ấm, radius, font Fredoka + Be Vietnam Pro.
- **vite-plugin-pwa** (installable), `wrangler.jsonc` (Cloudflare static-assets, SPA fallback).
- Router 5 route + `AppLayout` (header + `<Outlet/>` + bottom nav).

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

- ❌ **Toàn bộ data là giả, hardcode** trong từng page — chưa fetch gì.
- ❌ **Chưa có màn Auth/Login** (Supabase) và lưu/refresh token.
- ❌ **Chưa có API client** gọi backend (`/auth/exchange`, `/users/me`, ...).
- ❌ Chưa có state management / data fetching (gợi ý: TanStack Query).
- ❌ Chưa có map thật (gợi ý: Mapbox GL), ảnh thật, hay xử lý GPS.
- ❌ **PWA icons thật** (`public/icon-192.png`, `icon-512.png` đang được reference nhưng chưa có).
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
