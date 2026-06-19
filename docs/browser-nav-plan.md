# Plan — Header + Nav riêng cho Web Browser (chưa cài PWA)

> Quyết định: browser (chưa standalone) → **top nav trên header, bỏ bottom nav**; PWA standalone → giữ nguyên shell mobile + bottom nav. Áp dụng cho **mọi browser** (cả mobile). Phân nhánh bằng `isStandalone()`. Date: 2026-06-19.

## Hiện trạng
- [AppLayout.tsx](../web/src/components/AppLayout.tsx): shell mobile-first — `<div class="mx-auto max-w-md flex-col h-full">` chứa `Header` (sticky top) + `main` (scroll) + `BottomNav` (sticky bottom). Một shell duy nhất cho mọi môi trường.
- [BottomNav.tsx](../web/src/components/BottomNav.tsx): 5 tab (Map, Discover, Create, Leaderboard, Profile), gating auth qua `useAuthGate().promptLogin` (Create/Profile yêu cầu đăng nhập), tracking `nav_tab_click`, scroll-to-top khi tap lại Discover.
- `Header`: logo + "Checkpoint" + location label (chỉ ở Discover/Map) + chuông thông báo (chỉ khi đăng nhập).
- [platform.ts](../web/src/lib/platform.ts): đã có `isStandalone()` (matchMedia `display-mode: standalone` + iOS `navigator.standalone`).
- Vấn đề: trên browser desktop, shell `max-w-md` trông như điện thoại giữa màn hình + bottom nav kiểu mobile lạc quẻ.

---

## Mục tiêu
1. **Browser (chưa cài PWA)**: điều hướng nằm **trên header** (top nav), bỏ bottom nav. Desktop tận dụng chiều rộng.
2. **PWA standalone**: **không đổi** — giữ bottom nav + shell mobile như cũ.
3. **Single source of truth** cho danh sách tab + logic gating (không copy-paste BottomNav → TopNav).

---

## Phase 1 — Tách core nav dùng chung (refactor)
Tránh nhân đôi logic tab/gating.

**File mới `web/src/components/nav/navTabs.tsx`** (hoặc tách trong cùng thư mục components):
- Export hằng `tabs: Tab[]` (chuyển từ BottomNav) + type `Tab`.
- Export hook/helper `useNavTab()` trả về `{ handleTabClick(tab, e), isGated(tab), labelOf(tab) }` gói: `useAuth`, `useAuthGate`, `trackEvent`, gating (`requiresAuth`), và event `scroll-discover-to-top`.

**`BottomNav.tsx`**: giữ nguyên markup, chỉ thay phần data/logic bằng import từ `navTabs`. Không đổi UI/UX PWA.

---

## Phase 2 — TopNav (cho browser)
**File mới `web/src/components/nav/TopNav.tsx`** — thanh điều hướng ngang, dùng chung `navTabs`:
- **Desktop (`md+`)**: tab nằm **inline trong header**, hàng ngang, icon + label cạnh nhau (`flex-row`), active = nền `primary-50` bo tròn (tái dùng style active của BottomNav). Bố cục header: `[brand] … [nav tabs] … [bell]`.
- **Mobile browser (`< md`)**: header chật → render **hàng tab thứ 2 sticky ngay dưới brand header** (full-width, mỗi tab `flex-1`, icon trên + label nhỏ — gần giống bottom nav nhưng đặt trên). Dùng `top-[header-height]` sticky.
- Bỏ `env(safe-area-inset-bottom)`; thay bằng inset-top đã có ở header.
- Giữ nguyên: gating login wall, tracking, scroll-to-top Discover, active highlight, `aria-label`/`title`.

---

## Phase 3 — AppLayout phân nhánh shell
**`AppLayout.tsx`:**
- `const standalone = isStandalone();`
- Tách 2 shell (dùng chung providers + `main` + ScrollContainerContext):
  - **`standalone`** → shell hiện tại: `max-w-md` + `Header` + `main` + `<BottomNav/>`.
  - **browser** → shell mới:
    - Container rộng hơn: `max-w-md` (mobile) → `md:max-w-3xl lg:max-w-5xl` (desktop). Map page full-bleed như cũ.
    - `Header` nhúng `TopNav` (desktop inline); mobile thêm hàng tab thứ 2.
    - **Không** render `<BottomNav/>`.
- Giữ logic provider theo `!user` (anonymous chỉ `LocationProvider`).
- `main` padding: desktop nới `md:px-6`; mobile giữ `px-4`.

**`Header`**: nhận thêm prop `nav?: ReactNode` (hoặc `variant: "pwa" | "browser"`) để chèn TopNav. Location label + bell giữ nguyên.

---

## Phase 4 — Widen content desktop (rà soát)
- **DiscoverPage feed**: dùng `@tanstack/react-virtual` với `getScrollElement = main`. Khi `main` rộng hơn, kiểm tra `measureElement`/`scrollMargin` vẫn đúng (card width đổi). Cân nhắc giới hạn cột feed `max-w-xl mx-auto` bên trong để không quá rộng.
- **MapPage (MapLibre)**: full width/height — lợi khi bỏ bottom nav. Kiểm tra resize map khi layout đổi.
- **Leaderboard/Profile/Badges**: rộng hơn vẫn ổn; có thể center `max-w-2xl`.
- Không bắt buộc phá `max-w-md` toàn bộ — có thể giữ cột giữa mà chỉ đổi nav (ít rủi ro hơn). Đánh dấu là tùy chọn.

---

## Thứ tự triển khai
1. Phase 1 (refactor navTabs) — không đổi UI, an toàn.
2. Phase 3 (AppLayout phân nhánh) + Phase 2 (TopNav) — đi cùng nhau.
3. Phase 4 (widen) — tinh chỉnh sau khi nav chạy.
4. Verify live: chạy app trên browser desktop + mobile viewport (DevTools) + giả lập standalone; chụp Map/Discover/Leaderboard/Profile. Kiểm tra gating login wall ở Create/Profile khi anonymous.

## Rủi ro / lưu ý
- **Thumb-reach (mobile browser)**: top nav khó với ngón cái hơn bottom nav. Đã chọn top-nav-mọi-browser; nếu thấy khó dùng trên mobile, fallback dễ: chỉ đổi top nav ở `md+`, mobile browser giữ bottom nav (đổi điều kiện shfrom `isStandalone()` sang `isStandalone() || viewport<md`).
- `isStandalone()` đọc 1 lần lúc render — standalone không đổi runtime nên OK; nhưng test bằng cách thực sự cài PWA (DevTools "display-mode" override cũng được).
- **InstallHint**: vẫn hữu ích cho mobile browser (mời cài PWA) — giữ nguyên.
- Sticky 2 tầng (brand header + tab row) trên mobile browser: canh `z-index` + `top` offset để không che content; map sticky controls không bị chồng.
- iOS Safari thanh URL co/giãn ảnh hưởng `100vh` — app đã dùng `h-full` từ root, kiểm tra lại.
- Sau khi xong: cập nhật `docs/STATUS.md` + README ([[update-progress-on-dev]]).
</content>
