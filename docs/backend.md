# Backend — Inventory

Go 1.25 · chi · pgx/Supabase · JWT · Cloudflare R2 · Cloud Run. Module
`github.com/quanluon/checkpoint-app`. Thư mục: [`../backend`](../backend).

## Đã làm (chạy thật)

### Auth (JWKS, không giữ secret Supabase)
- `POST /auth/exchange` — verify Supabase token qua **JWKS** (ES256, public key, tự xử lý key rotation) → tạo app_token (15m) + refresh_token (7d). Provision user lần đầu.
- `POST /auth/refresh` — **rotation**: revoke token cũ, cấp cặp mới.
- `POST /auth/logout` — revoke refresh token.
- Chỉ chấp nhận ES256/RS256 → chặn alg-confusion attack.
- Hỗ trợ **anonymous sign-in** (user không email): cột `email` nullable + `is_anonymous` (migration 0003).
- **Upgrade khách → tài khoản thật:** `Exchange` reconcile email/is_anonymous theo `sub` (giữ nguyên user + data).

### User Profile
- `GET /users/me` · `PATCH /users/me` (display_name/bio) · `GET /users/{username}` · `POST /users/me/avatar` (multipart → R2).

### Checkpoint — Phase 2 M1–M3 ✅ (domain `internal/checkpoint`)
- `POST /checkpoints` (check-in: tạo + cộng **+10 XP atomic** trong transaction, `SELECT total_xp FOR UPDATE`, tính lại level)
- `GET /checkpoints?bbox=` ⭐(map, `ST_MakeEnvelope` + GIST) · `GET /checkpoints/nearby` (`ST_DWithin` + KNN)
- `GET /checkpoints/me` · `GET /checkpoints/{id}` (detail + images + author) · `POST /checkpoints/{id}/images` (multipart → R2, owner) · `DELETE /checkpoints/{id}` (owner)
- Migration 0004 (`checkpoints` có `location` generated GEOGRAPHY + GIST, `checkpoint_images`). Tests: `levelForXP` (table-driven), service create + validation (mock repo).

### Hạ tầng & chất lượng
- JWT middleware (`pkg/middleware`), principal qua context (`pkg/authctx`, tránh import cycle).
- **CORS** (`go-chi/cors`) — cho FE gọi API, origins qua env `CORS_ALLOWED_ORIGINS`.
- R2 client tự viết bằng **AWS SigV4 thuần stdlib** (`pkg/storage`, 0 dep AWS).
- **Lưu object key, không lưu full URL** (cột `avatar_key`, `checkpoint_images.object_key` — migration 0005). Public URL build lúc đọc từ `R2_PUBLIC_URL` (`storage.PublicURL`, defensive: row cũ lưu full URL vẫn chạy). → đổi CDN/bucket không cần migrate data.
- Clean arch: `handler / service / repository`, DI qua interface (mock được).
- `GET /health`, graceful shutdown, error wrapping `%w` + sentinel errors.
- Migrations: `users` (có denormalized stats), `refresh_tokens` (lưu SHA-256 hash).
- Dockerfile (distroless), Makefile (22 target), CI (`deploy.yml`), `.golangci.yml`.
- ✅ `go build` · `go vet` · `golangci-lint` (0 issues).

## File chính

```
cmd/server/main.go             config + wiring + graceful shutdown
internal/identity/
  doc.go model.go token.go
  repository.go service.go handler.go
pkg/
  authctx/  middleware/  respond/  storage/  supabase/
migrations/                    0001 users, 0002 refresh_tokens, 0003 anonymous
Dockerfile  Makefile  DEPLOY.md  .github/workflows/deploy.yml
```

## Còn thiếu / nợ kỹ thuật

- ⏳ **Chưa deploy thật** — Makefile + DEPLOY.md sẵn, cần `make gcp-secrets && make deploy`.
- ❌ **Chưa có test nào** (service + auth flow nên test trước — mock 3 interface).
- ⚠️ **R2 SigV4 chưa test với credential thật** — compile OK, cần verify khi dùng avatar upload.
- ❌ XP/Level mới có cột trong DB, chưa có logic cộng XP.
- ❌ Toàn bộ Phase 2+ (checkpoint, journey, discovery, gamification, ai).

## Cách chạy

```bash
cd backend
make setup            # .env + migrate CLI + tidy
# điền .env: DATABASE_URL (Session pooler), JWT_SECRET, SUPABASE_URL, R2_*
make migrate-up
make run              # :8080
curl localhost:8080/health
```
Deploy: xem [../backend/DEPLOY.md](../backend/DEPLOY.md).
