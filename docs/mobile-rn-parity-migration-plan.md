# Mobile-RN ↔ Web PWA — Kế hoạch migrate đạt parity 100%

> Mục tiêu: đưa app `mobile-rn` (Expo SDK 56 + expo-router + nativewind) bằng **100%** với web PWA (`web/`, React 19 + Vite + Tailwind 4) về **UI, style, color, icon, feature, page**.
>
> Cập nhật: 2026-06-23. Nguồn so sánh: `web/src/**` (source of truth) vs `mobile-rn/{app,src}/**`.

---

## 1. Tổng quan hiện trạng

| | Web (PWA) | Mobile-RN | Đánh giá |
| --- | --- | --- | --- |
| Routing | React Router 7 | expo-router (file-based) | ✅ Map 1:1 được |
| Pages/Screens | 11 page + ~14 sheet | 14 screen + 4 dynamic route | 🟡 thiếu một số sheet/flow |
| Design tokens | `index.css` ~257 dòng (đủ scale + semantic + dark) | `tokens.ts` chỉ có color + 3 font | 🔴 thiếu nhiều |
| Icons | 72 icon | 47 icon | 🔴 thiếu 25 |
| i18n keys | 470 (vi/en) | 156 (vi/en) | 🔴 thiếu ~314 (~67%) |
| Dark mode | Có | Không | 🔴 thiếu hoàn toàn |
| State/data | React Query + Context + Firestore | React Query + service + Firestore | ✅ tương đương |
| API surface | `lib/api.ts` (~1004 dòng) | `lib/api.ts` (~893 dòng) | ✅ gần đủ |

**Kết luận:** Phần backend/API/data-layer đã gần như parity. Gap lớn nằm ở **design system (tokens, dark mode, icon), i18n coverage, và một số UI/flow phức tạp** (journey management, avatar frames, media lightbox, badge celebration, follow lists, edit checkpoint).

---

## 2. Phân tích gap chi tiết

### 2.1. Pages / Screens

| Web page | Mobile-RN | Trạng thái | Việc cần làm |
| --- | --- | --- | --- |
| MapPage | `app/index.tsx` | 🟡 thiếu **clustering** | Thêm clustering (supercluster / react-native-maps clustering) |
| DiscoverPage | `app/discover.tsx` | ✅ | rà i18n + UI polish |
| CreatePage | `app/create.tsx` | ✅ | rà parity form fields |
| ProfilePage | `app/profile.tsx` | 🟡 partial | thêm follow lists, passport rich, journeys section, upgrade banner |
| LeaderboardPage | `app/leaderboard.tsx` | ✅ | rà podium style |
| BadgeCollectionPage | `app/badges.tsx` | 🟡 | filter all/unlocked/locked, art SVG, unlock conditions |
| AIPlanPage | `app/ai-plan.tsx` | ✅ (cả 2 đều teaser) | match copy/style |
| LoginPage | `app/login.tsx` | ✅ | rà parity |
| LegalPages | `app/privacy.tsx` + `terms.tsx` | 🟡 stub | đồng bộ nội dung với web |
| Deep links `/c /p /j /u` | `app/[c]/[id]` … | ✅ tồn tại | rà chi tiết từng sheet |

**Sheet/flow của web chưa có ở RN (screen hoặc sheet riêng):**
- `EditProfileSheet` → có `app/edit-profile.tsx` ✅ (rà avatar frame)
- `MyCheckpointsSheet` (province filter, inline edit/delete) → 🔴 chưa có sheet riêng, profile chỉ grid
- `JourneysSection` (create/edit/delete/assign drag-drop) → 🔴 **thiếu UI tạo/sửa/gán journey** (chỉ có view detail `[j]/[id]`)
- `ProfileFollowSection` (followers/following list modal) → 🔴 **thiếu**
- `AvatarCropSheet` + `AvatarFramePicker` → 🔴 **thiếu frame picker** (chỉ crop 1:1)
- `MediaPreview` (lightbox + video player) → 🔴 **thiếu**
- Edit checkpoint → 🔴 **không có screen edit** (chỉ delete/share)
- `BadgeUnlockModal` + `BadgeUnlockToast` + confetti → 🟡 modal đơn giản, **thiếu toast + confetti animation**
- `UpgradeBanner` (anon → account trên profile) → 🟡 cần xác nhận có hiển thị

### 2.2. Design tokens (`tokens.ts` vs `index.css`)

`mobile-rn/src/theme/tokens.ts` **chỉ có**: color scales (primary/clay/green/accent/neutral) + 3 font family.

**Thiếu so với web `index.css`:**
- **Semantic tokens**: `background, foreground, surface, surface-muted, border, input, primary-foreground, secondary, secondary-foreground, muted, muted-foreground, subtle-foreground, ring`
- **Dark mode**: toàn bộ bảng `.dark` (background #16130F, surface #211C17, primary→#FA7345, secondary→#3E9A50 …) — RN chưa có cơ chế color scheme
- **Spacing scale** chuẩn hoá (4/8/12/16/24…)
- **Radii**: xs 6, sm 8, md 12, lg 16, xl 20, 2xl 28
- **Shadows**: sm/md/lg/card/cta (RN cần map sang `shadow*`/`elevation`)
- **Gradients**: `gradient-primary`, `gradient-passport`, `gradient-xp` (dùng `expo-linear-gradient`)
- **Social/status colors**: facebook #1877F2, apple #111111, gold #E0A73A, success/warning/danger/info
- **Font weights** đầy đủ (300–700) + Be Vietnam Pro (mono)
- **Easing/timing**: ease-standard, ease-emphasized
- **Animations**: slide-down, slide-up-fade, scale-pop, glow-badge, confetti-fall, fade

### 2.3. Icons — thiếu 25 (có ở web, thiếu ở RN)

```
award, badge, bookmark, flag-planted, friends, heart, image-up, info, list,
logout, luggage, mail, moon, pin-filled, play, profile, rotate-ccw, rotate-cw,
sparkles, square, user-minus, user-plus, utensils, xp-coin, zoom-in, zoom-out
```
→ Copy path data từ `web/src/icons/registry.tsx` sang `mobile-rn/src/icons/iconPaths.ts`.

### 2.4. i18n — thiếu ~314 keys

Web: 470 keys (vi/en). RN: 156 keys. → Nhiều UI mới (journey, passport, follow, badge conditions, edit checkpoint, settings advanced…) đang **hardcode** hoặc **chưa dịch**. Cần đồng bộ toàn bộ namespace từ `web/src/lib/locales/{vi,en}.json`.

### 2.5. Features còn lệch

| Feature | Web | RN | Việc |
| --- | --- | --- | --- |
| Map clustering | ✅ supercluster | 🔴 markers thường | thêm clustering |
| Avatar frames | ✅ picker + composite | 🔴 | port frame picker + render frame trên `UserAvatar` |
| Media lightbox + video | ✅ | 🔴 | thêm viewer (vd `react-native-image-viewing` + `expo-video`) |
| Journey CRUD/assign | ✅ (32K LOC) | 🔴 chỉ view | thêm create/edit/delete + gán checkpoint |
| Edit checkpoint | ✅ | 🔴 | thêm flow edit (name/note/rating) |
| Followers/Following list | ✅ | 🔴 | thêm sheet/screen |
| Passport stamp themes | ✅ 5 theme | 🟡 grid cơ bản | port stamp style + gradient |
| Badge unlock celebration | ✅ confetti+toast | 🟡 modal | thêm confetti + XP toast |
| Bottom sheet primitive | ✅ `Sheet.tsx` | 🔴 dùng `Modal` trực tiếp | tạo `Sheet` primitive (drag handle + animation) cho UI nhất quán |
| Dark mode | ✅ | 🔴 | thêm theme provider |

---

## 3. Kế hoạch migrate theo phase

### Phase 0 — Nền design system (bắt buộc làm trước)
1. Mở rộng `tokens.ts`: thêm spacing, radii, shadows, semantic light/dark, gradients, social/status colors, font weights (load thêm Montserrat weights + Be Vietnam Pro).
2. Tạo `ThemeProvider` + `useTheme()` (light/dark theo `useColorScheme`, có override thủ công lưu trong settings).
3. Tạo helper `cn`/nativewind config map sang semantic tokens để class song song web.
4. Bổ sung 25 icon còn thiếu vào `iconPaths.ts`.
5. Tạo `Sheet` primitive (bottom sheet: handle, slide-up animation, backdrop, snap) thay cho `Modal` thô.

**DoD:** mọi màn dùng semantic token; toggle dark mode hoạt động; icon registry = 72.

### Phase 1 — i18n đầy đủ
1. Copy toàn bộ key từ `web/src/lib/locales/{vi,en}.json` sang RN, merge giữ key RN hiện có.
2. Quét hardcoded string trong `app/**`, `src/components/**` thay bằng `t(...)`.
3. Verify đủ 470 keys cả 2 ngôn ngữ; ráp `settings` language toggle.

### Phase 2 — Components UI parity
1. `MediaPreview` lightbox + video player.
2. `AvatarFramePicker` + render frame trong `UserAvatar` + composite khi upload.
3. `BadgeUnlockModal` confetti + `XPToast` (đã có XPToast — bổ sung badge toast).
4. `BadgeMedal` render SVG art + locked state + unlock conditions.
5. `PassportSection` stamp themes + gradient (`expo-linear-gradient`).
6. Map mọi `Modal` còn lại sang `Sheet` primitive.

### Phase 3 — Feature/flow còn thiếu
1. **Journeys management**: list + create + edit + delete (delete/detach) + gán checkpoint (chọn nhiều). Port logic từ `JourneysSection.tsx`.
2. **Followers/Following**: sheet danh sách + follow/unfollow inline.
3. **Edit checkpoint**: screen/sheet sửa name/note/rating; map `updateCheckpoint`.
4. **MyCheckpoints**: sheet với province filter + infinite scroll + edit/delete inline.
5. **Map clustering**: tích hợp clustering vào `app/index.tsx`.
6. **UpgradeBanner** cho guest trên profile + login wall các tab gated.

### Phase 4 — Page polish & deep-link parity
1. Rà từng deep-link sheet (`[c] [p] [j] [u]`) khớp nội dung web (view count, XP earned, reactions, comments, share).
2. Đồng bộ Legal pages nội dung với web.
3. AIPlan copy/style khớp.
4. Map detail/place/journey: stats, distance, ảnh theo stop.

### Phase 5 — Native-equivalent của tính năng PWA
1. PWA `InstallHint`/`PWAUpdatePrompt` → dùng `expo-updates` (OTA update prompt).
2. Push notification (FCM/APNs) thay cho Firestore-only in-app (mở rộng, optional).
3. Camera/EXIF/location: rà parity với web (đã có expo-camera/expo-location).

### Phase 6 — QA parity
1. Checklist so sánh từng screen (screenshot web vs RN) theo color/spacing/typography.
2. Verify dark mode mọi screen.
3. Verify 470 i18n keys, không còn hardcode.
4. Verify từng feature ở bảng mục 2.5 = ✅.

---

## 4. Tiêu chí "100% parity" (acceptance)

- [ ] Mọi page/sheet của web có screen/sheet tương ứng ở RN (mục 2.1).
- [ ] `tokens.ts` chứa đủ semantic + dark + spacing + radii + shadow + gradient + social/status color.
- [ ] Dark mode hoạt động trên toàn bộ screen.
- [ ] Icon registry RN = 72 (khớp web).
- [ ] i18n RN = 470 keys vi/en, không còn chuỗi hardcode.
- [ ] 12 mục feature ở bảng 2.5 đều ✅.
- [ ] Bottom sheet dùng chung 1 primitive (UX animation khớp web).
- [ ] Pixel-parity review từng screen (color, spacing, font, radius, shadow).

---

## 5. Ưu tiên & thứ tự đề xuất

`Phase 0 → 1 → 2 → 3 → 4 → 5 → 6`.

Phase 0 và 1 là **nền tảng**, làm trước sẽ giảm rework cho mọi phase sau (mọi component mới dùng token + i18n chuẩn ngay từ đầu). Phase 3 là khối công việc lớn nhất (journey management ~32K LOC ở web).
</content>
</invoke>
