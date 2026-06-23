# Checkpoint Mobile (React Native) — Hướng dẫn cài đặt & chạy

## Yêu cầu hệ thống

| Công cụ | Phiên bản tối thiểu | Ghi chú |
| ------- | ------------------- | ------- |
| Node.js | >= 18 | Kiểm tra: `node -v` |
| npm | >= 8 | `npm -v` |
| Expo CLI | SDK 56 (built-in) | Dùng `npx expo` |
| iOS | Xcode 16+ | Chỉ cần nếu chạy iOS simulator |
| Android | Android Studio + SDK 35 | Chỉ cần nếu chạy Android emulator |
| Physical device | Expo Go app | Test trên máy thật không cần Xcode |

## Cài đặt

### 1. Clone & vào thư mục

```bash
cd /path/to/checkpoint/mobile-rn
```

### 2. Cài dependencies

```bash
npm install
```

> Nếu gặp lỗi peer dependency conflict, chạy:
> ```bash
> npm install --legacy-peer-deps
> ```

### 3. Cấu hình môi trường

Sao chép file `.env.example` thành `.env.local`:

```bash
cp .env.example .env.local
```

Mở `.env.local` và điền các giá trị:

```env
# Backend API — local dev server (mặc định web dùng :8080)
EXPO_PUBLIC_API_URL=http://localhost:8080

# Supabase — lấy từ Supabase Dashboard > Settings > API
EXPO_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
EXPO_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here

# Firebase — cho comments và notifications (chỉ cần nếu dùng Firestore)
EXPO_PUBLIC_FIREBASE_API_KEY=your-firebase-api-key
EXPO_PUBLIC_FIREBASE_PROJECT_ID=your-firebase-project-id
EXPO_PUBLIC_FIREBASE_APP_ID=your-firebase-app-id
```

> **Lưu ý:** Nếu đã có file `.env` ở web project (`web/`), các giá trị Supabase giống nhau.

### 4. Backend (nếu chạy local)

App cần backend Go để hoạt động. Chạy backend local:

```bash
cd backend
make run
# hoặc: go run ./cmd/server
```

Backend mặc định chạy ở `http://localhost:8080`.

---

## Chạy app

### Trên web (nhanh nhất, dùng để test)

```bash
npm run web
```

Mở trình duyệt tại `http://localhost:8081`.  
Map dùng `@maplibre/maplibre-react-native` (có thể fallback).

### Trên iOS simulator

```bash
npm run ios
```

Yêu cầu:
- macOS
- Xcode 16+ (kiểm tra: `xcodebuild -version`)
- Command Line Tools: `xcode-select --install`

Lần đầu chạy sẽ build native modules (có thể mất 2-5 phút).

### Trên Android emulator

```bash
npm run android
```

Yêu cầu:
- Android Studio với Android SDK 35
- Emulator đã tạo sẵn (AVD Manager)
- Hoặc máy Android thật với USB debugging

### Trên máy thật (Expo Go)

```bash
npm start
```

Quét QR code bằng Expo Go app (iOS App Store / Android Play Store).

---

## Environment Variables

| Variable | Required | Mặc định | Mô tả |
| -------- | -------- | -------- | ----- |
| `EXPO_PUBLIC_API_URL` | ✅ | `http://localhost:8080` | Backend API base URL |
| `EXPO_PUBLIC_SUPABASE_URL` | ✅ | — | Supabase project URL |
| `EXPO_PUBLIC_SUPABASE_ANON_KEY` | ✅ | — | Supabase anonymous key |
| `EXPO_PUBLIC_FIREBASE_API_KEY` | ❌ | — | Firebase API key (comments) |
| `EXPO_PUBLIC_FIREBASE_PROJECT_ID` | ❌ | — | Firebase project ID |
| `EXPO_PUBLIC_FIREBASE_APP_ID` | ❌ | — | Firebase app ID |

---

## Các scripts có sẵn

| Script | Lệnh | Mô tả |
| ------ | ---- | ----- |
| Start | `npm start` | Mở Expo dev server + QR |
| iOS | `npm run ios` | Build + run trên iOS simulator |
| Android | `npm run android` | Build + run trên Android emulator |
| Web | `npm run web` | Chạy trên web browser |
| Typecheck | `npm run typecheck` | Kiểm tra TypeScript (`tsc --noEmit`) |
| Lint | `npm run lint` | Kiểm tra TypeScript |

---

## Cấu trúc thư mục

```
mobile-rn/
├── app/                          # Routes (expo-router file-based)
│   ├── _layout.tsx               # Root layout với providers
│   ├── index.tsx                 # Màn hình Bản đồ (Map)
│   ├── discover.tsx              # Khám phá (feed + search)
│   ├── create.tsx                # Tạo check-in mới
│   ├── profile.tsx               # Trang cá nhân
│   ├── login.tsx                 # Đăng nhập
│   ├── leaderboard.tsx           # Bảng xếp hạng
│   ├── badges.tsx                # Bộ sưu tập huy hiệu
│   ├── ai-plan.tsx               # AI Plan (placeholder)
│   ├── privacy.tsx / terms.tsx   # Trang pháp lý
│   ├── [c]/[id].tsx             # Deep link: checkpoint detail
│   ├── [p]/[id].tsx             # Deep link: place detail
│   ├── [j]/[id].tsx             # Deep link: journey detail
│   └── [u]/[username].tsx       # Deep link: profile người khác
├── src/
│   ├── lib/                     # Thư viện dùng chung (từ web)
│   ├── services/                # Dịch vụ nền tảng
│   ├── components/ui/           # UI components
│   ├── hooks/                   # Custom hooks
│   └── theme/                   # Design tokens
├── app.json                     # Expo config
├── .env.example                 # Mẫu env variables
└── package.json
```

---

## Luồng chạy cơ bản

```
┌─────────────┐     ┌──────────────┐     ┌───────────────┐
│  mobile-rn   │ ──> │  Go Backend  │ ──> │  PostgreSQL   │
│  (Expo/RN)   │     │  :8080       │     │               │
└──────┬───────┘     └──────┬───────┘     └───────────────┘
       │                    │
       │ PUT (R2 presigned) │
       ▼                    ▼
┌─────────────┐     ┌──────────────┐
│  Cloudflare  │     │  Supabase    │
│  R2 (media)  │     │  (Auth)      │
└─────────────┘     └──────────────┘
       
       ─ ─ ─ Firestore ─ ─ ─ (comments, notifications)
```

---

## Troubleshooting

| Vấn đề | Giải pháp |
| ------ | --------- |
| `Cannot find module 'expo-router/entry'` | Chạy `npm install` lại |
| `Map not loading / blank` | Kiểm tra `EXPO_PUBLIC_API_URL` có đúng không; backend có chạy không |
| `Auth failed: Supabase not configured` | Điền `EXPO_PUBLIC_SUPABASE_URL` + `EXPO_PUBLIC_SUPABASE_ANON_KEY` |
| `Upload failed: R2 CORS` | Kiểm tra R2 bucket CORS policy có allow PUT từ origin của app không |
| `TypeScript errors` | Chạy `npm run typecheck` để xem chi tiết |
| `iOS build failed` | Mở `mobile-rn/ios/` bằng Xcode, xem log build |
| `Metro bundler stuck` | Chạy `npx expo start -c` (clear cache) |

---

## Migration Status

Xem `docs/pwa-and-react-native-migration-analysis.md` cho kế hoạch migration đầy đủ.
