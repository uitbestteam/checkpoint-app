# Checkpoint — Trạng thái dự án

> Cập nhật: 2026-06-10 · Roadmap đầy đủ xem [../CHECKPOINT.md](../CHECKPOINT.md)

## TL;DR

- **Đang ở Phase 1 (Foundation).**
- **Backend:** Phase 1 *code xong* (auth + profile chạy thật, có CORS), chỉ còn **deploy thật** + **viết test**.
- **Frontend:** vỏ giao diện 5 màn + **luồng auth đã nối thật** (Supabase login → exchange → token → `/users/me`). Các màn khác vẫn data giả.
- **Auth end-to-end ✅:** login (email/Google) → BE exchange → app_token → Profile hiển thị user thật, auto-refresh khi 401.

```
Phase 1  ██████████████████  BE ~92%  |  FE ~55% (auth wired)
Phase 2+ ░░░░░░░░░░░░░░░░░░  chưa bắt đầu (BE)
```

---

## So sánh Backend vs Frontend (theo 16 features)

| # | Feature | Backend | Frontend | Ghi chú |
|---|---------|:---:|:---:|---|
| 1 | Authentication | ✅ | ✅ | **End-to-end**: BE exchange/refresh/logout + JWKS + CORS + **anonymous**; FE login (email/Google/khách) + token store + auto-refresh |
| 2 | User Profile | ✅ | 🟡 | BE: get/update/avatar. FE: ProfilePage đã nối `GET /users/me` (header/stats thật); update/avatar chưa |
| 3 | Map | ❌ | 🟡 | FE: MapPage tĩnh (chưa map thật) |
| 4 | GPS Check-in | ❌ | 🟡 | FE: nút CHECK-IN (UI), chưa gửi GPS |
| 5 | Create Checkpoint | ❌ | 🟡 | FE: CreatePage form (UI) |
| 6 | Upload Image | 🟡 | 🟡 | BE: R2 client + avatar upload xong; chưa upload cho checkpoint |
| 7 | Add Note / Review | ❌ | 🟡 | FE: textarea trong CreatePage |
| 8 | Checkpoint Detail | ❌ | ❌ | chưa có 2 bên |
| 9 | Share Check-in Card | ❌ | ❌ | chưa có 2 bên |
| 10 | Journey Timeline | ❌ | 🟡 | FE: timeline trong AIPlanPage (mock) |
| 11 | Journey Map | ❌ | ❌ | chưa có 2 bên |
| 12 | Place Detail | ❌ | ❌ | chưa có 2 bên |
| 13 | Search Place | ❌ | 🟡 | FE: search bar (UI) trong MapPage |
| 14 | Basic XP & Level | 🟡 | 🟡 | BE: cột `total_xp`/`level` trong schema, chưa có logic. FE: badge/level UI |
| 15 | Discover Basic | ❌ | 🟡 | FE: DiscoverPage feed (mock) |
| 16 | AI Plan Basic | ❌ | 🟡 | FE: AIPlanPage (mock) |

✅ chạy thật · 🟡 UI/khung có nhưng chưa hoạt động · ❌ chưa làm

**Đọc bảng:** BE chỉ làm đúng feature 1–2 (đúng Phase 1) nhưng *chạy được*. FE vẽ UI cho gần hết 16 feature nhưng *chưa cái nào nối backend*.

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

---

## Chi tiết từng bên

- [backend.md](backend.md) — inventory backend (endpoint, file, gì chạy / gì thiếu)
- [frontend.md](frontend.md) — inventory frontend
