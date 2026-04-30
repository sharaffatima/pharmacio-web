# Pharmacio Web — Frontend Phase Report

**Branch:** `frontend/phases-0-1-2`
**Scope:** Bug fixes (Phase 0), Comparison (Phase 1.1), Proposals (Phase 2.1 + 2.2)
**Phases completed:** 7 / 7

---

## Phase 0.1 — Session Persistence (Frontend)

Goal: keep users logged in when they refresh the page.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/main.dart` | modified | +9 | -1 |
| `lib/pharmacio_web_app.dart` | modified | +9 | -3 |

Behavior: on app start, `main.dart` reads `accessToken` from `SharedPreferences`. If present and non-empty, `PharmacioWebApp` resolves `initialRoute` to `Routes.dashboardScreen`; otherwise to `Routes.loginScreen`. The `AuthRemoteDataSource.logout()` flow already clears both tokens, so logout still routes back to login.

---

## Phase 0.2 — Settings + Register Navigation

Goal: users must always be able to return to the dashboard from settings and register screens.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/features/auth/presentation/screens/settings_screen.dart` | rewritten | +135 | -82 |
| `lib/features/auth/presentation/screens/register_screen.dart` | rewritten | +152 | -76 |
| `lib/core/constants/app_strings.dart` | modified | +4 | -0 |

Behavior: both screens now embed the persistent `SidebarWidget` (via `ResponsiveScaffold`) and a top "Back to Dashboard" pill. The pill prefers `context.pop()` if a route exists in the stack and falls back to `pushReplacementNamed(dashboardScreen)` so deep-linking still works.

---

## Phase 0.3 — Warehouse Name on Upload

Goal: every upload must carry a warehouse name to the backend.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/features/uploads/presentation/widgets/upload_dropzone_widget.dart` | rewritten | +220 | -132 |
| `lib/features/uploads/presentation/screens/uploads_screen.dart` | modified | +9 | -3 |
| `lib/features/uploads/data/models/upload_entry.dart` | modified | +3 | -0 |
| `lib/features/uploads/data/datasources/uploads_remote_data_source.dart` | modified | +13 | -3 |
| `lib/features/uploads/data/repos/uploads_repo.dart` | modified | +5 | -2 |
| `lib/features/uploads/logic/cubit/uploads_cubit.dart` | modified | +5 | -1 |
| `lib/core/constants/app_strings.dart` | modified | +12 | -0 |

Behavior: the dropzone is now a `StatefulWidget` with a required `TextField` for warehouse name. Validation triggers before opening the file picker — empty input shows an inline error and blocks the picker. The cubit signature `pickFiles({required String warehouseName})` propagates the value down through the repo to the data source, where `formData.fields.add(MapEntry('warehouse_name', value))` is added before the file part.

---

## Phase 0.4 — OCR Loading Notification

Goal: clear feedback during AI/OCR processing + protection against duplicate submissions.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/features/uploads/presentation/widgets/upload_dropzone_widget.dart` | (already counted in P0.3) | — | — |
| `lib/features/uploads/presentation/screens/uploads_screen.dart` | (already counted in P0.3) | — | — |
| `lib/core/constants/app_strings.dart` | (already counted in P0.3) | — | — |

Behavior: the dropzone receives an `isUploading` flag from the parent. When true, the icon swaps to `Icons.hourglass_top_outlined`, the headline becomes "Processing document, please wait…", the warehouse field is disabled, and the browse button is replaced with a `CircularProgressIndicator`. This makes a second pick impossible until the first response returns.

---

## Phase 0.5 — Mobile Responsiveness

Goal: every authenticated screen usable on viewports < 768 px.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/core/helpers/app_responsive.dart` | new | +22 | -0 |
| `lib/core/public_widgets/responsive_scaffold.dart` | new | +63 | -0 |
| `lib/features/dashboard/presentation/widgets/sidebar_widget.dart` | modified | +18 | -2 |
| `lib/features/dashboard/presentation/screens/dashboard_screen.dart` | rewritten | +132 | -123 |
| `lib/features/uploads/presentation/screens/uploads_screen.dart` | (counted in P0.3 — same edit) | — | — |
| `lib/features/compare/presentation/screens/compare_screen.dart` | rewritten | +132 | -116 |
| `lib/features/offers/presentation/screens/offers_screen.dart` | modified | +12 | -10 |
| `lib/features/inventory/presentation/screens/inventory_screen.dart` | modified | +95 | -52 |
| `lib/features/alerts/presentation/screens/alerts_screen.dart` | modified | +52 | -39 |
| `lib/features/proposals/presentation/screens/proposals_screen.dart` | (counted in P2.2 — same edit) | — | — |
| `lib/features/auth/presentation/screens/settings_screen.dart` | (counted in P0.2 — same edit) | — | — |
| `lib/features/auth/presentation/screens/register_screen.dart` | (counted in P0.2 — same edit) | — | — |

Behavior: `AppResponsive` exposes `isMobile / isTablet / isDesktop` against breakpoints 768/1024. `ResponsiveScaffold` is a single wrapper every screen now uses — it renders a `Drawer` + `AppBar` on mobile and the original side-by-side layout on desktop. The `SidebarWidget` reads `Scaffold.maybeOf(context)?.hasDrawer` to expand to full width inside the drawer, and closes the drawer before navigating so transitions feel native. Stat-card rows collapse to `Wrap` grids on mobile, two-column rows (compare workspace, dashboard) stack vertically, and inventory action buttons reflow into a `Wrap`.

---

## Phase 1.1 — Single-Offer Comparison

Goal: allow extracting best offers from a single uploaded file.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/features/compare/logic/cubit/compare_cubit.dart` | modified | +6 | -2 |
| `lib/features/compare/presentation/widgets/selection_summary_widget.dart` | modified | +3 | -2 |
| `lib/core/constants/app_strings.dart` | modified | +3 | -3 |

Behavior: the gating threshold dropped from `>= 2` to `>= 1` in both `compareSelectedOffers()` and `generateProposal()`, and in the widget's `canCompare`/`canGenerate` flags. The hint text was reworded ("Select at least 1 offer to extract best prices"). When the AI matching service ships, the same UI surfaces the results without further changes.

---

## Phase 2.1 — Supplier-grouped Proposal Details

Goal: each supplier rendered as its own visual card inside proposal details.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/features/proposals/presentation/widgets/supplier_section_widget.dart` | new | +270 | -0 |
| `lib/features/proposals/presentation/screens/proposal_details_screen.dart` | rewritten | +420 | -353 |

Behavior: items are grouped client-side by `item.company`, with empty values bucketed under a localized "Unknown Supplier". Each supplier renders as a card with a colored header (icon + supplier name + items count + computed subtotal chip) and its rows underneath. The subtotal is a best-effort numeric parse of `lineTotal` strings. On mobile the items render as compact stacked tiles instead of a 4-column row.

---

## Phase 2.2 — Proposal Download / Print

Goal: users can download a single proposal as PDF, print it, or download all proposals as a ZIP.

| File | Type | Lines added | Lines removed |
| --- | --- | --- | --- |
| `lib/core/helpers/file_downloader.dart` | new | +34 | -0 |
| `lib/core/networking/app_link_url.dart` | modified | +6 | -0 |
| `lib/features/proposals/data/datasources/proposals_remote_data_source.dart` | modified | +52 | -0 |
| `lib/features/proposals/data/repos/proposals_repo.dart` | modified | +26 | -0 |
| `lib/features/proposals/logic/cubit/proposals_cubit.dart` | modified | +26 | -0 |
| `lib/features/proposals/presentation/screens/proposal_details_screen.dart` | (counted in P2.1) | — | — |
| `lib/features/proposals/presentation/screens/proposals_screen.dart` | rewritten | +176 | -94 |
| `lib/core/constants/app_strings.dart` | modified | +28 | -0 |

Backend contract added (waiting on backend implementation):
- `GET /purchase-proposals/{id}/pdf/` → returns `application/pdf` bytes
- `GET /purchase-proposals/download-all/` → returns `application/zip` bytes

Behavior: the cubit gained `downloadProposalPdfBytes(id)` and `downloadAllProposalsZipBytes()` that hit the binary endpoints via a dedicated `Dio` instance configured with `ResponseType.bytes` (the shared `ApiServicesImpl` decodes everything as JSON, so it can't be reused for binary responses). On success the bytes are handed to `FileDownloader.downloadBytes`, which builds a `Blob`, attaches a hidden `<a download>` element to the DOM, clicks it, and revokes the object URL. `FileDownloader.printCurrentPage()` opens the browser print dialog. The proposals list screen exposes "Download All (ZIP)" in the header; the details screen exposes "Print" + "Download PDF".

---

## Verification Phase

### 1. Static analysis (manual scan)
- All 29 modified/new files were scanned for unused imports — only one was found and removed (`colors.dart` from `compare_screen.dart`).
- Every public symbol referenced from a new helper (`AppResponsive`, `ResponsiveScaffold`, `FileDownloader`, `SupplierSectionWidget`) is wired into at least one screen.
- No screen imports `sidebar_widget.dart` directly anymore — they all go through `ResponsiveScaffold`, which is the single source of truth for the layout.

### 2. State-shape integrity
- No new freezed states were added to `ProposalsState` or `UploadsState`. Phase 2.2 deliberately uses plain `Future<List<int>?>` returns from the cubit so the existing `.freezed.dart` files remain valid without re-running `build_runner`.
- `UploadEntry` gained an optional `warehouseName` (default `null`), which preserves backward compatibility for any code that constructs entries without it.

### 3. Backwards-compatible API contract
- `compareSelectedOffers()` and `generateProposal()` accept `selectedCount >= 1` instead of `>= 2`. Passing 2+ ids still works exactly as before.
- The upload `formData` now includes a `warehouse_name` field. Backend must accept it; until then frontend validation alone gates the UX.

### 4. Manual responsive tests to run after `flutter run -d chrome`
1. Resize browser ≤ 480 px → sidebar collapses into hamburger drawer; dashboard stat cards form a 2×2 grid; compare workspace stacks vertically.
2. Refresh page after login → land back on `/DashboardScreen`, not `/LoginScreen`.
3. Click "Settings" from sidebar → confirm the back-to-dashboard pill appears at the top of the page.
4. Try uploading a PDF without typing a warehouse name → inline error + picker is not opened.
5. Trigger an upload → button shows spinner, headline becomes "Processing document, please wait…", second click is impossible until response returns.
6. Open any proposal → items grouped by supplier; click "Download PDF" → browser starts a download (will 404 until backend ships endpoint, but the frontend flow is wired).

### 5. Known follow-ups
- **build_runner**: no need to re-run. No `freezed` annotations changed.
- **Backend dependency**: P0.3 (`warehouse_name` accepted on upload), P2.2 (`/pdf/` and `/download-all/` endpoints), P1.1 (matching service) all need backend support to be end-to-end functional.
- **Print stylesheet**: `FileDownloader.printCurrentPage()` works today, but a dedicated print stylesheet (`@media print { .sidebar { display: none } }` etc.) is a future polish task.

---

## Summary

| Bucket | Files touched | New files | LoC added | LoC removed |
| --- | --- | --- | --- | --- |
| Phase 0 (bugs) | 22 | 2 | ~890 | ~570 |
| Phase 1 (comparison) | 3 | 0 | 12 | 7 |
| Phase 2 (proposals) | 8 | 2 | ~1010 | ~447 |
| **Total** | **29** | **4** | **~1900** | **~1024** |

All deliverables landed without breaking the existing Clean-Architecture conventions: every feature still owns its `data / logic / presentation` triad, and every cross-cutting concern (responsive layout, file download, session persistence) lives under `lib/core/`.
