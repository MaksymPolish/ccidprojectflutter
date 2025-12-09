## 📋 Submission Checklist

Before submitting this PR, ensure all requirements are met:

### Code Quality
- [ ] Code passes `dart format --output=none --set-exit-if-changed .`
- [ ] Code passes `flutter analyze --fatal-infos`
- [ ] All tests pass: `flutter test`
- [ ] Code coverage >= 70%: `./scripts/check_coverage.ps1` (Windows) or `bash scripts/check_coverage.sh` (Linux/Mac)

### Git & CI/CD
- [ ] Commit messages follow conventional commits (feat:, fix:, test:, etc.)
- [ ] GitHub Actions CI workflow passes (analyze, test, build jobs)
- [ ] All CI checks are green (no failed jobs)

### Documentation
- [ ] README.md is updated if changes affect user-facing features
- [ ] Code comments explain non-obvious logic
- [ ] Environment setup is documented (if new dependencies added)

### Testing
- [ ] New code includes corresponding tests
- [ ] Tests focus on critical paths and edge cases
- [ ] Widget tests cover UI interactions

### Environment Configuration
- [ ] Environment config uses `--dart-define` approach
- [ ] Tested with both `dev` and `prod` environments
- [ ] API URLs and secrets are not hardcoded in code

---

## 🔍 Type of Change

- [ ] 🐛 Bug fix
- [ ] ✨ New feature
- [ ] 🎨 UI/Style improvement
- [ ] 📝 Documentation update
- [ ] 🔧 Configuration/tooling
- [ ] ✅ Test improvements
- [ ] 🚀 CI/CD improvement

## 📝 Description

<!-- Briefly describe the changes in this PR -->

## 🧪 Testing Evidence

<!-- Describe how you tested this change -->

## 📸 Screenshots (if applicable)

<!-- Add screenshots of UI changes -->

---

**Note:** PRs that don't pass CI checks will not be merged. Ensure all tests pass locally before pushing!
