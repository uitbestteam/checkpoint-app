# Plan — Được Google duyệt OAuth + tính năng Sync ảnh sang Google Photos

> Mục tiêu: (1) gỡ lỗi verification đang bị từ chối ("homepage không giải thích mục đích app"), (2) thêm tính năng **sync ảnh check-in sang Google Photos**, (3) qua được brand/scope verification. Date: 2026-06-19.

## TL;DR — đọc trước khi làm

3 blocker, theo thứ tự ưu tiên:

1. **Homepage (đang bị từ chối)** — trang chủ trên OAuth consent screen phải **tĩnh, public (không cần login), không redirect**, mô tả app làm gì + link Privacy/Terms. Hiện `/` render thẳng Map (cần login / không mô tả) → bị reject. **Sửa ngay, áp dụng cho cả Drive lẫn Photos.**
2. **Domain phải sở hữu được** — Google yêu cầu domain của homepage/privacy/redirect **đã verify trong Search Console**. Hiện đang dùng `checkpoint-web.dev-hongquan.workers.dev` (`*.workers.dev` — domain dùng chung của Cloudflare, **không tự verify được**). → **Nhiều khả năng phải gắn custom domain.** Cần xác nhận sớm.
3. **Scope Photos = RESTRICTED → cần CASA** — scope `photoslibrary.appendonly` (upload-only) là **restricted scope**, đòi **đánh giá an ninh CASA** (tốn phí, làm lại mỗi 12 tháng). Khác hẳn Drive `drive.file` hiện tại (chỉ **sensitive**, không cần CASA). → Quyết định có thực sự cần Photos không (xem §4).

---

## 1. Sửa homepage (blocker #1 — làm đầu tiên)

**Vấn đề:** [web/src/App.tsx:75](../web/src/App.tsx) — route `index` (`/`) render `MapPage`. Reviewer của Google (đăng xuất) mở `/` → thấy app map / bị đẩy login, **không thấy mô tả app**. Đây đúng là lỗi "Your home page does not explain the purpose of your app".

**Yêu cầu của Google cho homepage:**
- Mô tả rõ app làm gì + **tại sao cần dữ liệu Google** (lý do xin scope Drive/Photos).
- Link **thấy được** tới Privacy Policy (đã có `/privacy`) + Terms (`/terms`).
- **Public** — xem được không cần đăng nhập.
- **Tĩnh** — URL không redirect sang URL/domain khác; URL trên consent screen = URL hiển thị trên trình duyệt.
- Nằm trên **domain đã verify** (xem §2).

**Cách làm (đề xuất A — ít phá UX nhất):** tạo trang `/about` công khai, set làm "Application home page" trong OAuth consent screen.
- File mới `web/src/pages/AboutPage.tsx` (mẫu giống [LegalPages.tsx](../web/src/pages/LegalPages.tsx)): logo Checkpoint, 1 đoạn "Checkpoint là gì" (hộ chiếu du lịch số: check-in địa điểm thật, mở con dấu tỉnh, XP, chia sẻ hành trình), 1 mục **"Đồng bộ Google Drive/Photos"** nêu rõ: *opt-in, chỉ upload ảnh/video check-in của chính bạn lên Drive/Photos của bạn, không đọc dữ liệu khác* → khớp đúng scope xin. Footer link `/privacy` + `/terms`.
- Route `path="about"` trong **cả 2 nhánh** (`!user` và logged-in) của [App.tsx](../web/src/App.tsx), đặt cạnh `privacy`/`terms`.
- ⚠️ SPA render client-side — đảm bảo trang hiện nội dung **không cần JS state/login**. Cân nhắc cho reviewer chắc ăn: nội dung mô tả nằm sẵn trong HTML tĩnh (hoặc prerender route `/about`) phòng khi bot của Google fetch HTML thô.

**Phương án B (thay thế):** đổi `/` cho user **chưa đăng nhập** thành landing mô tả app (thay vì discover feed tối giản hiện tại). Sạch về mặt "homepage = root" nhưng đụng nhiều hơn vào `PublicShareLayout`. → Chọn A trừ khi muốn root đẹp luôn.

**Đồng thời rà Privacy/Terms** ([LegalPages.tsx](../web/src/pages/LegalPages.tsx) đã có Limited Use + nhắc Photos) — đảm bảo tên app, scope, và mô tả khớp 100% với consent screen.

---

## 2. Domain ownership (blocker #2 — xác nhận sớm)

- Google verify **tất cả** domain trong project: homepage, privacy, terms, authorized redirect URI, JS origins. Phải chứng minh sở hữu qua **Search Console**.
- `*.workers.dev` là subdomain dùng chung của Cloudflare → **không add được DNS TXT / không verify domain-property được**. Đây là blocker tiềm ẩn rất hay gặp.
- **Hành động:** gắn **custom domain** (vd `checkpoint.<domain-bạn-sở-hữu>`) cho Cloudflare Worker (FE) + cho redirect URI của BE, verify domain đó trong Search Console, rồi mới submit. Nếu chưa có domain → mua 1 domain rẻ. (Đây gần như là điều kiện bắt buộc để qua verification thật.)
- Cập nhật: `og:url`/`canonical` trong [index.html](../web/index.html), `FRONTEND_URL`, `GOOGLE_DRIVE_REDIRECT_URI` (và Photos redirect mới), authorized origins/redirect trong Google Cloud Console.

---

## 3. Triển khai tính năng Sync Google Photos (code)

Mirror hệt package `internal/gdrive` đã chạy thật ([client.go](../backend/internal/gdrive/client.go), [syncer.go](../backend/internal/gdrive/syncer.go), [handler.go](../backend/internal/gdrive/handler.go)).

### Scope
- Dùng **`https://www.googleapis.com/auth/photoslibrary.appendonly`** (upload-only — đúng nhu cầu "đẩy ảnh check-in lên Photos", không cần đọc).
- ⚠️ Lưu ý đổi API tháng 3/2025: `photoslibrary.readonly`/`photoslibrary`/`.sharing` **đã bị gỡ** (403). `appendonly` thì **còn**. Không thiết kế tính năng nào cần đọc thư viện Photos của user.

### Backend (package mới `internal/gphotos`)
- `client.go`: OAuth2 authorization code flow (client secret ở BE; state JWT chống CSRF) — copy từ gdrive, đổi scope + endpoint.
- Upload Google Photos = **2 bước**: (1) `POST https://photoslibrary.googleapis.com/v1/uploads` (raw bytes, header `X-Goog-Upload-*`) → nhận `uploadToken`; (2) `POST /v1/mediaItems:batchCreate` với `uploadToken` (+ tạo/append album "Checkpoint App" qua `albums` — tạo album cũng nằm trong `appendonly`).
- `repository.go` + migration mới `user_gphotos_tokens` (mirror `user_drive_tokens` migration 000020).
- `GET /integrations/photos/callback` (exchange code → lưu token → redirect FE).
- `Syncer.SyncCheckpoint`: lấy token, refresh nếu cần, upload từng ảnh từ R2 lên Photos album. Trigger sau `checkpoint.Create()` giống Drive (nil-safe khi chưa cấu hình).
- Env mới: `GOOGLE_PHOTOS_CLIENT_ID`, `GOOGLE_PHOTOS_CLIENT_SECRET`, `GOOGLE_PHOTOS_REDIRECT_URI` (có thể tái dùng cùng OAuth client với Drive, chỉ khác scope).

### Frontend
- `PhotosConnectCard.tsx` (mirror `DriveConnectCard.tsx`): query status, nút Kết nối → `initPhotosConnect()`, Ngắt kết nối; xử lý `?photos=connected/error` sau redirect.
- Thêm vào section "Tích hợp" trong [ProfilePage.tsx](../web/src/pages/ProfilePage.tsx).
- `api.ts`: `initPhotosConnect`/`getPhotosStatus`/`disconnectPhotos`.
- i18n vi+en cho card.

### Setup ngoài code (Google Cloud Console)
- Enable **Photos Library API**.
- Thêm scope `photoslibrary.appendonly` vào consent screen.
- Thêm redirect URI Photos.
- Chạy migration token table.

---

## 4. Verification — Drive (sensitive) vs Photos (restricted)

| | Drive (`drive.file`) — đang có | Photos (`photoslibrary.appendonly`) — muốn thêm |
|---|---|---|
| Phân loại | **Sensitive** | **Restricted** |
| Cần | Brand verification (homepage, privacy, demo video) | Brand verification **+ CASA security assessment** |
| CASA | ❌ không | ✅ **bắt buộc**, làm lại **mỗi 12 tháng** |
| Chi phí | $0 | Phí thuê assessor (thường vài trăm USD/năm) + công sức |
| Người dùng tối đa khi *chưa* verify | 100 test users | 100 test users |

**Khuyến nghị (cần bạn quyết — xem §6):**
- App này là **portfolio/cá nhân**. CASA cho restricted scope là gánh nặng tiền + thời gian + lặp hằng năm, **không tương xứng** cho 1 portfolio app.
- **Drive `drive.file` đã cover được nhu cầu "sao lưu ảnh check-in"** rồi. Cân nhắc **bỏ Photos**, hoặc giữ Photos nhưng **không submit verification** — chạy ở chế độ "Testing" với ≤100 test users (bạn + bạn bè tự thêm vào danh sách test). Khi đó vẫn dùng được thật mà **không cần CASA**, chỉ hiện màn cảnh báo "app chưa verified" lúc đăng nhập.
- Nếu **chắc chắn** cần Photos public: chấp nhận CASA, ngân sách + lịch reverify hằng năm.

---

## 5. Checklist submit verification (làm sau khi §1–§2 xong)

1. Custom domain đã verify trong **Search Console** (homepage + privacy + redirect cùng domain).
2. OAuth consent screen: App name = "Checkpoint", logo, support email, **Application home page = `/about`** (tĩnh, public, mô tả app), Privacy `/privacy`, Terms `/terms`.
3. Scope list khớp đúng những gì homepage/privacy mô tả (đừng xin dư).
4. **Demo video** (YouTube): quay luồng OAuth thật — bấm Kết nối → màn consent Google hiện đúng scope → app dùng dữ liệu đúng như mô tả (upload ảnh check-in lên Drive/Photos). Bắt buộc cho cả sensitive lẫn restricted.
5. Giải trình từng scope: *vì sao cần*, *dùng làm gì* — bám sát Limited Use.
6. (Chỉ Photos/restricted) Bắt đầu quy trình **CASA** với assessor được Google chấp nhận.
7. Submit → chờ Trust & Safety (sensitive vài ngày–tuần; restricted lâu hơn vì có CASA).

---

## 6. Thứ tự triển khai

1. **Sửa homepage `/about`** (§1) — gỡ lỗi đang bị reject, dùng chung cho mọi scope. ← làm ngay.
2. **Custom domain + verify Search Console** (§2) — nếu không có, mọi submit sẽ fail.
3. Resubmit verification **Drive** (sensitive, không CASA) cho qua trước.
4. **Quyết định Photos:** bỏ / để Testing-mode (≤100 user, không CASA) / hay full verify + CASA (§4).
5. Nếu làm Photos: code package `internal/gphotos` (§3) → (tuỳ) CASA + submit.
6. Sau khi xong: cập nhật `docs/STATUS.md` + README ([[update-progress-on-dev]]).

## Rủi ro / lưu ý
- `*.workers.dev` gần như **không qua được** verification → custom domain là điều kiện thực tế bắt buộc.
- Homepage là SPA → đảm bảo nội dung mô tả hiện **không cần login & không redirect**; cân nhắc prerender `/about`.
- Restricted scope (Photos) kéo theo **CASA hằng năm** — chi phí định kỳ, cân nhắc kỹ cho portfolio app.
- Đừng xin scope dư: chỉ `appendonly` cho Photos, `drive.file` cho Drive.
- Không log token/credential.

## Nguồn
- [Photos API policy](https://developers.google.com/photos/support/api-policy) · [Photos scopes](https://developers.google.com/photos/overview/authorization) · [Photos API updates (3/2025)](https://developers.google.com/photos/support/updates)
- [Restricted scope verification (CASA)](https://developers.google.com/identity/protocols/oauth2/production-readiness/restricted-scope-verification)
- [OAuth policy compliance](https://developers.google.com/identity/protocols/oauth2/production-readiness/policy-compliance) · [App Homepage requirements](https://support.google.com/cloud/answer/13807376)
</content>
</invoke>
