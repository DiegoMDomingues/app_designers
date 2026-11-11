# Changelog

### Unreleased

## 1.0.3 - 02-10-2026

### New

- iOS build support (minimum deployment target 15.0).
- New recording widgets for Oxistar, Bodystar and microphone (with wave preview).
- Android release signing via `key.properties` (falls back to debug signing when missing).

### Changed

- Migrated to the new baselib (`biologix_base_lib` v0.0.126).
- Updated iOS dependencies, Gradle wrapper and Android build files.

### Fixed

- References to `appexamlib` in Android build files.
- Automatic `flutterfire_cli` activation in the Firebase Crashlytics build script.

## 1.0.2 - 28-11-2025

### New

- Added Alert to warn user to not turn off the screen during recording.

### Fixed

- Translation of baselib.
- Recording reset stopwatch and status during reconnecting.

## 1.0.1 - 28-11-2025

### Fixed

- Permission and state connection of devices bluetooth.

## 1.0.0 - 27-11-2025

### New

- Launch app.
