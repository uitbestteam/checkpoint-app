# Checkpoint

Travel social app cho Việt Nam: check-in địa điểm, pin lên map gamified, upload
khoảnh khắc, kiếm XP, build **digital travel passport**, và gợi ý trip bằng AI.

> Mục tiêu: vừa học **Go production patterns** vừa làm **portfolio**.

## Trạng thái — Phase 1 (Foundation)

| | Tiến độ | Ghi chú |
|---|---|---|
| **Backend** | ~90% | Auth + Profile chạy thật; còn deploy + test |
| **Frontend** | ~40% | UI 5 màn xong (tĩnh); chưa nối API/auth |

👉 Chi tiết + bảng so sánh 16 feature: **[docs/STATUS.md](docs/STATUS.md)**

## Cấu trúc repo

```
checkpoint/
├── backend/      Go API — chi, pgx/Supabase, JWT, R2, Cloud Run   (git repo riêng)
├── web/          Vite + React 19 PWA — Tailwind v4, Cloudflare     (git repo riêng)
├── design/       mockups + design tokens (design/tokens/)
├── docs/         STATUS.md · backend.md · frontend.md  ← tiến độ
├── CHECKPOINT.md roadmap đầy đủ (7 phases, 16 features)
└── README.md     (file này)
```

## Tech stack

Go · chi · Supabase Postgres + PostGIS · JWT (verify Supabase qua **JWKS/ES256**) ·
Cloudflare R2 · GCP Cloud Run — phía web: React PWA · Tailwind v4 · Cloudflare Pages.
Tất cả ở free tier (~$0/tháng). Auth flow & lý do chọn stack: [CHECKPOINT.md](CHECKPOINT.md).

## Bắt đầu nhanh

```bash
# Backend
cd backend && make setup        # .env + migrate CLI + deps
make migrate-up && make run     # :8080  → curl localhost:8080/health
# Deploy: xem backend/DEPLOY.md

# Frontend
cd web && npm install && npm run dev   # :5173
```

## Quy ước

Sau **mỗi lần dev**, cập nhật [docs/STATUS.md](docs/STATUS.md) (và `docs/backend.md` /
`docs/frontend.md`, README nếu đổi scope) để tiến độ luôn khớp thực tế.
