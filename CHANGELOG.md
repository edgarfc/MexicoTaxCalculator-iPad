# Changelog

All notable changes to the Mexico Tax Calculator iOS app will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **Bundle Identifier**: Updated to production-ready format for App Store
  - Changed from `test.MexicoTaxCalculatorAppiPad` to `com.edgarflores.MexicoTaxCalculator`
  - Follows Apple's reverse-domain naming convention
  - Removed "test" prefix (not suitable for production)
  - Shorter, cleaner name: `MexicoTaxCalculator` instead of `MexicoTaxCalculatorAppiPad`
  - Updated for all targets: main app, tests, and UI tests
  - File modified: `MexicoTaxCalculatorAppiPad.xcodeproj/project.pbxproj`
  - Build verified successful
  - Ready for App Store Connect registration
  - Impact: This is the permanent, unique identifier for the app in the App Store

- **Salary Input Field**: Improved user experience for salary input
  - Input field now starts blank instead of pre-filled with "10000"
  - Users must enter their own salary amount
  - Provides cleaner, more intuitive first-time experience
  - Numeric keyboard (decimal pad) already configured and working correctly
  - File modified: `MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad/ViewModels/TaxCalculatorViewModel.swift`
  - Impact: Users see empty field on app launch, encouraging them to enter their actual salary

### Added
- **Interactive Icon Creation Guide**: Step-by-step Canva tutorial
  - `.github/CREATE_ICON_NOW.md`: Complete hands-on guide (15-20 minutes)
  - 10 detailed steps with exact instructions
  - Every click and setting documented
  - Color codes ready to copy-paste
  - Troubleshooting section
  - Success checklist
  - Screenshots verification guide
  - Xcode integration steps
  - Alternative simpler 10-minute version
  - Makes icon creation foolproof and fast

- **Final Hybrid Icon Design**: Perfect combination of all 3 original concepts
  - `.github/FINAL_ICON_DESIGN_HYBRID.md`: Detailed specs for hybrid design
  - Combines calculator (Concept 1) + percentage (Concept 2) + Mexican colors (Concept 3)
  - Two layout options: vertical flag stripe OR horizontal flag stripes (recommended)
  - Exact color codes and specifications
  - Complete Canva tutorial (5 steps, 15 minutes)
  - AI generation prompt ready to use
  - Size testing at all icon sizes (1024px to 40px)
  - Professional, readable, and uniquely Mexican

- **Final Icon Mockups**: Visual ASCII representations of hybrid design
  - `.github/FINAL_ICON_MOCKUP.txt`: Visual mockups of both layouts
  - Layout A: Vertical Mexican flag stripe on right side
  - Layout B: Horizontal Mexican flag stripes at top (RECOMMENDED)
  - Simplified ultra-easy version
  - Size comparison showing how it looks from 1024px to 40px
  - Color codes for copy-paste
  - 5-step Canva quick guide
  - Ready-to-use AI prompt

- **Text-Based Icon Option**: Design with "Calculadora ISR Mexico" text
  - `.github/ICON_WITH_TEXT_DESIGN.md`: Full text version guide
  - Warning about readability at small sizes
  - Better alternative: "ISR" only version
  - Both options fully documented
  - Helps user understand text limitations on icons

- **App Icon Design Guide**: Complete guide for creating app icon
  - `.github/APP_ICON_DESIGN.md`: Comprehensive design brief with 3 concepts
  - Technical specifications (1024x1024 PNG, no transparency)
  - Three design concepts with detailed color palettes
  - Step-by-step creation guide for Canva (free tool)
  - AI prompt for automated generation
  - Designer hiring guide with budget estimates
  - Tools comparison (Canva, Figma, GIMP, Sketch)
  - Design checklist and testing guide

- **App Icon Visual Mockups**: ASCII art mockups of icon concepts
  - `.github/ICON_MOCKUPS.txt`: Visual representations of all 3 concepts
  - Color palette reference
  - Size comparison guide (1024px down to 60px)
  - Quick decision guide for choosing concept
  - Canva quick-start steps
  - Final verification checklist
  - Makes it easy to visualize and choose design direction

- **App Store Submission Checklist**: Comprehensive guide for preparing app for App Store
  - `.github/APP_STORE_CHECKLIST.md`: Complete checklist with all requirements
  - Critical requirements (app icon, bundle ID, developer account, screenshots)
  - Privacy policy template
  - App Store Connect setup steps
  - Testing checklist
  - Metadata guidelines
  - Timeline estimates
  - Quick start and professional submission paths
  - Helps identify what's ready and what needs work before submission

- **Xcode Git Integration Guide**: Complete guide for using git directly from Xcode
  - `.github/XCODE_GIT_GUIDE.md`: Step-by-step instructions for Xcode source control
  - Covers all common git operations (commit, push, pull, branching)
  - Keyboard shortcuts reference table
  - Recommended workflow for making changes
  - Troubleshooting section for common issues
  - Checklist to ensure CHANGELOG updates with every commit
  - Makes it easy to use git without leaving Xcode IDE

- **Contributing Guidelines**: Created comprehensive documentation for contributors
  - `.github/CONTRIBUTING.md`: Complete workflow guide for making changes
  - Includes changelog update requirements and checklist
  - Testing guidelines for iPhone and iPad
  - Code style recommendations following Swift best practices
  - Version release process documentation
  - Ensures all future changes will be properly documented

- **Changelog Template**: Added template for consistent changelog entries
  - `.github/CHANGELOG_TEMPLATE.md`: Template and examples for future updates
  - Explains each changelog category (Added, Changed, Fixed, etc.)
  - Provides examples of well-written changelog entries
  - Guidelines for when to create new versions
  - Helps maintain high-quality documentation standards

## [1.0.1] - 2026-02-06

### Fixed
- **iPad Layout Padding Overflow**: Fixed padding calculation in iPad two-column layout where content was extending beyond the right edge of the screen
  - Changed column width calculation to account for horizontal padding and spacing before sizing
  - Left column now uses 38% of available width (after padding)
  - Right column now uses 62% of available width (after padding)
  - Total layout now fits perfectly within screen bounds without overflow
  - File modified: `MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad/Views/TaxCalculatorView.swift`

### Added
- **Screenshots**: Added visual documentation to README
  - iPhone screenshot showing single-column vertical layout
  - iPad screenshot demonstrating optimized two-column side-by-side layout
  - Screenshots stored in `screenshots/` directory
  - Enhanced README with Screenshots section featuring both device layouts

### Changed
- **README Enhancement**: Updated feature list to highlight iPad optimization and responsive design as key features

## [1.0.0] - 2026-02-06

### Added
- **Initial Release**: Mexico Tax Calculator iOS/iPadOS application

#### Core Features
- **ISR Calculation**: Accurate Income Tax calculation using official 2026 tax brackets from SAT
  - 11 tax brackets with progressive rates from 1.92% to 35%
  - Automatic bracket detection based on monthly income
  - Fixed quota and percentage on excess calculation

- **IMSS Calculation**: Social Security employee contributions
  - Sickness and Maternity: 0.40% (on income above 3 UMAs) + 0.375% + 0.25%
  - Disability and Life: 0.625%
  - Old Age and Severance: 1.125%
  - Total: ~2.775% of gross salary
  - UMA 2026 values: Daily $117.31, Monthly $3,566.22

- **Multiple Pay Periods**: Support for different salary calculation periods
  - Monthly (Mensual)
  - Bi-weekly (Quincenal)
  - Weekly (Semanal)
  - Annual (Anual)

- **Tax Analysis Features**:
  - Real-time calculations as you type
  - Net salary calculation (gross - total deductions)
  - Detailed tax breakdown (ISR + IMSS)
  - Average tax rate percentage
  - Marginal tax rate percentage
  - Current tax bracket information with income range
  - Rate on excess display

#### User Interface
- **iPad-Optimized Layout**:
  - Two-column responsive design
  - Left column (38%): Header and input section
  - Right column (62%): Results and tax breakdown
  - Larger fonts for better readability (36pt titles vs 34pt on iPhone)
  - Enhanced padding (24pt vs 16pt on iPhone)
  - Placeholder view with helpful instructions when no results

- **iPhone Layout**:
  - Single-column vertical scrolling layout
  - Optimized for one-handed use
  - Space-efficient card arrangement

- **Design System**:
  - Clean SwiftUI interface with modern iOS design patterns
  - Color-coded tax information:
    - 🟢 Green for Net Salary
    - 🔴 Red for Total Taxes/Deductions
    - 🟠 Orange for ISR
    - 🔵 Blue for IMSS
  - Summary cards with icons and shadows
  - Consistent 16pt border radius
  - `.systemGray6` backgrounds for card elements
  - Segmented picker for pay period selection

#### Technical Architecture
- **Models**:
  - `TaxBracket.swift`: ISR tax bracket data structure
  - `IMSSConstants.swift`: IMSS rates and UMA constants
  - `TaxCalculationResult.swift`: Complete calculation result model with all computed values

- **Services**:
  - `TaxCalculator.swift`: Core tax calculation engine with official formulas

- **ViewModels**:
  - `TaxCalculatorViewModel.swift`: Observable view model handling user input and calculations

- **Views**:
  - `TaxCalculatorView.swift`: Main calculator interface with adaptive layout
  - `SummaryCard`: Reusable summary display component
  - `TaxDetailRow`: Tax breakdown row component

#### Platform Support
- iOS 17.0+
- iPadOS 17.0+
- Xcode 15.0+
- SwiftUI framework
- Responsive design using size classes

#### Documentation
- Comprehensive README.md with:
  - Feature overview
  - Official 2026 ISR tax bracket table
  - IMSS contribution breakdown
  - Project structure diagram
  - Build and run instructions
  - Usage examples
  - Data sources and references
  - Legal disclaimer

- Additional documentation:
  - `IPAD_IMPROVEMENTS.md`: Detailed iPad layout improvements and design decisions
  - `PROJECT_STRUCTURE.md`: Complete project organization guide
  - `SETUP.md`: Development environment setup instructions
  - `QUICK_START.md`: Quick start guide for developers
  - `EXAMPLES.md`: Usage examples and calculations
  - `XCODE_SETUP.md`: Xcode project configuration guide
  - Spanish versions: `LEEME.md`, `INICIO_RAPIDO.md`

#### Legal & Compliance
- Based on official 2026 Mexican tax regulations:
  - SAT Anexo 8 de la Resolución Miscelánea Fiscal 2026
  - Official IMSS employee contribution rates for 2026
  - 2026 UMA (Unidad de Medida y Actualización) values
- Clear disclaimer about informational purposes
- References to official sources (SAT, IMSS, ElConta.MX, Talent.com)

#### Testing
- Unit tests for tax calculations
- Test coverage for edge cases
- UI tests for user interactions

---

## Version History Summary

- **1.0.1** (2026-02-06): iPad layout padding fix + screenshots
- **1.0.0** (2026-02-06): Initial release with full tax calculation features and iPad optimization

---

## Contributing

When making changes to this project:
1. Update this CHANGELOG.md with your changes under the `[Unreleased]` section
2. Follow the format: Added/Changed/Deprecated/Removed/Fixed/Security
3. Include technical details and file paths for code changes
4. When releasing a new version, move `[Unreleased]` items to a new version section

## References

- [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
- [Semantic Versioning](https://semver.org/spec/v2.0.0.html)
