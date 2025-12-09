# Project CI/CD Status

**Status:** Basic CI pipeline and helper scripts have been added to the repository.

**Implemented (current repo):**
- **CI workflow**: `.github/workflows/ci.yml` — analyze → test → build (build runs on `main`).
- **Coverage check script**: `scripts/check_coverage.sh` — enforces 70% lines coverage (uses `lcov`).
- **Version bump script**: `scripts/increment_version.sh` — increments build number in `pubspec.yaml`.
- **Environment config**: `lib/config/app_config.dart`, `lib/config/environment.dart` — use `--dart-define`.
- **Analysis guidance**: `analysis_options.yaml` exists; consider switching to the stricter variant included below.

## Quick local checks (PowerShell)
```powershell
dart format --output=none --set-exit-if-changed .
flutter analyze --fatal-infos
flutter test --coverage
bash .\scripts\check_coverage.sh
```

## CI summary
- `analyze` job: formats and runs `flutter analyze`.
- `test` job: runs `flutter test --coverage`, uploads `coverage/lcov.info`, and runs `scripts/check_coverage.sh`.
- `build` job: runs on `main`, builds a release APK and uploads artifact.

## Next recommended steps
- Add/extend tests to reach 70% coverage.
- Enable GitHub branch protection requiring the `analyze` and `test` checks.
- (Optional) Add Codecov/coveralls integration and badges.
- (Optional) Replace `analysis_options.yaml` with `analysis_options_strict.yaml` (created alongside) if you want the stricter rules enforced.

