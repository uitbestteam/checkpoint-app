# React Web to Flutter Native Migration Plan

> Goal: migrate the current React/Vite `web/` app to a Flutter native
> iOS/Android app without changing backend APIs, database schema, auth exchange,
> or public deep-link semantics. React PWA stays live until Flutter reaches
> feature parity.

## Decisions Locked

| Area | Decision |
|---|---|
| Target | Flutter native iOS/Android first. Flutter Web is out of scope for v1. |
| Strategy | Build a parallel Flutter app beside `web/`; do not remove React PWA during migration. |
| Backend/API | No backend endpoint, response shape, DB schema, Firestore shape, or auth exchange changes. |
| State | Riverpod. |
| HTTP | Dio with a single backend API client and refresh-token interceptor. |
| Token storage | `flutter_secure_storage` for backend access/refresh tokens and Supabase session support. |
| Local persistence | Hive for small app settings, pending check-in queue, notification last-seen, selected avatar frame. |
| Map | MapLibre/OpenFreeMap, preserving current `MAP_STYLE`. |
| Firebase | Mirror current direct Firestore comments/notifications. No Firebase Auth. |
| Media | `cached_network_image`, `flutter_cache_manager`, `flutter_svg`; keep Supabase static art and R2 media separate. |

## Current Web Inventory

### Routes

| State | React route | Current behavior | Flutter route target |
|---|---|---|---|
| Anonymous | `/discover` | Public discover feed/share surface. | `DiscoverScreen(publicMode: true)` |
| Anonymous | `/c/:id` | Opens checkpoint detail sheet, close -> map/discover fallback. | `CheckpointDeepLinkScreen` |
| Anonymous | `/j/:id` | Opens journey detail sheet. | `JourneyDeepLinkScreen` |
| Anonymous | `/u/:username` | Opens public user profile sheet. | `UserProfileDeepLinkScreen` |
| Anonymous | `/login` | Login/signup/anonymous auth. | `LoginScreen` |
| Anonymous | `*` | Redirects to `/discover`. | Router redirect to `/discover`. |
| Authenticated | `/` | Map page with checkpoint clusters and check-in action. | `MapScreen` |
| Authenticated | `/discover` | Discover feed, following tab, search/places. | `DiscoverScreen` |
| Authenticated | `/create` | GPS/photo check-in entry. | `CreateScreen` |
| Authenticated | `/ai-plan` | Current AI plan placeholder/static page. | `AiPlanScreen` as-is. |
| Authenticated | `/profile` | Profile, passport, badges, journeys, integrations, settings. | `ProfileScreen` |
| Authenticated | `/leaderboard` | Global leaderboard. | `LeaderboardScreen` |
| Authenticated | `/badges` | Badge collection/progress. | `BadgeCollectionScreen` |
| Authenticated | `/c/:id` | Checkpoint detail deep link. | `CheckpointDeepLinkScreen` |
| Authenticated | `/j/:id` | Journey detail deep link. | `JourneyDeepLinkScreen` |
| Authenticated | `/u/:username` | Public user profile deep link. | `UserProfileDeepLinkScreen` |
| Authenticated | `*` | Redirects to `/`. | Router redirect to `/`. |

### Providers and Runtime Services

| Web source | Current responsibility | Flutter equivalent |
|---|---|---|
| `AuthContext` | Restore session, Supabase auth, backend token exchange, refresh fallback, logout. | `authSessionProvider`, `AuthRepository`, `BackendTokenStore`. |
| `LocationProvider`, `geo.ts` | User location, permission memory, auto-ask behavior, HCMC fallback. | `locationProvider`, native permission/service wrapper. |
| `CheckinQueue` | Persist pending backend check-in creates, retry 3 attempts, invalidate query caches, XP/badge toasts. | `checkinQueueProvider`, Hive queue, Riverpod invalidations/events. |
| `NotificationProvider` | Live Firestore notifications, derived following-feed notifications, unread last-seen. | `notificationStreamProvider`, `NotificationRepository`, Hive last-seen. |
| React Query | API query cache, infinite feed, invalidation after mutations. | Riverpod async providers/repositories with explicit invalidation. |
| `PWAUpdatePrompt`, `InstallHint` | PWA-only update/install UX. | Not ported; replace with native release/update flow outside app code. |

### External Services

| Service | Current web usage | Flutter rule |
|---|---|---|
| Supabase Auth | Login/signup/anonymous/Google, session token for backend `/auth/exchange`. | Use `supabase_flutter` for auth/session only. |
| Backend REST API | All product data/mutations in `web/src/lib/api.ts`. | Keep exact endpoints and JSON fields. |
| Cloudflare R2 | Public media URLs and presigned PUT upload slots. | Keep direct PUT flow; do not proxy through backend. |
| Firestore | Comments and in-app notifications. | Mirror current collections and fields directly. |
| Photon | Client reverse geocode by lat/lng. | Keep direct Photon call unless backend later changes API, which is out of scope. |
| OpenFreeMap/MapLibre | Map style and rendering. | Keep MapLibre style URL. |

### Media Inventory

| Group | Current owner | Current URLs | Flutter cache behavior |
|---|---|---|---|
| Badge art | Supabase Storage | `checkpointImageUrl("badges/...")` | Long-lived static SVG cache. |
| Avatar frames | Supabase Storage | `checkpointImageUrl("frames/...")` | Long-lived static SVG cache. |
| Level medallions | Supabase Storage | `checkpointImageUrl("levels/...")` | Long-lived static SVG cache. |
| App pin/icons | Web public assets | `/pin.svg`, `/icon-192.png`, `/icon-512.png` | Bundle as Flutter assets. |
| User avatars | R2 public base | `avatar_url` | Disk cache by URL; avatar replacement must produce/use new URL/key. |
| Checkpoint thumbnails | R2 public base | `thumbnail_url` | Prefer in lists, map markers, grids. |
| Checkpoint full photos | R2 public base | `image_url`, detail `images[].url` | Use only in detail viewer/share flows; cache with tighter byte cap. |

### Native-Sensitive Features To Preserve

- Camera capture with front/back camera choice, mirror correction, Android `ImageCapture` behavior where applicable.
- Gallery picker and photo check-in from EXIF GPS.
- HEIC/HEIF conversion and JPEG resize pipeline.
- Avatar crop, frame selection, and frame baking into final uploaded avatar.
- Share cards with generated image, QR code, native share fallback.
- Deep links `/c/:id`, `/j/:id`, `/u/:username`.
- Local settings: quick create on launch, prefer camera on check-in, install hint dismissed, location prompt memory, selected avatar frame.
- Pending check-in queue persistence and retry.
- Firestore comment/notification live streams.

## Target Flutter Architecture

### Folder Layout

```text
flutter_app/
  lib/
    app/
      app.dart
      router.dart
      shell.dart
      theme.dart
    core/
      env.dart
      api_client.dart
      api_error.dart
      auth_session.dart
      secure_token_store.dart
      local_store.dart
      media_cache_service.dart
      result.dart
    features/
      auth/
      map/
      location/
      checkin/
      checkpoint_detail/
      discover/
      places/
      profile/
      badges/
      journeys/
      leaderboard/
      comments/
      notifications/
      integrations/
      share/
      ai_plan/
```

### Provider Groups

| Provider | Responsibility |
|---|---|
| `apiClientProvider` | Dio base URL, auth headers, 401 refresh, retry handoff. |
| `authSessionProvider` | Current user, session restore, login/logout/signup/anonymous/Google/linking. |
| `locationProvider` | Current coords, permission state, HCMC fallback, silent locate. |
| `checkinQueueProvider` | Pending creates, retry policy, XP/badge events. |
| `notificationStreamProvider` | Firestore stored notifications + derived following-feed notifications. |
| Feature repository providers | One repository per feature group, wrapping the frozen REST/Firestore contracts. |

### Internal Interface Rules

- Dart models must mirror `web/src/lib/api.ts` JSON fields exactly.
- Keep snake_case JSON keys where backend returns snake_case.
- Repositories may expose Dart-style method names, but wire format stays unchanged.
- No new backend fields for Flutter convenience.
- No backend migration for Flutter v1.

## Frozen Backend API Mapping

Each exported TS API function must have a Dart repository method. Endpoint and
payload shape stay unchanged.

| Web function | Endpoint / operation | Dart repository |
|---|---|---|
| `exchange` | `POST /auth/exchange` | `AuthRepository.exchangeSupabaseToken` |
| `getMe` | `GET /users/me` | `UserRepository.getMe` |
| `getUserByUsername` | `GET /users/{username}` | `UserRepository.getByUsername` |
| `updateProfile` | `PATCH /users/me` | `UserRepository.updateProfile` |
| `uploadAvatar` | `POST /users/me/avatar` multipart `avatar` | `UserRepository.uploadAvatar` |
| `logout` | `POST /auth/logout` best-effort | `AuthRepository.logoutBackend` |
| `getPassport` | `GET /me/passport` | `GamificationRepository.getPassport` |
| `getLeaderboard` | `GET /leaderboard` | `GamificationRepository.getLeaderboard` |
| `getBadges` | `GET /me/badges` | `GamificationRepository.getBadges` |
| `getCheckpointsInBounds` | `GET /checkpoints?bbox=&limit=300` | `CheckpointRepository.listInBounds` |
| `createCheckpoint` | `POST /checkpoints` | `CheckpointRepository.create` |
| `getCheckpointDetail` | `GET /checkpoints/{id}` | `CheckpointRepository.getDetail` |
| `getMyCheckpoints` | `GET /checkpoints/me?limit=` | `CheckpointRepository.listMine` |
| `getUserCheckpoints` | `GET /checkpoints/by-user?user_id=&limit=` | `CheckpointRepository.listByUser` |
| `deleteCheckpoint` | `DELETE /checkpoints/{id}` | `CheckpointRepository.delete` |
| `getUploadSlots` | `POST /checkpoints/upload-slots` | `CheckpointRepository.getUploadSlots` |
| `putFilesToSlots` | Presigned R2 `PUT` x original + thumbnail | `R2UploadRepository.putFilesToSlots` |
| `getFeed` | `GET /discover/feed?lat=&lng=&limit=15&cursor=` | `DiscoverRepository.getFeed` |
| `getFeedFollowing` | `GET /discover/feed/following?...` | `DiscoverRepository.getFollowingFeed` |
| `getFollowing` | `GET /users/following` | `FollowRepository.getFollowing` |
| `followUser` | `POST /users/{username}/follow` | `FollowRepository.follow` |
| `unfollowUser` | `DELETE /users/{username}/follow` | `FollowRepository.unfollow` |
| `viewCheckpoint` | `POST /checkpoints/{id}/view` fire-and-forget | `CheckpointRepository.recordView` |
| `getReactions` | `GET /checkpoints/{id}/reactions` | `ReactionRepository.getSummary` |
| `setReaction` | `POST /checkpoints/{id}/reaction` | `ReactionRepository.set` |
| `clearReaction` | `DELETE /checkpoints/{id}/reaction` | `ReactionRepository.clear` |
| `searchPlaces` | `GET /places/search?q=&lat=&lng=` | `PlaceRepository.search` |
| `getPopularPlaces` | `GET /places/popular?limit=10&lat=&lng=` | `PlaceRepository.getPopular` |
| `getPlace` | `GET /places/{id}` | `PlaceRepository.getDetail` |
| `getNearbyPlaces` | `GET /places/suggest?lat=&lng=` | `PlaceRepository.getNearbySuggestions` |
| `getMyJourneys` | `GET /journeys/me` | `JourneyRepository.listMine` |
| `getJourney` | `GET /journeys/{id}` | `JourneyRepository.getDetail` |
| `createJourney` | `POST /journeys` | `JourneyRepository.create` |
| `updateJourney` | `PATCH /journeys/{id}` | `JourneyRepository.update` |
| `initDriveConnect` | `POST /integrations/drive/init` | `IntegrationRepository.initDriveConnect` |
| `getDriveStatus` | `GET /integrations/drive/status` | `IntegrationRepository.getDriveStatus` |
| `disconnectDrive` | `DELETE /integrations/drive/disconnect` | `IntegrationRepository.disconnectDrive` |
| `initPhotosConnect` | `POST /integrations/photos/init` | `IntegrationRepository.initPhotosConnect` |
| `getPhotosStatus` | `GET /integrations/photos/status` | `IntegrationRepository.getPhotosStatus` |
| `disconnectPhotos` | `DELETE /integrations/photos/disconnect` | `IntegrationRepository.disconnectPhotos` |

## Firestore Contract Mapping

Keep the current Firestore collection shapes.

| Web source | Shape to preserve | Flutter repository |
|---|---|---|
| `comments.ts` | `checkpoints/{checkpointId}/comments/{commentId}` with author fields, text, timestamps. | `CommentRepository` |
| `notifications.ts` | `users/{userId}/notifications/{notifId}` with `type`, actor fields, checkpoint metadata, reaction, `created_at`. | `NotificationRepository` |
| `NotificationProvider` | Derived checkpoint notifications from following feed, not stored. | `NotificationAggregator` |
| `lastSeen` localStorage | Per-user notification last-seen timestamp. | Hive key `cp.notif.lastSeen.{userId}` |

## Feature Migration Matrix

| Web surface | Flutter target | Must preserve |
|---|---|---|
| `LoginPage`, `AuthContext`, `supabase.ts` | `features/auth` | Email/password, Google OAuth/linking, anonymous login, `/auth/exchange`, refresh fallback, OAuth error messages. |
| `AppLayout`, `BottomNav`, `PublicShareLayout` | `app/router`, `app/shell` | Auth/anonymous route split, bottom nav, public share shell, unknown-route redirects. |
| `MapPage`, `useCheckin`, `LocationProvider` | `features/map`, `features/location` | MapLibre style, bbox fetch, clustering, following/mine filters, GPS centering, permission fallback. |
| `CreatePage`, `CreateCheckpointForm`, `PhotoCheckinTab`, `CameraCaptureSheet` | `features/checkin` | GPS/photo modes, camera/gallery, EXIF GPS, image resize, R2 upload slots, check-in queue. |
| `DiscoverPage`, `PlaceDetailSheet` | `features/discover`, `features/places` | For-you/following feeds, infinite pagination, pull refresh, search, place detail, follow actions. |
| `CheckpointDetailSheet` | `features/checkpoint_detail` | Images, author profile, view count, owner-only delete, share, comments, reactions. |
| `ProfilePage`, `EditProfileSheet`, `AvatarCropSheet`, `AvatarFramePicker` | `features/profile` | Profile stats, passport, moments, settings, integrations, avatar edit, frame selection, avatar baking. |
| `BadgeCollectionPage`, `BadgeMedal`, unlock modal/toast | `features/badges` | Badge catalog, locked/unlocked state, Supabase badge art, progress cards, unlock celebration. |
| `LeaderboardPage` | `features/leaderboard` | Rank list, top styles, current user highlight. |
| `JourneyDetailSheet`, `JourneysSection` | `features/journeys` | Journey list/detail, active journey choice, stops map/list, share card. |
| `CommentSection`, `comments.ts` | `features/comments` | Firestore pagination, add/delete comments, comment count, comment notifications. |
| `NotificationProvider`, `NotificationSheet`, `notifications.ts` | `features/notifications` | Firestore live notifications, derived following-feed notifications, toast, last-seen unread count. |
| `ReactionBar` | `features/reactions` | Counts, current user's reaction, set/switch/clear, reaction notifications. |
| `DriveConnectCard`, `GooglePhotosConnectCard` | `features/integrations` | Existing OAuth redirect URLs/status/disconnect through backend. |
| `share.ts`, `shareCard.ts`, `ShareButton` | `features/share` | Generated image share cards, QR code, native share fallback. |
| `PassportSection`, `BadgesSection`, `JourneysSection` | Profile subfeatures | Reuse same backend queries and preview/see-all navigation behavior. |
| `LocationPermissionSheet`, `LocationPermissionContent` | `features/location` | Explainer UX before OS permission, unsupported/insecure states adapted to native. |
| `InstallHint`, `PWAUpdatePrompt`, `lazyWithRetry` | Not ported | PWA-only. Document as intentionally omitted from Flutter native. |
| `AIPlanPage` | `features/ai_plan` | Port as current static/placeholder screen unless product spec changes later. |

## Phase Plan

### Phase 0 - Contract Freeze

Work:
- Copy the API mapping above into the Flutter implementation checklist.
- Define Dart models for every exported interface in `web/src/lib/api.ts`.
- Mark backend REST, Firestore shapes, deep links, and R2 upload flow as frozen.

Acceptance:
- Each exported TS API function has a Dart repository method.
- No backend endpoint or response shape is marked for change.
- Unknowns are only Flutter-internal implementation tasks.

### Phase 1 - Flutter Scaffold

Work:
- Create Flutter app beside `web/`, for example `flutter_app/`.
- Add env loading for backend URL, Supabase URL/anon key, Firebase config, OpenFreeMap style URL.
- Add Riverpod, Dio, router, theme, `flutter_secure_storage`, Hive, image cache packages.
- Build unauthenticated shell with placeholder route targets.

Acceptance:
- App launches on iOS simulator and Android emulator.
- Router can navigate to every current route path.
- No backend calls are required for scaffold smoke test.

### Phase 2 - Auth

Work:
- Implement Supabase Flutter auth for email/password, signup, anonymous, Google, and linking anonymous -> Google.
- Exchange Supabase session access token with backend `/auth/exchange`.
- Store backend access/refresh tokens securely.
- Implement Dio auth interceptor with single-flight 401 refresh matching React behavior.
- Implement logout as backend best-effort logout then Supabase sign out.

Acceptance:
- Email login/signup works.
- Anonymous login works.
- Google login works.
- Anonymous account linking keeps backend user data.
- App restart restores session.
- Expired backend access token refreshes once and retries.

### Phase 3 - API and Cache Foundation

Work:
- Implement Dart repositories for all REST endpoints in the frozen mapping.
- Add typed API errors preserving retry semantics: 4xx non-retryable, 5xx/network retryable for check-in queue.
- Implement `MediaCacheService`:
  - Supabase static SVG cache: long TTL, at least 100 entries.
  - R2 thumbnail cache: medium/high TTL.
  - R2 full photo cache: capped by total bytes.
  - Avatar cache keyed by URL.
- Bundle local app pin/icons as Flutter assets.

Acceptance:
- Read-only profile, badges, passport, leaderboard, and journey list load real backend data.
- Supabase badge/frame/level art renders through cache.
- API methods produce same JSON payloads as React for equivalent calls.

### Phase 4 - Shell and Read Surfaces

Work:
- Implement authenticated bottom-nav shell.
- Implement anonymous public shell.
- Add route guards and unknown-route redirects matching React.
- Implement read-only screens for map, discover, create placeholder, profile, leaderboard, badges, deep links.

Acceptance:
- Every current React route opens a Flutter screen.
- Anonymous/authenticated route split matches React.
- `AIPlanPage` is present as an equivalent placeholder/static screen.

### Phase 5 - Map and Checkpoint Detail

Work:
- Implement MapLibre/OpenFreeMap map with HCMC default view.
- Fetch checkpoints by expanded bbox.
- Cluster checkpoints client-side.
- Render thumbnail markers and cluster thumbnail previews.
- Implement checkpoint detail bottom sheet with images, author profile open, view count fire-and-forget, owner delete, reactions, comments, share.

Acceptance:
- Map centers on user location when available.
- Bbox fetch and marker filtering match React.
- `/c/:id` opens detail from cold start and warm app state.
- Owner delete invalidates local/read providers and removes item from map/feed/profile views.

### Phase 6 - Check-in Creation

Work:
- Implement GPS check-in flow with native permission explainer.
- Implement photo check-in from gallery with EXIF GPS extraction.
- Implement camera capture with front/back selection and remembered preference.
- Convert HEIC/HEIF where possible.
- Resize original under current 3 MB target and generate 640px thumbnail.
- Request `/checkpoints/upload-slots`, PUT original + thumbnail directly to R2, enqueue backend `POST /checkpoints`.
- Persist pending queue in Hive with current 3 attempts and delays `[0, 2000, 5000]`.
- Emit XP and badge unlock UI events after successful create.

Acceptance:
- GPS check-in creates the same backend payload shape as React.
- Photo check-in rejects no-GPS photos with equivalent user-facing error.
- R2 upload failure does not create checkpoint.
- Backend create retry behavior matches React.
- App kill/reopen resumes pending backend create jobs.

### Phase 7 - Social and Discovery

Work:
- Implement Discover for-you/following infinite feeds with pull refresh.
- Implement place search/detail and place-based check-in entry.
- Implement follow/unfollow and user profile sheet.
- Implement Firestore comments pagination/add/delete.
- Implement reactions set/switch/clear.
- Write Firestore comment/follow/reaction notifications directly like React.

Acceptance:
- Feed pagination and following tab work with current backend.
- User profile deep link `/u/:username` opens correctly.
- Comments and reactions update UI and create notifications.
- Firestore notification stream shows new comment/follow/reaction events.

### Phase 8 - Profile and Gamification

Work:
- Implement profile passport card, XP/level progress, check-in streak, moments grid.
- Implement passport stamps, badge preview, full badge collection, leaderboard preview.
- Implement edit profile name/bio.
- Implement avatar upload with crop and optional frame.
- Implement avatar frame picker using level and badge unlock rules from current data.
- Implement avatar frame baking into PNG before upload.
- Implement quick-check-in settings currently stored in localStorage.

Acceptance:
- Profile parity with current `ProfilePage`.
- Avatar with frame displays as uploaded image across app.
- Badge locked/unlocked behavior matches React.
- Settings persist across app restart.

### Phase 9 - Integrations, Share, and Polish

Work:
- Implement Drive and Google Photos status/connect/disconnect cards through existing backend endpoints.
- Handle OAuth redirect return into Flutter app where platform supports it; otherwise open browser and return via deep link.
- Implement checkpoint, journey, and profile share cards with QR code and native share sheet.
- Add native permission messaging for camera, location, and photo library.
- Add empty/loading/error states matching current design intent.

Acceptance:
- Drive/Photos connect/status/disconnect behavior matches React.
- Share card output includes image, QR, and deep link.
- Permission denial paths are recoverable.

### Phase 10 - Cutover Readiness

Work:
- Run route-by-route parity QA against React PWA.
- Compare API payloads and rendered data for the same users/checkpoints.
- Monitor Supabase/R2 egress and app error logs.
- Keep React PWA deployed until Flutter production metrics are stable.

Acceptance:
- All test scenarios below pass.
- No API/schema changes were introduced.
- React `web/` removal is explicitly deferred to a separate cleanup project.

## Test Plan

### Route Parity

- Anonymous `/discover`, `/c/:id`, `/j/:id`, `/u/:username`, `/login`.
- Authenticated `/`, `/discover`, `/create`, `/ai-plan`, `/profile`, `/leaderboard`, `/badges`, `/c/:id`, `/j/:id`, `/u/:username`.
- Unknown route redirects match React for anonymous and authenticated states.

### Auth

- Anonymous login.
- Email signup and login.
- Google login.
- Anonymous -> Google linking.
- Logout.
- App restart session restore.
- 401 refresh retry.
- Refresh failure logs out locally.

### Map

- Location permission allowed, denied, and unavailable.
- Initial HCMC fallback.
- Bbox fetch after map movement.
- Cluster display and marker thumbnails.
- Following/mine/all filters.
- Checkpoint detail opens from marker and deep link.

### Check-in

- GPS check-in.
- Photo EXIF check-in.
- No-GPS photo error.
- Camera capture.
- Gallery image.
- HEIC image.
- R2 upload failure.
- Backend create 5xx retry.
- Backend create 4xx no retry.
- App restart with pending queue.

### Media

- Supabase SVG static art cached.
- Badge art renders.
- Avatar frames render.
- Level medallions render.
- R2 thumbnails used in map/feed/profile grids.
- Full R2 images used in detail/photo viewer/share only.
- Avatar replacement does not show stale cached avatar.

### Profile and Gamification

- Edit display name/bio.
- Upload avatar.
- Crop avatar.
- Apply frame.
- Passport stamps.
- Badge collection locked/unlocked.
- Badge unlock modal/toast.
- Leaderboard top/current user highlight.
- Journey preview/detail.

### Social

- Follow/unfollow.
- Reaction set/switch/clear.
- Comments fetch next page.
- Add comment.
- Delete own comment.
- Comment notification.
- Follow/unfollow notification.
- Reaction notification.
- Derived following-feed checkpoint notification.
- Unread count and mark-all-seen.

### Deep Links and Share

- `/c/:id` cold start and warm start.
- `/j/:id` cold start and warm start.
- `/u/:username` cold start and warm start.
- Checkpoint share card.
- Journey share card.
- Profile share card.
- Native share cancellation does not show error.

### Integrations

- Drive status.
- Drive connect init.
- Drive disconnect.
- Google Photos status.
- Google Photos connect init.
- Google Photos disconnect.

## Assumptions and Non-Goals

- Flutter Web is out of scope.
- React PWA remains production until Flutter parity is proven.
- `AIPlanPage` is ported as-is.
- Push notifications are not added in this migration.
- Firestore security/model hardening is not part of this migration.
- Backend API, database schema, R2 object key strategy, and Firestore shapes remain unchanged.
- Native UI may use Flutter idioms, but behavior and data contracts must match React.
