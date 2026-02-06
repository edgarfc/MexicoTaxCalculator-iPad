# Contributing to Mexico Tax Calculator

Thank you for your interest in contributing! This guide will help you make changes and keep the project well-documented.

## 📋 Before You Start

1. Read the [README.md](../README.md) to understand the project
2. Check [CHANGELOG.md](../CHANGELOG.md) to see recent changes
3. Review [CHANGELOG_TEMPLATE.md](CHANGELOG_TEMPLATE.md) for documentation guidelines

## 🔄 Development Workflow

### Making Changes

1. **Create a new branch** (optional but recommended):
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your code changes**
   - Follow Swift style guide
   - Keep changes focused and atomic
   - Test on both iPhone and iPad simulators

3. **Update CHANGELOG.md** (REQUIRED):
   - Open `CHANGELOG.md`
   - Add your changes under the `[Unreleased]` section
   - Use the template from `.github/CHANGELOG_TEMPLATE.md`
   - Include:
     - What changed
     - Why it changed
     - Files modified
     - User impact

4. **Test your changes**:
   ```bash
   # Run tests
   xcodebuild test -project MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad.xcodeproj \
     -scheme MexicoTaxCalculatorAppiPad -destination 'platform=iOS Simulator,name=iPad Pro (12.9-inch)'
   ```

5. **Commit with descriptive message**:
   ```bash
   git add .
   git commit -m "Brief description of changes

   - Detailed point 1
   - Detailed point 2
   - Updated CHANGELOG.md

   Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
   ```

6. **Push to GitHub**:
   ```bash
   git push origin main
   # or
   git push origin feature/your-feature-name
   ```

## 📝 Changelog Requirements

**IMPORTANT**: Every code change MUST include a CHANGELOG.md update.

### Quick Checklist

Before committing, verify:
- [ ] Code changes are complete and tested
- [ ] `CHANGELOG.md` updated under `[Unreleased]` section
- [ ] Entry includes what, why, and which files changed
- [ ] Entry describes user impact
- [ ] Commit message references the changelog update

### Changelog Categories

- **Added**: New features or files
- **Changed**: Modifications to existing functionality
- **Fixed**: Bug fixes
- **Deprecated**: Features marked for future removal
- **Removed**: Deleted features or code
- **Security**: Security-related changes

### Example Changelog Entry

```markdown
## [Unreleased]

### Fixed
- **Tax Calculation Rounding**: Fixed precision errors in tax calculations
  - Root cause: Using Double instead of Decimal for currency
  - Changed all tax calculations to use Decimal type
  - Files modified: `Services/TaxCalculator.swift`, `Models/TaxCalculationResult.swift`
  - Impact: Users now see exact amounts matching official SAT tables
```

## 🏷️ Version Releases

When ready to release a new version:

1. **Choose version number** (Semantic Versioning):
   - **1.x.x** → Breaking changes (MAJOR)
   - **x.1.x** → New features, backward compatible (MINOR)
   - **x.x.1** → Bug fixes only (PATCH)

2. **Update CHANGELOG.md**:
   ```markdown
   ## [1.1.0] - 2026-02-15

   [Move all Unreleased items here]

   ## [Unreleased]

   [Keep this section empty]
   ```

3. **Update version in Xcode**:
   - Open project settings
   - Set version to match changelog (e.g., 1.1.0)
   - Increment build number

4. **Create git tag**:
   ```bash
   git tag -a v1.1.0 -m "Release version 1.1.0"
   git push origin v1.1.0
   ```

5. **Create GitHub release**:
   ```bash
   gh release create v1.1.0 --title "Version 1.1.0" --notes "See CHANGELOG.md for details"
   ```

## 🧪 Testing Guidelines

### Required Tests

- [ ] Test on iPhone SE (smallest screen)
- [ ] Test on iPhone 15 Pro Max (largest iPhone)
- [ ] Test on iPad (10.2")
- [ ] Test on iPad Pro (12.9")
- [ ] Test in portrait orientation
- [ ] Test in landscape orientation
- [ ] Test with various salary amounts
- [ ] Test all pay period options
- [ ] Verify calculations match official SAT/IMSS tables

### Test Edge Cases

- Very small salaries (< $1,000)
- Very large salaries (> $500,000)
- Boundary values between tax brackets
- Zero salary input
- Non-numeric input handling

## 💡 Code Style

### Swift Guidelines

- Use SwiftUI best practices
- Follow MVVM architecture
- Keep views under 300 lines
- Extract reusable components
- Use meaningful variable names
- Add comments for complex logic
- Use `// MARK: -` to organize code sections

### Example

```swift
// MARK: - Properties

@StateObject private var viewModel = TaxCalculatorViewModel()
@Environment(\.horizontalSizeClass) var horizontalSizeClass

// MARK: - Computed Properties

var isIPad: Bool {
    horizontalSizeClass == .regular
}

// MARK: - Body

var body: some View {
    // Implementation
}

// MARK: - Supporting Views

private var headerView: some View {
    // Implementation
}
```

## 📸 Adding Screenshots

When UI changes affect appearance:

1. Take screenshots on both iPhone and iPad
2. Save to `screenshots/` directory
3. Update README.md if necessary
4. Commit screenshots with descriptive names
5. Update CHANGELOG.md mentioning UI changes

## 🐛 Bug Reports

When fixing bugs, document in CHANGELOG:

1. What was broken
2. How to reproduce
3. Root cause
4. The fix
5. How to verify it's fixed

## ❓ Questions?

- Check existing documentation in `/docs`
- Review similar changes in git history
- Ask in issues or discussions

## 📜 License

By contributing, you agree that your contributions will be licensed under the same terms as the project.
