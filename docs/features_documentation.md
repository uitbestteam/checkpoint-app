# Tài liệu các tính năng hiện tại — Checkpoint App

Tài liệu này tổng hợp toàn bộ các tính năng đã được thiết kế, lập trình và đang hoạt động thực tế trên cả hai phía **Backend (Go)** và **Frontend (React PWA)** của ứng dụng mạng xã hội du lịch **Checkpoint**.

---

## 📌 Tổng quan Kiến trúc hệ thống
* **Frontend**: React 19, TypeScript, Tailwind CSS v4, React Router v7, Vite PWA, TanStack Query (React Query) cho quản lý trạng thái API, Firestore SDK cho tương tác trực tiếp phía client (bình luận & thông báo).
* **Backend**: Go (API Server), Chi Router, pgxpool kết nối Supabase PostgreSQL + PostGIS (spatial queries), Redis (cache follows, view count & rate limiter), Cloudflare R2 (lưu trữ media qua luồng presigned URLs trực tiếp từ client).
* **Worker xử lý media**: Cloud Run Worker chạy FFmpeg xử lý encode video bất đồng bộ qua Google Cloud Pub/Sub trigger.

---

## 🗺️ Bản đồ tính năng (Feature Map)

```mermaid
graph TD
    subgraph Frontend (React PWA)
        A[LoginPage] --> B[MapPage]
        B --> C[CreateCheckpointForm / Camera]
        B --> D[CheckpointDetailSheet]
        B --> E[PlaceDetailSheet]
        F[DiscoverPage] --> G[UserProfileSheet]
        H[ProfilePage] --> I[Passport/Badges]
        H --> J[EditProfileSheet / Cropper]
        H --> K[LeaderboardPage]
        H --> L[JourneysSection]
    end
    
    subgraph Backend (Go API & Services)
        M[internal/identity]
        N[internal/checkpoint]
        O[internal/place]
        P[internal/gamification]
        Q[internal/journey]
        R[internal/reaction]
        S[internal/share]
        T[internal/locationiq]
        U[internal/gdrive / gphotos]
    end

    subgraph Firebase / External
        V[(Firestore: Comments & Notifications)]
        W[(LocationIQ Geocoder Proxy)]
    end

    C -.-> |Upload slots & metadata| N
    C -.-> |Bake avatar composite| J
    B --> |ST_MakeEnvelope ?bbox| N
    D --> |Postgres Reactions| R
    D -.-> |Comments Realtime| V
    F --> |ST_Distance feeds| O
    G --> |Follow/Unfollow| M
    I --> |Rules engine badges| P
    L --> |ST_MakeLine route / distance| Q
    J -.-> |Exchange Supabase JWT| M
    U -.-> |Background Sync OAuth2| U
```

---

## 1. Xác thực & Quản lý Tài khoản (Authentication & Identity)

### Trải nghiệm trên Web App
* Người dùng có thể đăng nhập bằng **Email**, **Google OAuth**, hoặc sử dụng tài khoản **Khách (Anonymous)** để trải nghiệm thử ứng dụng ngay lập tức mà không cần khai báo thông tin.
* Khi đang ở tài khoản Khách, giao diện hiển thị banner đề xuất nâng cấp. Khi người dùng chọn nâng cấp sang tài khoản thật (Email/Google), hệ thống tự động đồng bộ và bảo toàn toàn bộ dữ liệu cắm cờ (check-ins), hành trình (journeys), và điểm kinh nghiệm (XP) đã tích lũy từ tài khoản khách sang tài khoản mới.
* Cơ chế tự động làm mới phiên đăng nhập (auto-refresh token) chạy ngầm giúp duy trì đăng nhập mà không bị ngắt quãng giữa chừng.

### Thành phần mã nguồn
* **Frontend**:
  * Giao diện Đăng nhập: [LoginPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/pages/LoginPage.tsx)
  * Quản lý trạng thái xác thực: [AuthContext.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/auth/AuthContext.tsx)
  * Cấu hình Supabase Client: [supabase.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/supabase.ts)
  * Banner nâng cấp tài khoản: [UpgradeBanner.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/UpgradeBanner.tsx)
  * Dịch lỗi Auth Supabase sang Tiếng Việt: [authErrors.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/authErrors.ts)
  * Tự động đính kèm Token & Re-auth 2 tầng chống kẹt token: [api.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/api.ts)
* **Backend**:
  * Đăng ký Endpoint JWT & Auth: [identity/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/handler.go)
  * Xử lý trao đổi Token qua JWKS Supabase: [identity/service.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/service.go)
  * Thao tác cơ sở dữ liệu Token & User: [identity/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/repository.go)
  * JWT Verification Middleware: [pkg/middleware/auth.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/pkg/middleware/auth.go)

> [!NOTE]
> **Cơ chế Re-auth 2 tầng + Single-flight**: Khi xảy ra lỗi `401 Unauthorized`, client frontend sẽ thực hiện (1) dùng `refresh_token` nội bộ đổi cặp token mới từ backend; (2) nếu fail, sẽ thử re-exchange từ Supabase Session (nếu còn hạn). Cơ chế single-flight đảm bảo các API gọi đồng thời khi bị 401 không gửi yêu cầu làm mới trùng lặp gây xung đột khóa xoay vòng refresh token.

---

## 2. Hồ sơ cá nhân & Khung ảnh đại diện động (User Profile & Avatar Customization)

### Trải nghiệm trên Web App
* Người dùng xem được thông tin cá nhân bao gồm: Tên hiển thị, `@username`, Tiểu sử (Bio), Cấp độ, Thanh tiến trình XP, tổng số cờ, hành trình đã đi.
* Khi chỉnh sửa hồ sơ thông qua `EditProfileSheet`, người dùng có thể cắt ảnh đại diện tỉ lệ 1:1 bằng công cụ zoom/xoay mượt mà (`react-easy-crop`).
* **Hệ thống khung Avatar động**: Tùy thuộc vào cấp độ (Level) hoặc các Huy hiệu (Badges) đã mở khóa, người dùng có thể chọn các khung viền độc đáo (ví dụ: Đồng, Bạc, Vàng, Kim Cương, hoặc khung phiêu lưu đặc biệt) để lồng vào ảnh đại diện. Khung này sẽ được render trực tiếp đè lên avatar và hiển thị ở mọi nơi (bảng xếp hạng, danh sách bình luận, bản tin khám phá).

### Thành phần mã nguồn
* **Frontend**:
  * Trang hồ sơ: [ProfilePage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/pages/ProfilePage.tsx)
  * Form chỉnh sửa thông tin: [EditProfileSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/EditProfileSheet.tsx)
  * Cắt ảnh đại diện: [AvatarCropSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/AvatarCropSheet.tsx)
  * Bộ chọn khung ảnh: [AvatarFramePicker.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/AvatarFramePicker.tsx)
  * Danh mục và điều kiện khung: [avatarFrames.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/avatarFrames.ts)
  * Xử lý ghép ảnh & khung phía client (Canvas2D): [avatarComposite.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/avatarComposite.ts)
* **Backend**:
  * Endpoint update profile (`PATCH /users/me`): [identity/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/handler.go)
  * Cập nhật avatar key trong database: [identity/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/repository.go)

> [!TIP]
> **Tối ưu hóa tài nguyên Backend bằng composite baking**: Thay vì truyền ảnh đại diện + ID khung để Backend xử lý hoặc render đè bằng CSS ở nhiều nơi, ứng dụng sử dụng [avatarComposite.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/avatarComposite.ts) để vẽ ghép ảnh đã crop và khung viền đã chọn thành một file ảnh PNG 512x512 duy nhất bằng HTML5 Canvas ngay trên trình duyệt trước khi tải lên Cloudflare R2. Điều này giúp giảm thiểu việc xử lý đồ họa nặng nề ở phía Backend và tương thích hoàn hảo với mọi thẻ `<img>` thông thường.

---

## 3. Bản đồ tương tác & Trải nghiệm Cắm cờ GPS (Interactive Map & Geolocation Check-in)

### Trải nghiệm trên Web App
* **Bản đồ chính**: Tích hợp bản đồ vectơ tương tác bằng thư viện `MapLibre GL` kết hợp nguồn dữ liệu bản đồ miễn phí `OpenFreeMap`. Các điểm cắm cờ (check-ins) được hiển thị dưới dạng các ghim (markers) phân loại theo màu sắc danh mục (cà phê, ẩm thực, thiên nhiên, ngắm cảnh, khác).
* **Tải dữ liệu theo vùng nhìn**: Khi kéo/zoom bản đồ, ứng dụng tự động truy vấn các điểm cắm cờ nằm trong khung tọa độ hiển thị (`bbox` - bounding box) để tối ưu lượng dữ liệu tải về.
* **Quy trình Cắm cờ (Check-in)**:
  1. Người dùng bấm nút **Cắm cờ** ở thanh điều hướng hoặc trên bản đồ.
  2. Ứng dụng yêu cầu quyền định vị GPS của thiết bị. Hệ thống hiển thị một bảng giải thích quyền vị trí trực quan trước khi kích hoạt prompt mặc định của trình duyệt để tăng tỉ lệ đồng ý của người dùng.
  3. Lấy vị trí thành công -> tự động điền tọa độ và gửi yêu cầu reverse geocode ngầm để tìm địa chỉ gợi ý gần nhất.
  4. Người dùng điền: Tên địa điểm (tự động điền theo địa chỉ gợi ý), danh mục, ghi chú, đánh giá (1-5 sao), ảnh hoặc video.
  5. Đăng bài -> Form cắm cờ đóng ngay lập tức và bài viết được đưa vào hàng đợi ngầm (`CheckinQueue`) để tải ảnh/video lên R2 và gửi API về Backend. Người dùng nhận được thông báo Toast thưởng XP realtime mà không cần chờ đợi.
* **Chụp ảnh trực tiếp hoặc chọn từ thiết bị**:
  * Hỗ trợ chụp ảnh trực tiếp bằng camera tích hợp trong ứng dụng (`react-webcam`) hỗ trợ camera trước/sau, chọn ống kính (góc rộng/thường) và xem trước ảnh (preview-after-shot) trước khi chấp nhận.
  * Hỗ trợ trích xuất tọa độ GPS từ ảnh thư viện (**Check-in từ ảnh**): Người dùng tải một bức ảnh chụp từ thư viện lên, ứng dụng sử dụng thư viện `exifr` đọc siêu dữ liệu EXIF của bức ảnh để tự động điền tọa độ cắm cờ tương ứng.
* **Xử lý video bất đồng bộ**: Người dùng có thể cắm cờ kèm 1 đoạn video ngắn (độ dài tối đa 10 giây). Video raw được tải thẳng lên R2, sau đó Backend đưa vào hàng đợi GCP Pub/Sub để Worker chạy FFmpeg xử lý nén, chuyển mã (transcode) về chuẩn MP4 H.264 mượt mà kèm ảnh thu nhỏ (thumbnail).

### Thành phần mã nguồn
* **Frontend**:
  * Trang Bản đồ chính: [MapPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/pages/MapPage.tsx)
  * Form cắm cờ & Picker: [CreateCheckpointForm.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/CreateCheckpointForm.tsx)
  * Quản lý hàng đợi cắm cờ ngầm: [CheckinQueue.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/context/CheckinQueue.tsx)
  * Camera chụp ảnh trong app: [CameraCaptureSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/CameraCaptureSheet.tsx)
  * Đọc vị trí GPS bền vững trên iOS: [geo.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/geo.ts)
  * Explainer popup xin quyền vị trí: [LocationPermissionContent.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/LocationPermissionContent.tsx)
  * Tích hợp đọc EXIF từ ảnh: [PhotoCheckinTab.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/PhotoCheckinTab.tsx)
  * Context quản lý vị trí dùng chung: [LocationProvider.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/location/LocationProvider.tsx)
  * Xử lý nén ảnh client-side & chuyển đổi file: [image.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/image.ts)
  * Xem ảnh phóng to đa nhiệm: [MediaPreview.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/MediaPreview.tsx) (sử dụng thư viện `react-photo-view`)
* **Backend**:
  * REST API Checkpoints: [checkpoint/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/checkpoint/handler.go)
  * Logic nghiệp vụ Checkpoint & Tạo slots tải lên R2: [checkpoint/service.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/checkpoint/service.go)
  * Truy vấn PostGIS Spatial (`ST_MakeEnvelope`, `ST_DWithin`): [checkpoint/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/checkpoint/repository.go)
  * Proxy gợi ý địa điểm qua LocationIQ: [locationiq/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/locationiq/handler.go)
  * Worker chuyển mã video bất đồng bộ (FFmpeg + Pub/Sub): [checkpoint/processor.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/checkpoint/processor.go)

---

## 4. Bản tin khám phá & Quản lý Địa điểm (Discover Feed & Place Hub)

### Trải nghiệm trên Web App
* **Bản tin Khám phá (Discover Feed)**: Hiển thị các bài viết cắm cờ công khai của cộng đồng theo thứ tự **từ gần nhất đến xa nhất** dựa trên khoảng cách địa lý đến vị trí hiện tại của người dùng.
* **Cuộn vô hạn ảo hóa (Virtualized Scroll)**: Bản tin sử dụng cơ chế ảo hóa danh sách. Chỉ những bài viết hiển thị trên màn hình mới thực sự được dựng (render) vào DOM. Giúp ứng dụng hoạt động cực kỳ mượt mà, không bị giật lag ngay cả khi cuộn qua hàng ngàn bài viết chứa hình ảnh/video chất lượng cao.
* **Danh sách Địa điểm Phổ biến**: Liệt kê các địa điểm được cắm cờ nhiều nhất (Popular Places) kèm theo điểm đánh giá trung bình.
* **Trang Địa điểm Chi tiết (Place Detail)**: Người dùng có thể bấm vào một địa điểm bất kỳ để xem danh sách ảnh chụp của cộng đồng tại địa điểm đó, đọc đánh giá/review, và sử dụng nút **"Cắm cờ tại đây"** để nhanh chóng check-in địa điểm này mà không cần nhập lại tên.

### Thành phần mã nguồn
* **Frontend**:
  * Giao diện bản tin chính: [DiscoverPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/pages/DiscoverPage.tsx)
  * Chi tiết địa điểm: [PlaceDetailSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/PlaceDetailSheet.tsx)
* **Backend**:
  * Endpoint tìm kiếm & thông tin địa điểm: [place/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/place/handler.go)
  * Tìm kiếm text full-text search (`pg_trgm`): [place/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/place/repository.go)

> [!TIP]
> **Tối ưu hóa API Feed bằng Keyset Cursor**: Để phân trang hiệu quả trên dữ liệu sắp xếp theo khoảng cách không gian (spatial distance), Backend sử dụng Keyset Cursor ghép nối `"distance:id"` thay vì sử dụng `OFFSET` truyền thống. Điều này giúp loại bỏ tình trạng trùng lặp bài viết khi người dùng vừa cuộn vừa có bài viết mới cắm cờ và cải thiện hiệu năng truy vấn database Postgres.

---

## 5. Hành trình du lịch (Travel Journeys)

### Trải nghiệm trên Web App
* Người dùng có thể tạo một hoặc nhiều hành trình du lịch đang hoạt động song song (ví dụ: *"Khám phá Hà Giang 3 ngày 2 đêm"*, *"Sài Gòn Food Tour"*).
* Khi thực hiện cắm cờ (check-in), form cắm cờ cung cấp một dropdown để người dùng lựa chọn ghi nhận điểm cắm cờ này vào hành trình nào (mặc định gợi ý hành trình hoạt động gần nhất).
* **Trang chi tiết hành trình**:
  * Hiển thị danh sách các điểm dừng chân theo dòng thời gian (timeline).
  * Vẽ đường nối hành trình (dotted route line) liên tục đi qua các điểm cắm cờ trên bản đồ.
  * Tự động tính toán tổng số quãng đường đã di chuyển bằng đơn vị Kilômét.
  * Bản đồ hiển thị bộ ghim xếp chồng ảnh (Stop Photo Stack) chứa các bức ảnh chụp tại điểm dừng chân đó, bấm vào để mở xem ảnh dạng lưới.

### Thành phần mã nguồn
* **Frontend**:
  * Khối quản lý hành trình trên trang cá nhân: [JourneysSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/JourneysSection.tsx)
  * Giao diện chi tiết Timeline & Map hành trình: [JourneyDetailSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/JourneyDetailSheet.tsx)
* **Backend**:
  * REST API Journeys: [journey/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/journey/handler.go)
  * Truy vấn dữ liệu hành trình: [journey/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/journey/repository.go)

> [!NOTE]
> **Tính toán độ dài hành trình chuẩn xác**: Backend sử dụng các hàm hình học của PostGIS (`ST_MakeLine` sắp xếp theo thời gian cắm cờ và `ST_Length` chuyển độ dài tuyến đường sang mét để tính toán khoảng cách thực tế giữa các điểm dừng chân) thay vì tính toán xấp xỉ khoảng cách đường chim bay tuyến tính trên client.

---

## 6. Gamification: Cấp độ, Huy hiệu & Hộ chiếu (XP, Badges & Travel Passport)

### Trải nghiệm trên Web App
* **Hệ thống cấp độ (Level & XP)**: Mỗi hành động cắm cờ (check-in) hợp lệ thưởng cho người dùng **+10 XP** theo cách nguyên tử (atomic transaction) để tránh gian lận. Cấp độ tăng dần dựa trên tổng XP tích lũy và hiển thị huy hiệu Tier cấp độ (Đồng, Bạc, Vàng, Kim Cương...) kèm số cấp độ được vẽ căn giữa.
* **Hộ chiếu du lịch (Digital Passport)**: Giao diện mô phỏng cuốn hộ chiếu thật. Mỗi tỉnh thành của Việt Nam mà người dùng đã từng ghé thăm cắm cờ sẽ xuất hiện một "Con dấu" đại diện chứa tên tỉnh, ngày ghé thăm đầu tiên/mới nhất, và một ảnh tiêu biểu chụp tại tỉnh đó.
* **Bảng xếp hạng (Leaderboard)**: Hiển thị danh sách top 100 người dùng có điểm XP cao nhất thế giới kèm các vị trí xếp hạng vàng/bạc/đồng đặc biệt. Người dùng luôn được ghim ở dưới cùng bảng xếp hạng nếu nằm ngoài top 100 để dễ theo dõi thứ hạng cá nhân. Bấm vào bất kỳ dòng nào sẽ mở hồ sơ (`UserProfileSheet`) của người chơi đó.
* **Hệ thống Huy hiệu (Badges)**:
  * Catalog huy hiệu được cấu hình động trên Backend. Người dùng có thể mở khóa các huy hiệu như: *Hành trình đầu tiên*, *Người thích cắm cờ*, *Khám phá mọi nơi*, *Cú đêm* (check-in ban đêm), v.v.
  * Huy hiệu chưa mở khóa hiển thị xám kèm ổ khóa. Khi vừa check-in hoàn tất đạt điều kiện của huy hiệu, một popup Toast động chúc mừng mở khóa huy hiệu (`BadgeUnlockToast`) sẽ hiện lên trên màn hình bản đồ.

### Thành phần mã nguồn
* **Frontend**:
  * Giao diện hộ chiếu: [PassportSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/PassportSection.tsx)
  * Hiển thị bảng xếp hạng: [LeaderboardPage.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/pages/LeaderboardPage.tsx)
  * Hiển thị lưới huy hiệu trên trang cá nhân: [BadgesSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/BadgesSection.tsx)
  * Thiết kế chi tiết huy hiệu SVG độc bản: [BadgeMedal.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/BadgeMedal.tsx)
  * Toast khoe huy hiệu mới: [BadgeUnlockToast.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/BadgeUnlockToast.tsx) và [BadgeUnlockModal.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/BadgeUnlockModal.tsx)
* **Backend**:
  * Định nghĩa cấu trúc Catalog Huy hiệu & Luật (Rule Engine): [gamification/badges.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gamification/badges.go)
  * REST API Leaderboard & Badges: [gamification/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gamification/handler.go)
  * Xử lý cộng điểm XP & kiểm tra luật huy hiệu trong transactional check-in: [gamification/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gamification/repository.go)

---

## 7. Tương tác mạng xã hội: Bình luận, Cảm xúc & Theo dõi (Social Interactions)

### Trải nghiệm trên Web App
* **Bình luận (Comments)**: Tại chân trang chi tiết điểm cắm cờ (`CheckpointDetailSheet`), người dùng có thể viết bình luận, hiển thị ảnh đại diện và tên kèm thời gian bình luận thực tế. Người dùng có quyền xóa bình luận do chính mình viết.
* **Cảm xúc (Reactions)**: Hỗ trợ thả các cảm xúc phong phú lên bài cắm cờ (Thích 👍, Yêu thích ❤️, Lửa 🔥, Haha 😄, Buồn 😢) kèm hiệu ứng đếm số lượng realtime và cập nhật trạng thái đã thả cảm xúc của chính mình.
* **Theo dõi (Follow System)**: Người dùng có thể theo dõi người dùng khác từ trang cá nhân của họ. Khi theo dõi, Discover Feed sẽ mở thêm tab "Đang theo dõi" để lọc riêng các bài viết cắm cờ từ những người dùng này.

### Thành phần mã nguồn
* **Frontend**:
  * Giao diện khung bình luận: [CommentSection.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/CommentSection.tsx)
  * Cấu hình kết nối trực tiếp Firestore cho bình luận: [comments.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/comments.ts)
  * Giao diện thanh cảm xúc: [ReactionBar.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/ReactionBar.tsx)
  * Trang hồ sơ người dùng khác: [UserProfileSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/UserProfileSheet.tsx)
* **Backend**:
  * API Reactions Postgres (`POST/DELETE /checkpoints/{id}/reaction`): [reaction/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/reaction/handler.go)
  * Lưu trữ cảm xúc & Đếm tổng số: [reaction/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/reaction/repository.go)
  * API Follow & Unfollow (`/users/{username}/follow`): [identity/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/identity/handler.go)

> [!IMPORTANT]
> **Phân tách luồng dữ liệu (Firestore vs Postgres)**: Để tối ưu hóa chi phí vận hành và tốc độ phản hồi:
> 1. **Bình luận (Comments)**: Được đọc và ghi **trực tiếp từ trình duyệt đến Google Firestore** mà không đi qua API Server Go. Giải pháp này giúp tận dụng thế mạnh cơ sở dữ liệu thời gian thực (realtime) của Firestore và giảm tải CPU cho máy chủ Go.
> 2. **Cảm xúc (Reactions) & Theo dõi (Follows)**: Lưu trực tiếp tại cơ sở dữ liệu Postgres ở Backend để dễ dàng thực hiện các truy vấn gộp (joins) dữ liệu bản tin feed nhanh chóng và chính xác. Trạng thái theo dõi được cache tạm thời trong Redis 24h để tăng tốc độ phản hồi.

---

## 8. Hệ thống thông báo thời gian thực (Real-time Notifications)

### Trải nghiệm trên Web App
* Biểu tượng **Chuông thông báo** ở góc trên cùng của thanh tiêu đề hiển thị số lượng thông báo chưa đọc.
* Khi có người dùng khác thực hiện các hành động sau, một thông báo mới sẽ lập tức được gửi tới:
  * Bình luận vào điểm cắm cờ của bạn.
  * Thả cảm xúc (reaction) vào điểm cắm cờ của bạn.
  * Có người dùng mới theo dõi bạn.
  * Người bạn đang theo dõi đăng một bài viết cắm cờ mới.
* Bấm vào thông báo sẽ dẫn trực tiếp người dùng mở bài viết cắm cờ tương ứng hoặc chuyển đến trang hồ sơ của người đó. Bấm mở danh sách thông báo tự động đánh dấu tất cả là đã đọc.

### Thành phần mã nguồn
* **Frontend**:
  * Giao diện danh sách thông báo: [NotificationSheet.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/NotificationSheet.tsx)
  * Quản lý kết nối Firestore Realtime: [NotificationProvider.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/context/NotificationProvider.tsx)
  * Hàm ghi dữ liệu thông báo khi thực hiện tương tác: [notifications.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/notifications.ts)

> [!NOTE]
> Dữ liệu thông báo in-app được lắng nghe thời gian thực thông qua cơ chế `onSnapshot` kết nối trực tiếp với Firestore subcollection `users/{uid}/notifications`. Trạng thái "chưa đọc" được lưu cục bộ trong `localStorage` bằng cách so sánh thời gian thông báo mới nhất với nhãn thời gian người dùng mở xem thông báo gần nhất (`lastSeen`), giúp tối ưu hóa số lượt ghi (write requests) lên cơ sở dữ liệu.

---

## 9. Chia sẻ Thẻ & SEO Crawlers (Social Share Cards & Search Engine Optimization)

### Trải nghiệm trên Web App
* Khi xem thông tin chi tiết một Điểm cắm cờ, Hành trình hoặc Hộ chiếu cá nhân, người dùng có thể bấm nút **Chia sẻ**.
* Ứng dụng tự động sinh một tấm thiệp ảnh (Share Card) thiết kế cực kỳ bắt mắt chứa: Bản đồ nền thu nhỏ, thông tin địa điểm cắm cờ, ảnh chụp thực tế, tên tác giả, xếp hạng sao, con dấu tỉnh thành, và mã QR dẫn link. Tấm thiệp này được sinh ra dưới dạng file ảnh PNG và kích hoạt API Web Share mặc định của điện thoại để người dùng gửi qua Zalo, Facebook, Messenger, v.v.

```
+------------------------------------------+
|  [ Ảnh Check-in / Bản đồ mini ]          |
|                                          |
|  📍 Địa điểm: Cafe Hiên Cúc Trắng         |
|  ⭐ Đánh giá: 5.0 (Tuyệt vời)            |
|  👤 Tác giả: @quanluon                   |
|                                          |
|  [QR Code quét để xem]  [Con dấu Lâm Đồng]|
+------------------------------------------+
```

* Khi liên kết được chia sẻ lên các mạng xã hội, các bot Crawler (Facebook, Zalo, Telegram, Google Bot...) sẽ tự động đọc được thẻ xem trước (Open Graph preview) hiển thị hình ảnh thẻ chia sẻ và tiêu đề tùy biến tương ứng. Người dùng thực tế khi bấm vào link sẽ được đưa thẳng vào trang PWA tương ứng.

### Thành phần mã nguồn
* **Frontend**:
  * Vẽ thẻ chia sẻ bằng Canvas2D thuần: [shareCard.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/shareCard.ts)
  * Tích hợp nút share và gọi Web Share API: [share.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/share.ts)
* **Backend (SEO & OG Engine)**:
  * Nhận diện User-Agent của Crawler và phục vụ thẻ Open Graph HTML: [share/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/share/handler.go)
  * Lấy dữ liệu động để kết xuất thẻ preview: [share/service.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/share/service.go)

> [!IMPORTANT]
> **Giải quyết lỗi hiển thị ảnh trắng trên iOS Safari**: Trước đây ứng dụng sử dụng thư viện `html-to-image` để kết xuất cây DOM thành ảnh. Tuy nhiên, WebKit trên iOS chặn việc dựng thẻ `<img>` chứa ảnh CORS bên trong thẻ `<foreignObject>` của SVG dẫn đến việc ảnh check-in bị biến mất (hiển thị khung trắng). Hệ thống đã chuyển sang tự vẽ hoàn toàn bằng [shareCard.ts](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/lib/shareCard.ts) thông qua API HTML5 Canvas2D giúp khắc phục triệt để lỗi này trên mọi thiết bị iOS.

---

## 10. Tích hợp đám mây bên thứ ba (Google Drive & Google Photos Auto-Sync)

### Trải nghiệm trên Web App
* Tại phần cấu hình trang Hồ sơ cá nhân, người dùng thấy hai thẻ tích hợp: **Google Drive** và **Google Photos**.
* Người dùng thực hiện kết nối tài khoản Google một lần duy nhất qua quy trình OAuth2 tiêu chuẩn.
* Sau khi kết nối thành công, mỗi khi người dùng cắm cờ cắm mốc thành công có kèm hình ảnh, Backend sẽ tự động chạy ngầm một luồng đồng bộ:
  * **Google Drive**: Tự động tạo thư mục mang tên "Checkpoint App" trên Drive của người dùng và tải bản sao toàn bộ ảnh cắm cờ chất lượng gốc lên đó. Thông tin tọa độ, địa chỉ, ghi chú được ghi kèm vào phần mô tả (description) của file.
  * **Google Photos**: Tải trực tiếp các ảnh cắm cờ vào thư viện Google Photos cá nhân của người dùng.

### Thành phần mã nguồn
* **Frontend**:
  * Thẻ kết nối Google Drive: [DriveConnectCard.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/DriveConnectCard.tsx)
  * Thẻ kết nối Google Photos: [GooglePhotosConnectCard.tsx](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/web/src/components/GooglePhotosConnectCard.tsx)
* **Backend**:
  * Xử lý OAuth2 Callback, trao đổi & lưu trữ tokens: [gdrive/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gdrive/handler.go) và [gphotos/handler.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gphotos/handler.go)
  * Quản lý lưu trữ token của User: [gdrive/repository.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gdrive/repository.go)
  * Tải ảnh bất đồng bộ từ R2 lên Google Drive API: [gdrive/syncer.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gdrive/syncer.go)
  * Tải ảnh bất đồng bộ từ R2 lên Google Photos Library API: [gphotos/syncer.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/gphotos/syncer.go)
  * Kích hoạt tiến trình đồng bộ ngầm sau check-in: [cloudsync/cloudsync.go](file:///Users/quill/Workspace/Workspace/work-space/checkpoint/backend/internal/cloudsync/cloudsync.go)

---

## 🚀 Trạng thái Phát triển & Kế hoạch Kế tiếp
Hiện tại dự án đã hoàn thành toàn bộ cốt lõi sản phẩm (Core Features) từ Phase 1 đến Phase 5.

* **Đã hoàn tất (Done)**:
  * Hệ thống định danh người dùng (Email, Google, Guest) + nâng cấp tài khoản.
  * Bản đồ tương tác MapLibre + OpenFreeMap mượt mà, định vị PWA bền vững.
  * Form cắm cờ GPS đa năng, chụp ảnh camera tự host, trích xuất GPS từ ảnh EXIF.
  * Hàng đợi cắm cờ ngầm client-side (`CheckinQueue`) và xử lý transcode video ngầm server-side (FFmpeg + Pub/Sub).
  * Bản tin khám phá sắp xếp theo khoảng cách địa lý + ảo hóa danh sách cuộn mượt.
  * Quản lý nhiều hành trình du lịch đồng thời, vẽ tuyến đường PostGIS ST_MakeLine.
  * Hệ thống Gamification: Hộ chiếu con dấu tỉnh thành, bảng xếp hạng toàn cầu, catalog huy hiệu tự động mở khóa theo luật.
  * Tương tác mạng xã hội: Reaction Postgres, Bình luận & Thông báo Realtime qua Firestore trực tiếp.
  * Chia sẻ thẻ ảnh Canvas2D và tối ưu hóa SEO Crawler qua redirect 302 của Backend.
  * Tự động sao lưu ảnh check-in lên Google Drive & Google Photos của cá nhân.
* **Kế hoạch phát triển tiếp theo**:
  * Tích hợp push notification qua FCM (Firebase Cloud Messaging) khi đóng app.
  * Nghiên cứu tích hợp trở lại gợi ý lịch trình thông minh AI (AI Trip Planner) ở Phase 6 sau khi tinh chỉnh hạ tầng.
