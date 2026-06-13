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
- `POST /checkpoints` (check-in: tạo + cộng **+10 XP atomic** trong transaction, `SELECT total_xp FOR UPDATE`, tính lại level). Address + province **do FE resolve** (gọi Photon từ browser, `lib/photon.ts`) rồi gửi trong payload — BE chỉ sanitize và lưu, không gọi Photon nữa → response nhanh hơn ~200-500ms, không còn lo Cloud Run cắt CPU.
- Upload ảnh (`AddImages`) chạy **song song** (`errgroup`, giữ thứ tự) → 3 ảnh ~1 round-trip thay vì 3 tuần tự.
- `GET /checkpoints?bbox=` ⭐(map, `ST_MakeEnvelope` + GIST) · `GET /checkpoints/nearby` (`ST_DWithin` + KNN)
- `GET /checkpoints/me` · `GET /checkpoints/{id}` (detail + images + author) · `POST /checkpoints/{id}/images` (multipart → R2, owner, legacy)
- **Upload trực tiếp từ browser → R2** (presigned URL flow): `POST /checkpoints/{id}/upload-urls` `{ count }` → `[{ upload_url, object_key, thumbnail_upload_url, thumbnail_key }]`; FE PUT thẳng R2 bằng URL đó (self-auth, không cần Authorization header); `POST /checkpoints/{id}/images/link` `{ images [{object_key, thumbnail_key}] }` → BE ghi keys vào DB. Loại bỏ double-hop FE→BE→R2. `PresignUpload(key, ttl)` trên R2 client dùng SigV4 query-string auth + `UNSIGNED-PAYLOAD`.
- `DELETE /checkpoints/{id}` (owner) — **HARD delete trong 1 tx**: xóa row (+ảnh cascade), **trừ lại XP** (xp_event âm `checkin_deleted`, lock FOR UPDATE, recompute level), `checkpoint_count--`, `places.checkin_count--` + **xóa place mồ côi** (NOT EXISTS checkpoint trỏ tới); sau commit best-effort xóa file R2 (`storage.Delete` — SigV4 DeleteObject mới, skip legacy full-URL keys). Handler phân biệt 404/500.
- Migration 0004 (`checkpoints` có `location` generated GEOGRAPHY + GIST, `checkpoint_images`). Tests: `levelForXP` (table-driven), service create + validation (mock repo).

### Place / Discovery — Phase 4 ✅ (domain `internal/place`)
- Migration 0006: bảng `places` (pg_trgm + GIST + `checkin_count`) + `checkpoints.place_id`.
- `place.ResolveInTx` — match (ST_DWithin 75m + `similarity()`>0.3) hoặc tạo place mới, **trong tx check-in** (atomic với XP); `checkin_count++`. Check-in nhận `place_id` optional.
- `GET /places/search` (trgm) · `/places/nearby` (ST_DWithin) · `/places/{id}` (detail: avg rating, 6 ảnh + 5 review).
- `GET /discover/feed?lat&lng&cursor` — feed cộng đồng **sắp gần → xa** (`ST_Distance`/KNN, **không giới hạn radius**), keyset cursor `"dist:id"`, trả `distance_m` + author + ảnh đầu.
- `GET /places/popular` — top theo `checkin_count`, **RWMutex TTL 60s cache + singleflight** (gộp request trùng).

### Gamification — Phase 5 G1–G4 ✅ (domain `internal/gamification`)
- **G1 XP/Level + event log**: migration 0008 `xp_events`. `AwardXPTx(tx,...)` cộng XP + tính level + ghi event **trong tx check-in** (`SELECT ... FOR UPDATE`); checkpoint repo gọi qua interface (decouple). `XPProgress(xp)` → `xp_to_next`/`level_progress` gắn vào mọi user read (`identity.scanUser`). `levelForXP` chuyển checkpoint → gamification (export `LevelForXP`).
- **G2 Hộ chiếu**: migration 0009 `checkpoints.province` (reverse-geocode `address.state`, geocode client mở rộng + `Province()`). `GET /me/passport` — gom theo tỉnh (COUNT, MIN/MAX ngày, ảnh đại diện qua subquery).
- **G3 Bảng xếp hạng**: `GET /leaderboard` — top 100 theo `total_xp` (`RANK() OVER`) + hạng của tôi (`RankOf`), **single-entry TTL 60s cache + singleflight**.
- **G4 Huy hiệu (rule engine)**: migration 0010 `user_badges`. Catalog + rule trong code (`badges.go`); `EvaluateBadgesTx` chạy **trong tx check-in** → award idempotent (`INSERT ... ON CONFLICT DO NOTHING RETURNING`), trả `[]Badge` (kèm tên/icon) cho check-in response (`CreateResult.new_badges` → toast khoe huy hiệu FE); `GET /me/badges`. Tests: `LevelForXP`/`XPProgress`/`satisfiedBadges` table-driven.

### Journey — Phase 3 J1–J2 ✅ (domain `internal/journey`)
- Migration 0007: `journeys` + `checkpoints.journey_id`. Migration **0011**: bỏ unique index 1-active → **cho phép nhiều journey active cùng lúc** (partial index `(user_id, updated_at DESC) WHERE is_active`).
- CRUD: `POST/GET me/GET {id}/PATCH/DELETE /journeys` + `POST /journeys/{id}/checkpoints/{cpId}`. Tạo/xóa cập nhật `users.journey_count` (tx); xóa detach checkpoints.
- **Nhiều active journey**: PATCH `is_active` chỉ set/clear journey đó (không còn clear-others). Check-in **không tự gắn** nữa — FE gửi `journey_id` user chọn từ dropdown; service gọi `BelongsToUser(userID, journeyID)` validate quyền sở hữu, nếu không phải của user thì bỏ qua (gắn nil) → chặn gắn vào journey người khác.
- Detail `GET /journeys/{id}`: stats (count, ΣXP, **distance km bằng `ST_MakeLine(... ORDER BY created_at)`/`ST_Length`**) + stops theo thời gian (timeline + map).

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

- ✅ **Đã deploy Cloud Run** (CI `deploy.yml` + Telegram alert theo từng step).
- 🟡 **Test**: có unit test cho `geocode`, `checkpoint` (service create/validation/delete + attach/reject journey), `gamification` (`LevelForXP`/`XPProgress`/`satisfiedBadges`), `journey`. Còn thiếu: auth flow, place/discovery. (Chạy test thủ công — không tự động `go test`.)
- ⚠️ **R2 SigV4** — PutObject/DeleteObject chạy thật với credential thật (avatar + checkpoint images + xóa).
- ❌ Phase 6: AI Plan (chưa làm BE).

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
