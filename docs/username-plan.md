# Plan — Username gọn đẹp · Đổi username · Login bằng username

> Quyết định: Login-by-username = **BE proxy (kín email)**. Đổi username = **đơn giản, không chặn** (chấp nhận link `/u/oldname` cũ 404). Date: 2026-06-19.

## Hiện trạng
- Gen username: `generateUsername(email)` = `sanitize(local) + "_" + randHex(3)` → luôn có hậu tố random (vd `lhongquan1998_df6aba`) kể cả khi không trùng. [identity/service.go:252](../backend/internal/identity/service.go).
- `PATCH /users/me`: chỉ `display_name` + `bio` ([identity/handler.go:121](../backend/internal/identity/handler.go)). Chưa đổi username.
- Login FE: `supabase.auth.signInWithPassword({ email, password })` ([AuthContext.tsx:106](../web/src/auth/AuthContext.tsx)). Supabase không login bằng username.
- DB: `username TEXT UNIQUE NOT NULL` (phân biệt hoa/thường) + index ([migrations/000001](../backend/migrations/000001_create_users.up.sql)).
- BE env: chỉ `SUPABASE_URL` (chưa có anon key).

---

## Phase 1 — Gen username gọn đẹp (BE)
**File:** `backend/internal/identity/service.go`
- Đổi `generateUsername(email)` → `generateUsername(email string, attempt int)`:
  - `base = sanitize(local part)`, cắt ≤ 20 ký tự, rỗng → `"traveler"`.
  - `attempt == 0` → trả `base` (sạch, không hậu tố).
  - `attempt >= 1` → `base + "_" + strconv.Itoa(attempt+1)` (→ `_2`, `_3`…); lần cuối (attempt 4) có thể fallback `base + "_" + randHex(2)` để chắc chắn thoát vòng.
- `provisionUser` truyền `attempt` của vòng lặp (đã có sẵn loop 5 lần + xử lý unique violation).
- Không đụng user cũ — họ tự đổi ở Phase 2.

---

## Phase 2 — Đổi username (đơn giản, không cooldown)
### Backend
**`identity/handler.go` `UpdateProfile`:** thêm `Username *string` vào request struct; truyền xuống service.
**`identity/service.go`:**
- `UpdateProfile(ctx, id, displayName, bio, username *string)`.
- Nếu `username != nil`: `normalizeUsername` (lowercase + sanitize), validate:
  - regex `^[a-z0-9_]{3,20}$` → sai → `ErrInvalidInput` (400).
  - chặn reserved: `admin, api, me, null, undefined, support, checkpoint, following, by-ids, by-user, share, auth` → 400.
- Uniqueness: dựa DB unique → bắt `isUniqueViolation` → trả `ErrUsernameTaken` (handler → 409).
**`identity/repository.go`:** `UpdateProfile` thêm cột `username` (chỉ set khi non-nil), hoặc `UpdateUsername` riêng.
**(tuỳ chọn) Availability check:** tái dùng `GET /users/{username}` (404 = trống). Khỏi thêm endpoint.

### Frontend
- [EditProfileSheet.tsx](../web/src/components/EditProfileSheet.tsx): thêm field "Tên đăng nhập" (prefix `@`), debounce 400ms gọi check (404=hợp lệ), hiện trạng thái: hợp lệ ✓ / đã dùng / sai định dạng. Disable "Lưu" khi đang sai.
- [api.ts](../web/src/lib/api.ts) `updateProfile`: thêm `username?`; thêm `isUsernameAvailable(u)` (gọi getUserByUsername, 404→true).
- i18n: `ten_dang_nhap`, `username_da_dung`, `username_khong_hop_le`, `username_hop_le` (vi + en).

⚠️ Đổi username → link share cũ `/u/oldname` 404 (đã chấp nhận).

---

## Phase 3 — Login bằng username (BE proxy, kín email)
Luồng: FE gửi `{ identifier, password }` → BE resolve → Supabase password grant → tái dùng exchange → trả `TokenPair`. FE không thấy email.

### Backend
**Config:** thêm `SUPABASE_ANON_KEY` (`cmd/server` loadConfig + `.env`).
**`pkg/supabase`:** thêm `PasswordGrant(ctx, email, password) (accessToken string, err error)`:
- `POST {SUPABASE_URL}/auth/v1/token?grant_type=password`, header `apikey: <anon>` + `Content-Type: application/json`, body `{email,password}`.
- 200 → đọc `access_token`; 400/401 → `ErrInvalidCredentials`.
**`identity` — endpoint mới `POST /auth/login` (PUBLIC):**
1. `identifier` chứa `@` → coi là email; ngược lại resolve username→email qua `repo.GetByUsername` (lấy `email`; nil/anonymous → 401).
2. `supabase.PasswordGrant(email, password)` → supabase access token.
3. Tái dùng logic `Exchange` hiện có (verify JWKS + provision/reconcile + issue) → `TokenPair`.
4. Trả `TokenPair` (đúng shape `/auth/exchange`). Lỗi sai mật khẩu/không thấy user → **401 chung** (không phân biệt để tránh dò).
- Rate-limit: dùng `ipLimiter` sẵn có (route công khai).

### Frontend
- [AuthContext.tsx](../web/src/auth/AuthContext.tsx): thêm `loginIdentifier(identifier, password)` → `POST /auth/login` → lưu TokenPair (`tokens.set`) → `setUser`. (Không set Supabase client session; restore khi reload dùng backend token sẵn có — đã hoạt động.)
- [LoginPage.tsx](../web/src/pages/LoginPage.tsx): field "Email" → "Email hoặc tên đăng nhập" (`t('email_hoac_username')`); submit gọi `loginIdentifier`. Google + signup giữ nguyên qua Supabase.
- i18n: `email_hoac_username`.

---

## Thứ tự triển khai
1. Phase 1 (độc lập, nhỏ) → user mới có username đẹp.
2. Phase 2 (đổi username) → user cũ tự sửa tên xấu.
3. Phase 3 (login username) — cần `SUPABASE_ANON_KEY`.

## Rủi ro / lưu ý
- **Case-sensitivity:** chuẩn hoá lowercase cả khi gen lẫn khi đổi. Cân nhắc đổi index sang `lower(username)` unique (migration) để chặn trùng kiểu `Quan` vs `quan` — nếu không, normalize ở app là đủ.
- **Google-only account** không có mật khẩu → login-by-username/email password sẽ 401 (đúng). Họ vẫn dùng nút Google.
- **Anonymous account**: không có email/username thật → loại khỏi resolve.
- BE giờ chạm password (proxy qua Supabase) — cùng biên giới tin cậy, chấp nhận được; **không log** identifier/password.
- Test BE (user tự chạy `go test`).
- Sau khi xong: cập nhật `docs/STATUS.md` + README ([[update-progress-on-dev]]).
