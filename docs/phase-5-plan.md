# Phase 5 — Gamification + Profile hoàn thiện

> Mục tiêu: hoàn thiện trang **Hồ sơ** + lớp gamification (XP/level thật, Hộ chiếu con dấu,
> Bảng xếp hạng, Huy hiệu). Bỏ qua AI Plan ở giai đoạn này.
> Tiến độ tổng: xem [STATUS.md](STATUS.md).

## Đặt tên hiển thị (đã chốt — ưu tiên friendly)

```
Trang "Hồ sơ"  (tên trang tổng — trung tính, thân thiện)
├─ Thẻ hộ chiếu     avatar · tên · stats · nút "Sửa hồ sơ"     (Track C)
├─ "Hộ chiếu" 🛂     con dấu tỉnh/thành đã check-in             (G2 — điểm nhấn)
├─ "Huy hiệu" 🏅     badges mở khóa / còn khóa                  (G4)
├─ "Cấp độ" ⚡       progress XP thật (bỏ hardcode 85%/150)     (G1)
└─ "Bảng xếp hạng" 🏆 trang riêng                                (G3)
```

- Giữ ẩn dụ **"Hộ chiếu"** *chỉ cho con dấu nơi đã đến* (đúng metaphor passport, friendly + signature).
- Tránh "Thành tích" (nghe khô/trang trọng) → dùng **"Huy hiệu"** cho badges.

---

## 🅲 Track C — Profile hoàn thiện (FE-only; BE đã sẵn endpoint)

BE có sẵn: `PATCH /users/me` (`display_name`, `bio`) · `POST /users/me/avatar` (multipart field `avatar`) — đều trả `User` đầy đủ.

| # | Việc | Chi tiết |
|---|------|----------|
| C1 | `lib/api.ts` | `updateProfile({display_name?, bio?})` → PATCH; `uploadAvatar(file)` → multipart POST. Trả `User` mới |
| C2 | `AuthContext` | expose `applyUser(u)` (bọc `setUser`) trong context để cập nhật user sau khi sửa |
| C3 | `EditProfileSheet` | Sheet sửa `display_name` + `bio`; tap avatar (icon Camera) → file picker → upload + preview + trạng thái loading/lỗi |
| C4 | `ProfilePage` | nút "Sửa hồ sơ" mở sheet; lưu xong → passport card cập nhật ngay |
| C5 | Validate + docs | tsc/build; cập nhật `frontend.md` + bảng feature #2 → ✅ |

---

## 🅰 Track A — Gamification (domain mới `internal/gamification/`)

Kiến trúc: gamification hook vào **tx check-in** qua interface (như `placeResolver`) để
**+XP / ghi event / xét badge** atomic. Move `levelForXP` ([checkpoint/leveling.go](../backend/internal/checkpoint/leveling.go))
→ `gamification/leveling.go`, export `LevelForXP`, `XPToNext`.

### G1 — XP/Level + event log ⭐ (nền tảng)
- **BE**: migration `xp_events` (`user_id, type, xp, ref_id, created_at`). Check-in +10 XP →
  INSERT 1 event **trong cùng tx** đang cộng XP. Hàm `XPProgress(level, xp)` →
  `{level, xp_to_next, progress}`; nhúng vào `GET /users/me`.
- **FE**: progress bar + "còn N XP" dùng số thật.
- *Go pattern*: event-sourcing-lite, tx composition cross-domain.

### G2 — Hộ chiếu (con dấu tỉnh đã đến) ⭐
- **BE**: reverse-geocode **tỉnh/thành** lúc check-in (geocode client đã có) → `checkpoints.province`
  (migration). `GET /me/passport` → tỉnh đã tới + số cờ + ngày đầu/cuối + ảnh đại diện (GROUP BY/aggregate).
- **FE**: section/trang "Hộ chiếu" — lưới con dấu tỉnh đã thăm.
- *Go pattern*: aggregation query, tích hợp geocode.

### G3 — Bảng xếp hạng
- **BE**: `GET /leaderboard?scope=global|province&cursor=` — `ORDER BY total_xp DESC` keyset `(xp,id)`,
  **RWMutex TTL cache + singleflight** (như `/places/popular`). Kèm "hạng của tôi".
- **FE**: trang xếp hạng (top + highlight mình).
- *Go pattern*: ranking/keyset, cache đồng bộ.

### G4 — Huy hiệu (rule engine)
- **BE**: rule engine định nghĩa trong code (`key, name, icon, predicate`). Sau mỗi event →
  evaluator → award atomic `INSERT user_badges ON CONFLICT DO NOTHING`. Rules mẫu:
  first-checkin, 10-nơi, 5-tỉnh, cú-đêm (0–5h), journey-finisher. `GET /me/badges` (mở khóa + còn khóa).
- **FE**: lưới huy hiệu thật (thay mảng mock), locked/unlocked.
- *Go pattern*: event-driven rule engine, atomic upsert idempotent.

**Thứ tự A**: G1 → G2 → G3 → G4 (mỗi cái dựa trên event log G1).

---

## Triển khai
**C → G1 → G2 → G3 → G4.** Mỗi milestone: code → `go build`/`vet`/`lint` + FE `tsc`/`build` →
cập nhật docs (`STATUS.md` bảng feature + `backend.md`/`frontend.md`). Test BE **viết sẵn, user tự chạy**.
