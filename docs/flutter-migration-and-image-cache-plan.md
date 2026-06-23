# React Web to Flutter Native Migration Plan

Updated: 2026-06-21 after a full `web/src` scan.

## Goal

Migrate the current React/Vite web app to a Flutter native iOS/Android app while keeping the current backend contracts, database shape, media storage, Firestore document shape, and public deep-link semantics stable.

The React PWA should keep running during the migration. Flutter should be built in parallel and cut over only after feature parity is proven.

## Scan Coverage

This plan is based on the current `web/` implementation, with detailed reads of:

- App entry and routing: `web/src/App.tsx`, `web/src/main.tsx`, `web/src/components/AppLayout.tsx`.
- Backend client and models: `web/src/lib/api.ts`.
- Auth/session: `web/src/contexts/AuthContext.tsx`, `web/src/lib/supabase.ts`, `web/src/lib/guestSession.ts`.
- Location/check-in: `web/src/contexts/LocationContext.tsx`, `web/src/hooks/useCheckin.tsx`, `web/src/contexts/CheckinQueue.tsx`, `web/src/lib/geo.ts`.
- Map and detail sheets: `web/src/pages/MapPage.tsx`, checkpoint/place/journey detail components.
- Media pipeline: `web/src/components/CreateCheckpointForm.tsx`, `web/src/components/PhotoCheckinTab.tsx`, `web/src/components/CameraCaptureSheet.tsx`, `web/src/lib/image.ts`, `web/src/lib/video.ts`, `web/src/lib/exif.ts`, `web/src/lib/avatarComposite.ts`.
- Social/profile: profile pages/components, comments, notifications, followers/following sections.
- Static art and UI primitives: `checkpointImages.ts`, `avatarFrames.ts`, `icons/registry.tsx`, locale files, Tailwind theme/CSS.
- Config/deploy: `web/package.json`, `web/vite.config.ts`, `web/README.md`.

Generated/build/vendor directories such as `web/dist`, `web/node_modules`, and cache folders are not migration sources of truth.

## Locked Decisions

- Build Flutter as a separate app beside `web/`; do not replace the React app in-place.
- Do not change backend API contracts for v1 unless a native OAuth callback forces a tiny compatibility endpoint.
- Keep Supabase Auth for identity session behavior.
- Keep backend-issued bearer token exchange flow.
- Keep R2 direct-upload slot flow for checkpoint media and avatars.
- Keep Firestore comments/notifications document shapes initially.
- Keep public deep links for checkpoint, place, journey, and user profiles.
- No new backend pagination is required for followers/following v1; mirror current no-paging behavior.
- UI parity rule: when cloning a Flutter screen, use the matching React PWA page/component as the visual source of truth first; preserve its layout, controls, card hierarchy, spacing, empty/loading/error affordances, pagination, and virtual/infinite-scroll behavior before adding native-only refinements.

## Target Flutter Stack

Recommended packages:

- App/state: `flutter_riverpod`, `go_router`, `freezed`, `json_serializable`.
- HTTP/auth: `dio`, `supabase_flutter`, `flutter_secure_storage`.
- Local data: `hive` or `isar` for small caches and queue state.
- Map/location: MapLibre-compatible Flutter package, `geolocator`, `permission_handler`.
- Media: `image_picker`, `camera`, `photo_manager` where needed, `flutter_image_compress`, native HEIC/GPS metadata support, video metadata/thumbnail helpers.
- Firebase: `cloud_firestore`.
- UI/media: `cached_network_image`, SVG support for generated assets where unavoidable.
- i18n: Flutter ARB or generated localization classes seeded from `web/src/lib/locales/*.json`.

Suggested folder shape:

```text
flutter_app/
  lib/
    app/
      app.dart
      router.dart
      theme.dart
      localization/
    core/
      api/
      auth/
      cache/
      env/
      errors/
      location/
      media/
      storage/
    features/
      auth/
      map/
      checkpoints/
      places/
      discover/
      profile/
      journeys/
      comments/
      notifications/
      badges/
      leaderboard/
      integrations/
    shared/
      widgets/
      models/
      assets/
```

## Current Web Route Map

Anonymous routes:

- `/` map home.
- `/discover`.
- `/leaderboard`.
- `/c/:id` checkpoint detail.
- `/p/:id` place detail.
- `/j/:id` journey detail.
- `/u/:username` public profile.
- Legal/privacy pages.
- Login and auth callback surfaces.

Authenticated-only routes:

- `/create`.
- `/ai-plan`.
- `/profile`.
- `/badges`.
- Same public deep-link surfaces plus signed-in actions.

Flutter mapping:

- Use `go_router` with one shell route for the app chrome.
- Keep anonymous and authenticated route guards equivalent to `App.tsx`.
- Use platform deep links/app links for `/c/:id`, `/p/:id`, `/j/:id`, `/u/:username`.
- Preserve public read access for anonymous deep links.
- Preserve signed-in-only create/profile/badges/integration actions.

## Runtime Providers And Local State

Web source:

- `AuthProvider`: Supabase session, backend token exchange, guest suppression flags, Google linking.
- `LocationProvider`: ambient location request, one-time auto ask, mandatory location for check-in.
- `CheckinQueueProvider`: local retry queue for create checkpoint.
- `NotificationProvider`: Firestore notification subscription plus derived following-feed checkpoint notifications.
- `UserProfileProvider`: global public profile sheet opener.
- TanStack Query: server state, invalidation, optimistic-ish UI refresh.

Flutter replacement:

- `authControllerProvider`: Supabase session plus backend bearer token.
- `locationControllerProvider`: ambient and mandatory location states.
- `checkinQueueProvider`: persisted queue with retry/backoff and repository invalidation events.
- `notificationProvider`: Firestore subscription and derived feed polling.
- `profileSheetControllerProvider`: shared user-profile modal navigation.
- Repository providers for REST resources; keep cache TTL explicit per repository instead of copying React Query defaults blindly.

Local storage keys to preserve or migrate conceptually:

- Guest/session flags: `cp_has_real_account`, `cp_guest_logged_out`.
- Geo flags/cache: `cp.geo.located`, `cp.geo.autoAskDismissed`, `geocode_cache_*`.
- Settings: `cp.settings.openCreateOnLaunch`, `cp.settings.preferCameraOnCheckin`.
- Check-in queue: `cp_checkin_queue`.
- Notification last seen: `cp.notif.lastSeen.{userId}`.
- Camera preferences/device IDs from camera capture UI.

## Backend API Mapping

Keep request/response JSON compatible with `web/src/lib/api.ts`.

Auth and user:

- `exchange(provider, accessToken)` -> backend token.
- `loginWithPassword(identifier, password)`.
- `getMe()`.
- `getUserProfile(ref)`.
- `getUsersByIDs(ids)`.
- `getUserFollowers(ref)`.
- `getUserFollowingList(ref)`.
- `updateProfile(input)`.
- `isUsernameAvailable(username)`.
- `uploadAvatar(file)`.
- `logout()`.

Passport, badges, leaderboard:

- `getPassport()`.
- `getUserPassport(userId)`.
- `getLeaderboard()`.
- `getBadges()`.

Checkpoints and media:

- `getCheckpointsInBounds(bounds, options)`.
- `createCheckpoint(input)`.
- `getCheckpointDetail(id)`.
- `getMyCheckpoints()`.
- `getMyCheckpointPage(page, limit)`.
- `getMyUnassignedCheckpoints()`.
- `getUserCheckpoints(ref)`.
- `updateCheckpoint(id, input)`.
- `deleteCheckpoint(id)`.
- `getUploadSlots(itemsOrCount)`.
- Direct `PUT` to returned upload URLs.

Places and discover:

- `getFeed(params)`.
- `getFeedFollowing(params)`.
- `searchPlaces(query, coords)`.
- `getPopularPlaces(coords)`.
- `getPlace(id)`.
- `getNearbyPlaces(lat, lng, radius)`.
- `getNearbyAppPlaces(lat, lng, radius)`.

Follow/social:

- `getFollowing()` returns id-only list and must remain separate from profile list endpoints.
- `followUser(ref)`.
- `unfollowUser(ref)`.
- `getUserFollowers(ref)` returns public user cards.
- `getUserFollowingList(ref)` returns public user cards.

Reactions/views:

- `viewCheckpoint(id)`.
- `getReactions(checkpointId)`.
- `setReaction(checkpointId, reactionType)`.
- `clearReaction(checkpointId)`.

Journeys:

- `getMyJourneys()`.
- `getJourney(id)`.
- `createJourney(input)`.
- `updateJourney(id, input)`.
- `deleteJourney(id)`.
- `assignCheckpointsToJourney(journeyId, checkpointIds)`.

Integrations:

- `initGoogleDrive()`.
- `getGoogleDriveStatus()`.
- `disconnectGoogleDrive()`.
- `initGooglePhotos()`.
- `getGooglePhotosStatus()`.
- `disconnectGooglePhotos()`.

Model caveat:

- The current TypeScript `Place` interface contains duplicate `checkin_count` declaration. Do not duplicate it in Dart; JSON behavior is unchanged.

## Firestore Mapping

Comments:

- Collection shape: `checkpoints/{checkpointId}/comments/{commentId}`.
- Fields include author id, text, timestamps, and metadata used by the web comment UI.
- Author display data is resolved through backend `getUsersByIDs`, not stored as trusted canonical profile data.
- Pagination page size is currently 20.
- Add/delete comments write directly to Firestore.

Notifications:

- Collection shape: `users/{userId}/notifications/{notifId}`.
- Types include `comment`, `follow`, `unfollow`, `reaction`, and `checkpoint`.
- Last-seen state is local per user.
- Existing web also derives checkpoint notifications from following feed. Flutter should keep this separate from feed cache and avoid corrupting feed pagination state.

Security caveat:

- Current web writes directly to Firestore without Firebase Auth as the primary app auth source. Flutter v1 should mirror current behavior only if current Firestore rules allow it. A security redesign is out of scope for this migration plan and should be scheduled separately.

## Media And Asset Pipeline

Checkpoint images:

- Web compresses original image to max edge 2560, JPEG quality 0.9, max around 3 MiB.
- Web creates thumbnail at 640x360.
- HEIC conversion is handled client-side on web.
- Flutter must preserve the original+thumbnail upload item shape expected by backend upload slots.

Checkpoint videos:

- Web allows one video, max 10 seconds and 60 MiB input.
- Web generates a JPEG thumbnail.
- Web uploads raw video; backend worker transcodes/generates final playable media.
- Flutter should avoid client-side transcoding unless backend behavior changes.

Photo check-in:

- Extract GPS and `taken_at` from EXIF where available.
- Filter invalid/null-island GPS.
- Preserve fallback to manual/current location when EXIF is missing.

Camera capture:

- Web has in-app camera for PWA/touch devices with front/back selection, zoom, mirroring, and stored preferences.
- Flutter should use native camera APIs and preserve front/back, zoom, and preview/capture orientation behavior.

Avatar/frame composition:

- Web bakes avatar + frame into a PNG through canvas.
- Flutter can compose with `CustomPainter` or server-provided assets, then upload the baked avatar image using the existing avatar endpoint.
- Preserve frame geometry and locked/unlocked frame behavior.

Static checkpoint art:

- `web/src/lib/checkpointImages.ts` currently points to `https://media.checkpoint-app.space`.
- `web/vite.config.ts` Workbox runtime cache still references the old Supabase public storage origin.
- Before Flutter cache implementation, decide whether the CDN domain is the only current static-art source and update web Workbox separately if needed. Do not copy stale Workbox origin into Flutter.

Icons:

- `icons/registry.tsx` contains many React icon aliases and custom SVG-like components.
- Flutter should map stable icon IDs to either packaged SVG assets, Material/Cupertino icons, or generated vector drawables.
- Keep checkpoint category icon IDs stable so backend/content data does not change.

## Feature Migration Matrix

| Area | Web source | Flutter target | Notes |
| --- | --- | --- | --- |
| Auth | Supabase + backend exchange | Supabase Flutter + Dio auth interceptor | Preserve guest suppression and account upgrade behavior. |
| Shell/navigation | React Router + AppLayout | `go_router` shell | Preserve anonymous/auth route split and deep links. |
| Map | MapLibre + react-map-gl + supercluster | MapLibre Flutter + clustering | Fetch backend on debounced bbox changes. Swap markers only after bbox fetch succeeds. |
| Location | Browser geolocation | `geolocator` + platform permissions | Keep ambient vs mandatory request distinction. |
| Check-in form | React sheet/form | Flutter modal/page flow | Place first, journey optional, media optional. |
| Uploads | Backend slots + direct PUT | Same slots + direct PUT | Preserve thumbnail/original media item shape. |
| Photo check-in | EXIF extraction | Native metadata extraction | Preserve GPS/taken_at handling. |
| Camera | PWA camera | Native camera | Better native UX, same stored preferences concept. |
| Discover/feed | REST + infinite queries | Repository pagination | Keep feed/following-feed separate. |
| Profile | Shared hero card + profile sheet | Shared profile header/profile modal | Include followers/following modal lists. |
| Followers/following | REST profile-list endpoints | Same endpoints | No paging/search/follow buttons in v1 list. |
| Comments | Direct Firestore | Direct Firestore | Keep author hydration through backend. |
| Notifications | Firestore + derived feed | Same split | Keep local last-seen state. |
| Journeys | REST | REST | Include assignment and delete flows. |
| Badges/leaderboard | REST + static frames | REST + packaged/CDN assets | Preserve frame unlock visuals. |
| Integrations | Google Drive/Photos OAuth | External browser + deep link callback | May need native callback verification. |
| i18n | i18next JSON | Flutter localization | Seed from `vi.json` and `en.json`. |
| PWA helpers | install/standalone/safe-area | Native platform behavior | Do not migrate PWA-only install mechanics. |

## Phase Plan

### Backend Impact Summary

| Phase | Main goal | Backend work |
| --- | --- | --- |
| 0 | Freeze contracts and decide native constraints | Verify only |
| 1 | Flutter project scaffold | None |
| 2 | Auth/session parity | Possible small change for native OAuth/deep-link callback |
| 3 | API repositories and DTOs | Verify only |
| 4 | Shell, theme, i18n, assets | Possible static-art cache/config cleanup |
| 5 | Map, location, deep links | Verify only |
| 6 | Check-in, media, upload queue | Verify only; possible upload-slot metadata compatibility if native media differs |
| 7 | Discover, places, social | None expected |
| 8 | Profile, journeys, gamification, integrations | Possible integration OAuth callback changes |
| 9 | QA, release, cutover | Possible CORS/app-link/config updates |

Backend labels:

- `None`: no backend code should be needed.
- `Verify only`: Flutter should use existing backend contracts, but this phase should test the contract with native inputs.
- `Possible`: do not start with backend changes, but reserve time because native platform behavior may expose a real contract gap.

### Phase 0 - Contract Freeze

Goal: make the current web app the source of truth before Flutter work starts.

Flutter work:

- Create a route/API/local-state/media parity checklist from the current `web/` app.
- Generate or hand-write Dart DTOs for every active request/response type in `web/src/lib/api.ts`.
- Decide Flutter app directory, bundle IDs, environments, deep-link domains, and release tracks.
- Decide whether Flutter will package static art, load it from CDN, or use a hybrid cache.

Backend work: verify only.

- Confirm all needed endpoints already exist for anonymous and authenticated mobile use.
- Confirm mobile clients may call the same API host and auth exchange flow as web.
- Confirm current public deep-link refs are stable: checkpoint id, place id, journey id, username/user id.
- Confirm static art source of truth because `checkpointImages.ts` uses `media.checkpoint-app.space` while Workbox still references the old Supabase storage origin.

Exit criteria:

- DTO list covers every exported API helper used by pages/components.
- Backend gap list is either empty or explicitly assigned to later phases.
- Deep-link mapping is documented before app routing starts.

### Phase 1 - Flutter Scaffold

Goal: create a runnable native app shell without product behavior.

Flutter work:

- Create Flutter app in a sibling directory, for example `mobile/` or `flutter_app/`.
- Add Riverpod, router, Dio, Supabase, secure storage, Firestore, map, location, camera/media, and image-cache dependencies.
- Add environment loading for API base URL, Supabase URL/key, Firebase config, and map style URL.
- Add theme tokens matching the current clay/surface/border visual system.
- Convert `vi.json` and `en.json` into Flutter localization inputs.
- Add CI commands for `flutter analyze`, unit tests, and build smoke checks.

Backend work: none.

Exit criteria:

- App launches on iOS simulator and Android emulator.
- Anonymous shell, signed-out shell, and placeholder navigation work.
- CI can run Flutter analyze/tests.

Implementation status on 2026-06-21:

- Added `mobile/` source scaffold with `pubspec.yaml`, app entry, router, theme tokens, env placeholders, localization seed, smoke test, and README.
- Added `.github/workflows/mobile.yml` with `flutter pub get`, `flutter analyze`, and `flutter test`.
- Flutter CLI was not installed in the local shell, so generated `ios/` and `android/` folders still need to be created with `flutter create --platforms=ios,android --project-name checkpoint_mobile .` from `mobile/`.

### Phase 2 - Auth And Session

Goal: match web auth behavior before building authenticated features.

Flutter work:

- Implement Supabase session restore.
- Implement backend token exchange and secure token storage.
- Implement password login, Google login, anonymous/guest behavior, account upgrade, logout.
- Port `getMe()` refresh behavior.
- Add Dio interceptor for bearer token, refresh, logout, and auth errors.
- Preserve guest suppression semantics from `cp_has_real_account` and `cp_guest_logged_out`.

Backend work: possible small change.

- Verify Supabase native Google login returns a token accepted by existing backend exchange.
- Verify backend logout works for native sessions.
- Verify anonymous upgrade/link flow works from native Supabase.
- Add or adjust backend OAuth/deep-link callback only if native provider flow cannot reuse the existing web flow.

Exit criteria:

- Cold start restores a valid user session.
- Guest logout does not accidentally restore anonymous account.
- Password, Google, anonymous, upgrade, and logout flows pass on real devices.

Implementation status on 2026-06-21:

- Added secure backend token storage for `cp_access_token` and `cp_refresh_token`.
- Added guest session flags matching web: `cp_has_real_account` and `cp_guest_logged_out`.
- Added backend auth API client for exchange, password login, refresh, `getMe`, and logout.
- Added Riverpod auth controller for restore, Supabase exchange, email/password login, identifier login, signup, Google OAuth, anonymous login, account upgrade, and logout.
- Added minimal login screen wired to anonymous and Google actions.
- Native OAuth callback still needs real-device verification with `MOBILE_REDIRECT_URL`.
- Verification: `flutter analyze` and `flutter test` pass from `mobile/`.

### Phase 3 - API Repositories And Cache

Goal: create typed Flutter access to the current backend without feature UI.

Flutter work:

- Implement repositories for auth/user, checkpoints, places/feed, reactions, journeys, passport/badges, integrations.
- Add typed error handling equivalent to web API errors.
- Add explicit cache policies:
  - Short-lived cache for stable profile/passport/badge data.
  - No frontend bbox cache for map marker fetches.
  - Separate cache keys for following feed, discover feed, and notification-derived feed.
- Add persisted small local state for settings, queue, last seen, and geocode cache.
- Add DTO decode tests using recorded JSON examples from the current API.

Backend work: verify only.

- Verify all API responses decode cleanly into Dart models, especially nullable fields.
- Verify backend error response shapes are stable enough for mobile error UI.
- Verify current unauthenticated endpoints behave correctly without web cookies/session assumptions.

Exit criteria:

- Repository tests cover critical DTOs and error decoding.
- Authenticated and anonymous API calls work from Flutter against dev/staging backend.

Implementation status on 2026-06-21:

- Added shared `BackendApiClient` with bearer token attachment and one-shot refresh-on-401 using `/auth/refresh`.
- Added typed DTOs for users, public user summaries, passport, leaderboard, badges, checkpoints, upload slots, places, feed pages, reactions, journeys, and integrations.
- Added repositories for users, gamification, checkpoints, discover feeds, follow state, reactions, places, journeys, and Google Drive/Photos integrations.
- Added local JSON store foundation for persisted small app state.
- Added DTO decode tests covering user nullable fields, checkpoint detail, feed page, and journey detail.
- Updated analyzer excludes so generated `build/` and CocoaPods/SwiftPM dependency sources are not analyzed as app source.
- Verification: `flutter analyze` and `flutter test` pass from `mobile/`.

### Phase 4 - Shell, Theme, Assets, I18n

Goal: make the app feel like the current product before wiring heavy flows.

Flutter work:

- Port app shell, bottom navigation, top navigation equivalents, and safe-area behavior.
- Port shared user avatar, badge/frame, icon, sheet/modal, empty/loading/error states.
- Package or remote-load static checkpoint art consistently.
- Port key screens with placeholder data where repositories are not ready.
- Port locale fallback and visible copy for Vietnamese and English.

Backend work: possible config cleanup.

- No API code should be needed.
- If static art is still cached from the old Supabase origin, update web/static config separately so Flutter and web share one asset source.
- Confirm CDN cache headers for static art and avatar/frame assets.

Exit criteria:

- Main shell visually matches current web surfaces closely enough for product review.
- Locale switching/fallback works.
- Static images and frame assets load reliably on device.

Implementation status on 2026-06-21:

- Added shared brand, placeholder, empty-state, loading-row, and user-avatar widgets.
- Updated the app shell with Checkpoint brand header, auth-aware login/profile action, bottom navigation, and shared placeholder bodies.
- Added placeholder routes for AI Plan, privacy, and terms alongside existing public deep-link routes.
- Added static checkpoint asset helpers for `https://media.checkpoint-app.space`, level tier icons, and avatar frame URLs.
- Added avatar frame catalog helpers matching web frame ids, level frames, badge frames, and unlock checks.
- Expanded Vietnamese/English string coverage and interpolation support in `AppStrings`.
- Continued visual parity pass:
  - Added web-like card shadows, warm surface/background tokens, outlined button styling, and active nav pill styling.
  - Replaced generic shell placeholders with tab-specific preview surfaces for map, discover feed, create check-in, leaderboard, and profile.
  - Added shared stat tile and Checkpoint card primitives for profile/feed/list reuse.
  - Split shell tab state into a dedicated enum so router and previews can share it cleanly.
- Verification: `flutter analyze` and `flutter test` pass from `mobile/`.

### Phase 5 - Map, Location, And Detail Surfaces

Goal: port the core exploration loop.

Flutter work:

- Implement MapLibre map with user location marker and checkpoint markers.
- Debounce bbox/location changes before fetching backend.
- Keep previous rendered markers visible until the next bbox fetch succeeds.
- Port checkpoint, place, journey, and public profile deep-link detail surfaces.
- Port current server-side map filters: category and all/mine/following.
- Port permission-denied and approximate-location states.

Backend work: verify only.

- Verify `/checkpoints?bbox=...&limit=300` handles native map bbox frequency and precision.
- Verify public detail endpoints work from cold-start deep links without signed-in state.
- Verify no CORS/web-only assumption exists in map/detail APIs.

Exit criteria:

- Moving the map always fetches backend after debounce.
- Markers do not disappear while a request is pending.
- Deep links open the correct detail surface from cold start.

Implementation status on 2026-06-21:

- Added location controller with permission request, current-position lookup, and Ho Chi Minh City fallback.
- Added PWA-style mobile map screen:
  - Uses `MapLibreMap` when `MAP_STYLE_URL` is configured.
  - Falls back to a web-like mock map surface for tests/unconfigured environments.
  - Includes top filter pills, floating location/create buttons, marker previews, and bottom check-in card.
- Wired the Map tab to the real map screen while keeping other PWA-style tabs ready for data wiring.
- Added PWA-style deep-link detail shell for checkpoint, place, journey, and public profile routes.
- Added API-first checkpoint fetch for the map tab using `/checkpoints?bbox=...&limit=300`; unconfigured environments still show the PWA-style mock map while avoiding network calls.
- Kept the current rendered map surface visible while the checkpoint fetch is loading; the bottom card updates after data arrives or shows a compact error state.
- Verification: `flutter analyze` and `flutter test` pass from `mobile/`.

### Phase 6 - Check-In And Media

Goal: port checkpoint creation and media upload end to end.

Flutter work:

- Port create checkpoint form:
  - Nearby app places within the current radius.
  - Google place suggestions.
  - Reverse-geocode fallback.
  - Journey picker.
  - Image/video picker.
- Port image compression, thumbnail generation, HEIC handling, EXIF GPS/taken_at extraction.
- Port direct upload slots and queue retry.
- Port native camera flow and preferences.
- Preserve original+thumbnail upload item shape.

Backend work: verify only, possible compatibility fix.

- Verify upload slot requests accept native-generated filenames, MIME types, dimensions, durations, and thumbnail metadata.
- Verify direct R2 `PUT` works from native networking libraries.
- Verify backend worker accepts raw native video files and existing thumbnail shape.
- Add a small backend compatibility adjustment only if native media metadata cannot match current web shape.

Exit criteria:

- Create checkpoint works online.
- Offline/transient failure creates a queued item and retries.
- Image, HEIC, video, camera capture, and EXIF photo check-in pass on real devices.

Implementation status on 2026-06-22:

- Replaced the placeholder Create tab with a PWA-style check-in flow:
  - GPS/photo segmented tabs.
  - Location loading/permission state.
  - Nearby existing-place picker within roughly 50m using `/places/nearby`.
  - Place suggestions using `/places/suggest` when creating a new place.
  - Place name/category, rating, active journey picker, notes, and image picker UI.
- Wired real online create flow:
  - Requests upload slots from `/checkpoints/upload-slots`.
  - Resizes/compresses picked images to JPEG before upload: original max edge 2560 at quality 90, thumbnail max edge 640 at quality 82.
  - Uploads prepared original and thumbnail bytes to their separate R2 presigned URLs.
  - Calls `POST /checkpoints` with uploaded media keys, selected place/journey, rating, note, and current coordinates.
- Added native camera capture through `image_picker`, sharing the same resize/compress/upload path as gallery images.
- Matched the PWA `From photo` tab structure more closely: it now shows a photo-pick prompt before the form and limits that path to one image.
- Remaining Phase 6 work:
  - HEIC handling, video picker/thumbnail/transcode flow, EXIF GPS/taken_at photo check-in.
  - Check-in queue persistence/retry and native camera preference/auto-open flow.

### Phase 7 - Discover, Places, Social

Goal: port the social browsing loop.

Flutter work:

- Port discover feed and following feed pagination.
- Port place search/popular/nearby pages.
- Port reactions, views, comments, and notifications.
- Port follow/unfollow and following id-only state.
- Port profile followers/following modal lists using public user summary endpoints.

Backend work: none expected.

- Use existing profile-list endpoints for followers/following.
- Keep existing `/users/following` id-only endpoint separate for follow state/feed cache.

Exit criteria:

- Existing follow/unfollow behavior and following feed still work.
- Profile followers/following lists render avatar, display name, and username.
- Comments and notifications update in real time or near real time as on web.

Implementation status on 2026-06-21:

- Replaced the static Discover tab preview with an API-backed `DiscoverScreen` that calls the existing discover feed repository when `API_BASE_URL` is configured.
- Kept PWA-style feed cards, filter chips, image fallback, loading rows, empty state, pull-to-refresh, and checkpoint detail navigation.
- Backend work remains none expected; current implementation uses the existing `/discover/feed` contract.

### Phase 8 - Profile, Gamification, Journeys, Integrations

Goal: finish account, progression, journey, and integration parity.

Flutter work:

- Port own profile and public profile hero sections.
- Port avatar upload, avatar frame composition, badges, leaderboard, passport.
- Port journeys create/update/delete/assignment flows.
- Port Google Drive and Google Photos integration status/init/disconnect flows.
- Port share-card or native share equivalents.

Backend work: possible integration callback change.

- Verify avatar upload endpoint accepts native multipart payloads.
- Verify frame/avatar composition output does not require a web-only canvas detail.
- Verify Drive/Photos OAuth init/status/disconnect can complete from a native external browser flow.
- Add native callback/deep-link support only if current integration callback is web-only.

Exit criteria:

- Own profile and public profile match current web feature behavior.
- Journeys and avatar/frame flows work on real devices.
- OAuth integrations either work through native deep links or are explicitly deferred with product approval.

Implementation status on 2026-06-21:

- Replaced static Leaderboard/Profile tab previews with API-backed screens:
  - Leaderboard calls `/leaderboard` through `GamificationRepository` and renders a PWA-style podium plus ranked rows.
  - Profile uses the live auth state, renders the PWA-style hero/stats/progress card, and fetches `/me/passport` plus `/me/badges` when signed in.
- Kept logged-out and missing-env states explicit so local tests do not call the backend.
- Journeys, integrations, avatar upload/frame composition, and public profile detail parity remain for later Phase 8 work.

### Phase 9 - Parity QA And Cutover

Goal: prove release readiness without breaking the React web app.

Flutter work:

- Run route-by-route parity QA against React web.
- Run media upload QA on real iOS and Android devices.
- Run auth/session QA across cold start, reinstall, logout, account upgrade, and token expiry.
- Run map/location QA across permission denied, approximate location, and location changes.
- Run Firestore comments/notifications QA with multiple accounts.
- Prepare store assets, release notes, privacy strings, permission descriptions, and crash/logging setup.

Backend work: possible deploy/config updates.

- Confirm API allowlists, CORS-like upload constraints, R2 upload headers, app links, and OAuth redirect URLs for native release.
- Monitor backend logs for mobile-specific validation failures during beta.
- Do not remove or degrade React web/PWA behavior during native rollout.

Exit criteria:

- Critical user journeys pass on iOS and Android.
- Known gaps are documented and accepted.
- Store release/cutover plan is approved.

## Test Plan

Automated:

- Dart model decode/encode tests for all backend DTOs.
- Repository tests with mocked Dio responses.
- Auth controller tests for restore, exchange, logout, and guest suppression.
- Check-in queue tests for persistence, retry, and invalidation events.
- Media helper tests for validation limits and generated upload item shapes.
- Firestore repository tests with emulator where practical.
- Golden/widget tests for profile hero, follow list modal, checkpoint card, empty/loading/error states.

Manual device matrix:

- iOS simulator and at least one real iPhone.
- Android emulator and at least one real Android device.
- Fresh install, upgrade install, logged-in restore, logged-out restore.
- Location allowed, denied, approximate, changed while map is open.
- Image upload, HEIC upload, video upload, EXIF photo check-in, camera capture.
- Anonymous deep links and signed-in actions.
- Followers/following empty and non-empty profiles.
- Firestore comments and notifications across two accounts.

## Current Risk Register

- Static-art cache mismatch: web `checkpointImages.ts` uses `media.checkpoint-app.space`, but Workbox still references the old Supabase storage origin.
- Native OAuth callback: Drive/Photos may require platform deep-link callback handling; verify backend callback assumptions early.
- Firestore auth/rules: direct Firestore writes should be reviewed before native release.
- Media parity: HEIC, EXIF, camera orientation, video thumbnail, and upload-size limits need real-device testing.
- Map parity: Flutter MapLibre plugin behavior, clustering, attribution, style loading, and tile caching need early spike.
- Queue correctness: create checkpoint retry must not duplicate successful server records.
- Notification split: derived following-feed notifications must not share cache state with the actual feed.
- Profile follow lists: no paging is acceptable for v1, but large accounts may require pagination later.

## Non-Goals For V1

- Backend API redesign.
- Database schema migration.
- New social graph pagination.
- New Firestore schema.
- Offline-first full app behavior.
- Replacing React web/PWA before native parity is verified.
- Rebuilding static art hosting as part of the Flutter migration.
