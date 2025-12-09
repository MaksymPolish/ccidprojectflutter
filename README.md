# Flutter CI/CD Project

![CI Status](https://github.com/MaksymPolish/ccidprojectflutter/actions/workflows/ci.yml/badge.svg)
![License](https://img.shields.io/badge/license-MIT-blue)

A production-ready Flutter application with complete CI/CD pipeline, automated testing, and code quality gates.

## ✨ Features Implemented

### 🔄 CI/CD Pipeline
- ✅ **GitHub Actions Workflow** (`.github/workflows/ci.yml`)
  - `analyze` job: Code formatting & linting with strict rules
  - `test` job: Unit & widget tests with coverage reporting
  - `build` job: Android APK builds for `main` branch
- ✅ **Dependency Caching** for faster CI runs
- ✅ **Coverage Enforcement** (minimum 70% lines)
- ✅ **Automated Artifact Upload** (APK builds)

### 📊 Code Quality
- ✅ **Strict Analysis Rules** (`analysis_options.yaml`)
  - Enforced linter rules (prefer_single_quotes, prefer_const_constructors, etc.)
  - Strict language modes (strict-casts, strict-inference, strict-raw-types)
  - Custom error handling (invalid_annotation_target, missing_return, etc.)
- ✅ **Automated Code Formatting** with `dart format`
- ✅ **Coverage Threshold Enforcement** (70%+)

### 🌍 Multi-Environment Configuration
- ✅ **Dev, Staging, Production Environments** using `--dart-define`
- ✅ **Environment-Specific API URLs**
- ✅ **Simple Configuration** through Dart constants (`lib/config/app_config.dart`)

### 🧪 Testing
- ✅ **Unit Tests** for business logic
- ✅ **Widget Tests** for UI interactions
- ✅ **Coverage Reporting** with `lcov`

### 🛠️ Development Tools
- ✅ **Version Bump Script** (`scripts/increment_version.sh`)
- ✅ **Coverage Check Script** (Bash & PowerShell)
- ✅ **PR Template** with submission checklist

---

## 🚀 Quick Start

### Prerequisites
- Flutter 3.x+
- Dart 3.x+
- Git

### Installation
```bash
flutter pub get
```

### Running Locally

**Development build:**
```bash
flutter run --dart-define=BUILD_ENV=dev --dart-define=API_URL=https://api-dev.example.com
```

**Production build:**
```bash
flutter run --dart-define=BUILD_ENV=prod --dart-define=API_URL=https://api.example.com
```

### Local Quality Checks

**Format code:**
```powershell
dart format .
```

**Analyze code:**
```powershell
flutter analyze --fatal-infos
```

**Run tests with coverage:**
```powershell
flutter test --coverage
```

**Check coverage threshold (70%):**

*Windows (PowerShell):*
```powershell
.\scripts\check_coverage.ps1
```

*macOS/Linux:*
```bash
bash scripts/check_coverage.sh
```

---

## 📁 Project Structure

```
flutter_application_ccid/
├── .github/
│   ├── workflows/
│   │   └── ci.yml                    # Main CI/CD workflow
│   └── pull_request_template.md      # PR submission template
├── lib/
│   ├── config/
│   │   ├── app_config.dart           # Environment configuration
│   │   └── environment.dart          # Simple environment helper
│   ├── main.dart                     # Main app entry point
│   ├── main_dev.dart                 # Dev environment entry point
│   ├── main_staging.dart             # Staging environment entry point
│   └── main_prod.dart                # Production environment entry point
├── test/
│   ├── widget_test.dart              # Widget tests
│   ├── app_config_test.dart          # Config tests
│   ├── environment_test.dart         # Environment tests
│   └── unit_tests.dart               # Unit tests
├── scripts/
│   ├── check_coverage.sh             # Coverage check (Bash)
│   ├── check_coverage.ps1            # Coverage check (PowerShell)
│   └── increment_version.sh          # Version bump script
├── analysis_options.yaml             # Dart analyzer configuration
├── pubspec.yaml                      # Dependencies
└── README.md                         # This file
```

---

## 🔐 CI/CD Pipeline Details

### Workflow Triggers
- **Pushes** to `main` and `develop` branches
- **Pull Requests** to `main` and `develop` branches

### Job Sequence
```
analyze (format + lint) 
    ↓
test (coverage >= 70%) 
    ↓
build (APK only on main)
```

### Build Artifacts
- **APK Release Build** (uploaded for `main` branch)
- **Coverage Report** (uploaded after test job)

### Coverage Enforcement
- **Minimum Threshold:** 70% lines coverage
- **Tool:** `lcov`
- **Check Script:** `scripts/check_coverage.sh` (CI) or `scripts/check_coverage.ps1` (local)

---

## 🌍 Environment Management

### Using `--dart-define`

Define environment variables when running the app:

```powershell
# Development
flutter run `
  --dart-define=BUILD_ENV=dev `
  --dart-define=API_URL=https://api-dev.example.com

# Production
flutter run `
  --dart-define=BUILD_ENV=prod `
  --dart-define=API_URL=https://api.example.com
```

### Accessing in Code

```dart
import 'package:flutter_application_ccid/config/app_config.dart';

// Check current environment
if (AppConfig.isProduction) {
  // Production logic
}

// Get API URL
final apiUrl = AppConfig.apiBaseUrl;

// Get app name
final appName = AppConfig.appName; // "LB1 Dev", "LB1 Staging", or "LB1"
```

---

## 📊 Code Quality Metrics

| Metric | Requirement | Status |
|--------|-------------|--------|
| Code Coverage | >= 70% | ✅ |
| Linter Warnings | 0 | ✅ |
| Analyzer Errors | 0 | ✅ |
| Code Formatting | Enforced | ✅ |

---

## 🔗 Links

- **Repository:** [MaksymPolish/ccidprojectflutter](https://github.com/MaksymPolish/ccidprojectflutter)
- **CI/CD Actions:** [GitHub Actions](https://github.com/MaksymPolish/ccidprojectflutter/actions)
- **Flutter Docs:** [flutter.dev](https://flutter.dev)
- **Dart Lints:** [dart.dev/lints](https://dart.dev/lints)

---

## 📝 Contributing

Please follow the **Submission Checklist** in the PR template before submitting changes:

1. Pass all local quality checks
2. Ensure tests cover new functionality
3. Maintain >= 70% code coverage
4. Follow conventional commit messages

See [PULL_REQUEST_TEMPLATE](.github/pull_request_template.md) for full checklist.

---

## 📄 License

This project is open source and available under the MIT License.

---

## ❓ Troubleshooting

### Tests fail locally but pass in CI
- Ensure Flutter SDK is up-to-date: `flutter upgrade`
- Clear cache: `flutter clean` and `flutter pub get`
- Run tests again: `flutter test`

### Coverage below 70%
- Review coverage report: Look at `coverage/lcov.info` or HTML report
- Add tests for uncovered code paths
- Focus on critical business logic first

### CI workflow fails
- Check GitHub Actions logs for specific error messages
- Ensure `analysis_options.yaml` is properly formatted (YAML syntax)
- Verify all scripts have correct shebang: `#!/bin/bash`

---

**Happy coding! 🎉**

