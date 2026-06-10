# Checkpoint App

> Travel social app cho Việt Nam: check-in địa điểm, pin lên map gamified, upload khoảnh khắc,
> kiếm XP, build "digital travel passport", và gợi ý địa điểm gần + trip ý tưởng từ community data.

Mục tiêu: **vừa học Go production patterns vừa có portfolio** (không phải CRUD app).

---

## Tech stack (đã chốt — tất cả $0/tháng ở traffic thấp)

| Layer      | Tech                          | Lý do                                  |
| ---------- | ----------------------------- | -------------------------------------- |
| Backend    | Go 1.25 + chi router          | Tự code tay                            |
| Frontend   | Next.js / React PWA           | AI generate, deploy Cloudflare Pages   |
| Database   | Supabase Postgres + PostGIS   | Free 500MB, managed                    |
| Auth       | **Go JWT tự viết**            | Supabase chỉ verify; học middleware    |
| Storage    | Cloudflare R2                 | Free 10GB, no egress fee               |
| Cache      | Upstash Redis                 | Free 10k req/day                       |
| Maps       | Mapbox                        | Free 50k req/month                     |
| AI         | Gemini API                    | Free tier                              |
| Infra      | GCP Cloud Run                 | Free 2M req/month, tiện luyện ACE cert |
| CI/CD      | GitHub Actions                | Free                                   |
| CDN + DNS  | Cloudflare                    | Free SSL + cache                       |

> **Postgres thay vì Mongo**: cần PostGIS radius query (`ST_DWithin`), data có quan hệ rõ
> (User → Checkpoint → Journey), và đã có Supabase. Mongo không thêm giá trị cho app này.
>
> **Bỏ Fly.io**: đã hết free tier (chỉ còn trial 2h / 7 ngày).

---

## Auth flow (đã chốt)

```
STEP 1  FE → Supabase login                         → supabase_token
STEP 2  FE → POST /auth/exchange (supabase_token)    → BE verify supabase_token (JWKS / ES256)
                                                       → lookup/create user trong DB
                                                       → app_token (15m) + refresh_token (7d)
STEP 3  FE → API calls, Header: Bearer app_token     → middleware Go verify key của BE
STEP 4  app_token hết hạn → POST /auth/refresh       → rotate → app_token + refresh_token mới
```

- Tách Supabase auth khỏi business logic — BE **control hoàn toàn** token runtime.
- `refresh_token` lưu **hash (SHA-256)** trong DB → revoke được, leak DB cũng vô dụng.
- Refresh **rotation**: mỗi lần refresh, revoke token cũ + cấp token mới.

---

## Build phases

| Phase | Tên              | Features chính                                                              | Go patterns luyện                                             |
| ----- | ---------------- | -------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **1** | Foundation       | Register/Login/Refresh, User Profile, avatar upload, JWT middleware, deploy | Clean arch, DI, JWT middleware, R2 upload, CI/CD             |
| **2** | Checkpoint Core  | GPS check-in, upload ảnh, note/review, detail, list, +10 XP                 | Multipart, PostGIS, transaction, `SELECT FOR UPDATE`         |
| **3** | Journey          | Create journey, timeline, journey map, stats, share card                   | JOIN/aggregation queries, background worker                  |
| **4** | Discovery        | Search place, nearby (`ST_DWithin`), place detail, discover feed, popular   | Full-text search, singleflight, RWMutex cache                |
| **5** | Gamification     | XP/level, digital passport, leaderboard, badges                            | Event-driven, atomic ops, background job                     |
| **6** | AI Features      | Trip planner, smart suggestions, auto-categorize ảnh                        | Gemini API, SSE streaming, worker pool                       |
| **7** | Polish & Launch  | Rate limit, image optimize, Sentry, monitoring, docs                       | Token bucket, middleware chain, OpenTelemetry                |

**MVP = Phase 1–3** (auth + check-in + journey) → đủ để demo. Phase 4–7 là bonus.
Timeline ước tính ~3 tháng ở pace 1h/tối + 3–4h cuối tuần.

---

## Project structure

```
backend/
├── cmd/server/main.go              ← wire everything + graceful shutdown
├── internal/
│   ├── identity/                   ← Phase 1: auth + user profile
│   │   ├── model.go                ← User, Claims, TokenPair
│   │   ├── token.go                ← JWT generate/verify, refresh token gen
│   │   ├── repository.go           ← DB queries (pgx)
│   │   ├── service.go              ← business logic + DI interfaces
│   │   └── handler.go              ← HTTP handlers + routes
│   ├── checkpoint/                 ← Phase 2
│   ├── journey/                    ← Phase 3
│   ├── discovery/                  ← Phase 4
│   ├── gamification/               ← Phase 5
│   └── ai/                         ← Phase 6
├── pkg/
│   ├── authctx/                    ← principal trong request context (tránh import cycle)
│   ├── middleware/auth.go          ← JWT verify middleware
│   ├── respond/respond.go          ← JSON response helper
│   ├── storage/r2.go               ← Cloudflare R2 client (S3 SigV4, stdlib)
│   └── supabase/client.go          ← verify supabase token
├── migrations/                     ← golang-migrate SQL files
├── Dockerfile
└── .github/workflows/deploy.yml
```

---

## API endpoints — Phase 1

```
GET    /health                                       (public)
POST   /auth/exchange    supabase_token → tokens     (public)
POST   /auth/refresh     refresh_token → tokens       (public)
POST   /auth/logout      revoke refresh_token          (public)
GET    /users/me         own profile                  [auth]
PATCH  /users/me         update display_name/bio      [auth]
POST   /users/me/avatar  upload avatar (multipart)    [auth]
GET    /users/{username} public profile               [auth]
```

---

## DB schema — Phase 1

`users` (có denormalized stats để query nhanh: total_xp, level, checkpoint_count, journey_count)
+ `refresh_tokens` (lưu token_hash, expires_at, revoked_at). Xem `migrations/`.

---

## Chạy local

```bash
cd backend
cp .env.example .env          # điền DATABASE_URL, JWT_SECRET, SUPABASE_JWT_SECRET, R2_*
# apply migrations (golang-migrate) hoặc chạy SQL trong Supabase SQL editor
go mod tidy
go run ./cmd/server
# health check
curl localhost:8080/health
```

## Trạng thái

- [x] Phase 1 — Identity: scaffolding + auth flow + profile + avatar upload
- [ ] Phase 1 — deploy lên Cloud Run (Dockerfile + workflow đã có, cần điền secrets)
- [ ] Phase 2+ — chưa bắt đầu
