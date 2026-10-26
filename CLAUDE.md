# New Look Tailor – Inventory

## Project
Offline-first cross-platform inventory app for New Look Tailor, a family
tailoring-materials shop (fabrics, linings, threads, buttons, zips,
elastic, trims, tools). Owner is non-technical: UI must be simple,
large touch targets, minimal typing.

## Tech stack
- Flutter (latest stable), Dart null-safety
- State: Riverpod (riverpod_generator, annotations)
- Local DB: Drift (SQLite) — the local DB is the single source of truth
- Navigation: go_router
- Auth: google_sign_in (scope: drive.file ONLY — never full drive scope)
- Cloud: googleapis (Drive v3) + extension_google_sign_in_as_googleapis_auth
- Background: workmanager + connectivity_plus
- IDs: uuid (v4) for every row
- Reports: pdf + printing; charts: fl_chart

## Architecture
Clean architecture, feature-first:
lib/
  core/        (theme, router, constants, utils, errors)
  data/        (drift database, tables, daos)
  features/<feature>/{data,domain,presentation}
  services/    (sync, google auth, drive)
Repository pattern: UI → providers → repositories → DAOs.

## Data rules
- Every table has: id (UUID text PK), createdAt, updatedAt, isDeleted
  (soft delete), isSynced.
- Quantities are REAL (decimals) — fabric is sold in metres.
- Stock changes ONLY through stock_transactions, inside a DB transaction
  that also updates items.currentStock.
- Never hard-delete synced data.
- Currency is INR (₹).

## Conventions
- App must work fully offline; login is optional (only for backup/sync).
- Write unit tests for repositories and stock logic.
- Run `dart format .` and `flutter analyze` before finishing a task;
  fix all warnings.
- Run build_runner after changing Drift tables or Riverpod providers:
  `dart run build_runner build --delete-conflicting-outputs`
- Small, focused commits with clear messages.
- Do not change the package ID com.newlooktailor.new_look_tailor.

## Decisions (Phase 1)
- Dart SDK constraint: ^3.9.0.
- Drift via drift_flutter (driftDatabase helper). Web needs
  DriftWebOptions(sqlite3Wasm, driftWorker) + the two assets in web/.
- riverpod_lint 3.x uses the native analysis_server_plugin, registered
  under `plugins:` in analysis_options.yaml. Do NOT add custom_lint.
- google_sign_in 7.x: new API (GoogleSignIn.instance.initialize() /
  authenticate(); scopes via authorizationClient). Still drive.file only.
- Colors: navy #0D1B3E primary (white text). Gold #C9A227 is accent
  ONLY (2.42:1 on white) — never text or button backgrounds.
  goldDeep #8A6D10 for gold text on light, goldSoft #E5C65C on dark.
- Router: StatefulShellRoute.indexedStack, 5 tabs
  (/, /items, /stock, /reports, /settings).
- Android minSdk: <write flutter.minSdkVersion or 23, whichever you used>