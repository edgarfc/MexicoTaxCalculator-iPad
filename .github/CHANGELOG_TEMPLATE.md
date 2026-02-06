# Changelog Entry Template

Use this template when updating CHANGELOG.md with new changes.

## Template

```markdown
## [Unreleased]

### Added
- **Feature Name**: Brief description
  - Detailed explanation of what was added
  - Technical details (file paths, new components, etc.)
  - User-facing benefits

### Changed
- **Component/Feature Name**: What changed
  - Why it changed
  - Impact on users or developers
  - Files modified: `path/to/file.swift`

### Fixed
- **Bug Description**: What was broken
  - Root cause explanation
  - How it was fixed
  - Files modified: `path/to/file.swift`
  - Impact: Who/what was affected

### Deprecated
- **Feature/API Name**: What's being deprecated
  - Reason for deprecation
  - Migration path or alternatives
  - Timeline for removal

### Removed
- **Feature/Code Name**: What was removed
  - Reason for removal
  - Migration guide if applicable

### Security
- **Vulnerability/Fix**: Security issue addressed
  - CVE number if applicable
  - Severity level
  - Mitigation steps
```

## Guidelines

1. **Always update CHANGELOG.md** when making code changes
2. **Add entries under `[Unreleased]`** section at the top
3. **Use clear, descriptive language** - explain both what and why
4. **Include technical details** for developers:
   - File paths that were modified
   - New dependencies added
   - Breaking changes highlighted
5. **Include user impact** - how does this affect the app users?
6. **Group related changes** together under one heading
7. **Use present tense** for descriptions ("Add feature" not "Added feature")
8. **Link to issues/PRs** when applicable

## Categories Explained

- **Added**: New features, files, or functionality
- **Changed**: Changes to existing functionality (not bug fixes)
- **Deprecated**: Features that still work but will be removed soon
- **Removed**: Features or code that has been deleted
- **Fixed**: Bug fixes
- **Security**: Security-related fixes or improvements

## Example Entry

```markdown
## [Unreleased]

### Added
- **Dark Mode Support**: Full dark mode implementation across all views
  - Automatically follows system appearance settings
  - Custom color palette optimized for both light and dark modes
  - Updated all cards and backgrounds to use adaptive colors
  - Files modified: `Views/TaxCalculatorView.swift`, `Models/ColorPalette.swift`
  - Enhances user experience in low-light conditions

### Fixed
- **Calculation Precision**: Fixed rounding errors in IMSS calculations
  - Issue: IMSS amounts were sometimes off by 1-2 cents
  - Root cause: Floating-point arithmetic precision issues
  - Solution: Switched to Decimal type for all currency calculations
  - Files modified: `Services/TaxCalculator.swift`
  - Impact: All users now get exact calculations matching official IMSS tables
```

## When to Create a New Version

When you're ready to release, move all `[Unreleased]` items to a new version section:

1. Decide the version number following [Semantic Versioning](https://semver.org/):
   - **MAJOR** (x.0.0): Breaking changes
   - **MINOR** (1.x.0): New features, backward compatible
   - **PATCH** (1.0.x): Bug fixes, backward compatible

2. Create the new version section with date:
   ```markdown
   ## [1.1.0] - 2026-02-15
   ```

3. Move all `[Unreleased]` content under it

4. Leave `[Unreleased]` section empty at the top

5. Update the version number in your Xcode project

6. Create a git tag:
   ```bash
   git tag -a v1.1.0 -m "Version 1.1.0"
   git push origin v1.1.0
   ```
