# Mexico Tax Calculator - Complete Project Structure

## Overview

This document provides a comprehensive overview of the iOS app structure, dependencies, and architecture.

## Directory Structure

```
MexicoTaxCalculator/
│
├── MexicoTaxCalculatorApp.swift          # App entry point with @main
│
├── Models/                               # Data models
│   ├── TaxBracket.swift                  # ISR tax bracket definitions
│   ├── IMSSConstants.swift               # IMSS rates and UMA values
│   └── TaxCalculationResult.swift        # Result model with all calculations
│
├── Services/                             # Business logic
│   └── TaxCalculator.swift               # Core tax calculation engine
│
├── ViewModels/                           # View state management
│   └── TaxCalculatorViewModel.swift      # Calculator view model (Observable)
│
├── Views/                                # SwiftUI views
│   └── TaxCalculatorView.swift           # Main calculator interface
│
├── Tests/                                # Unit tests
│   └── TaxCalculatorTests.swift          # Comprehensive tax calculation tests
│
├── Assets.xcassets/                      # Images and colors (created by Xcode)
│   ├── AppIcon.appiconset/              # App icon assets
│   └── AccentColor.colorset/            # App accent color
│
├── Info.plist                            # App configuration
├── README.md                             # Project documentation
├── SETUP.md                              # Setup instructions
├── EXAMPLES.md                           # Calculation examples
└── PROJECT_STRUCTURE.md                  # This file
```

## Architecture

### MVVM Pattern

The app follows the **Model-View-ViewModel (MVVM)** architectural pattern:

```
┌─────────────────────────────────────────────┐
│                   View                      │
│         (TaxCalculatorView.swift)          │
│                                             │
│  - User interface with SwiftUI             │
│  - Input fields for salary and period      │
│  - Display tax calculation results         │
└──────────────────┬──────────────────────────┘
                   │ Binding
                   ↓
┌─────────────────────────────────────────────┐
│                ViewModel                    │
│      (TaxCalculatorViewModel.swift)        │
│                                             │
│  - @Published properties for state         │
│  - Input validation and parsing            │
│  - Triggers calculations                   │
└──────────────────┬──────────────────────────┘
                   │ Uses
                   ↓
┌─────────────────────────────────────────────┐
│              Service Layer                  │
│          (TaxCalculator.swift)             │
│                                             │
│  - ISR calculation logic                   │
│  - IMSS calculation logic                  │
│  - Period conversions                      │
└──────────────────┬──────────────────────────┘
                   │ Uses
                   ↓
┌─────────────────────────────────────────────┐
│                 Models                      │
│  - TaxBracket.swift                        │
│  - IMSSConstants.swift                     │
│  - TaxCalculationResult.swift              │
│                                             │
│  - Data structures and constants           │
│  - Tax brackets (2026)                     │
│  - IMSS rates and UMA values               │
└─────────────────────────────────────────────┘
```

## Component Details

### 1. App Entry Point

**File**: `MexicoTaxCalculatorApp.swift`

```swift
@main
struct MexicoTaxCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            TaxCalculatorView()
        }
    }
}
```

- Main entry point marked with `@main`
- Creates the app's window scene
- Displays `TaxCalculatorView` as root view

### 2. Models

#### TaxBracket.swift
- Defines the structure of ISR tax brackets
- Contains all 11 tax brackets for 2026
- Provides `findBracket(for:)` method to locate appropriate bracket

**Key Properties**:
- `lowerLimit`: Minimum income for bracket
- `upperLimit`: Maximum income (nil for highest bracket)
- `fixedQuota`: Base tax amount
- `percentageOnExcess`: Tax rate on amount over lower limit

#### IMSSConstants.swift
- Contains IMSS employee contribution rates
- Defines UMA values for 2026
- Includes minimum wage constants

**Key Values**:
- UMA Daily: $117.31
- UMA Monthly: $3,566.22
- Total employee contribution: ~2.775%

#### TaxCalculationResult.swift
- Stores complete calculation results
- Includes input parameters and all outputs
- Defines `SalaryPeriod` enum (Monthly, Bi-weekly, Weekly, Annual)

**Key Properties**:
- `grossSalary`, `isrAmount`, `imssAmount`
- `totalDeductions`, `netSalary`
- `averageTaxRate`, `marginalTaxRate`

### 3. Services

#### TaxCalculator.swift

Main calculation engine with three primary methods:

1. **`calculateTaxes(grossSalary:period:)`**
   - Main calculation method
   - Converts salary to monthly equivalent
   - Calls ISR and IMSS calculators
   - Returns complete `TaxCalculationResult`

2. **`calculateISR(monthlyIncome:)`** (private)
   - Finds appropriate tax bracket
   - Applies ISR formula: Fixed Quota + (Excess × Rate)
   - Returns ISR amount and bracket

3. **`calculateIMSS(monthlyIncome:)`** (private)
   - Calculates employee IMSS contributions
   - Handles 3 UMA threshold logic
   - Caps at 25 UMAs maximum
   - Returns total IMSS amount

### 4. ViewModels

#### TaxCalculatorViewModel.swift

ObservableObject that manages view state:

**Published Properties**:
- `salaryInput: String` - User input (text)
- `selectedPeriod: SalaryPeriod` - Selected pay period
- `calculationResult: TaxCalculationResult?` - Calculation output

**Functionality**:
- Real-time calculation on input change
- Decimal parsing from string input
- Default example value ($10,000)

### 5. Views

#### TaxCalculatorView.swift

Main SwiftUI view with several sections:

1. **Header**: App title and subtitle
2. **Input Section**:
   - Salary text field
   - Period picker (segmented control)
3. **Results Section**:
   - Summary cards (net salary, total tax)
   - Detailed breakdown (ISR, IMSS)
   - Tax rates (average, marginal)
   - Tax bracket information
   - Disclaimer

**Supporting Views**:
- `SummaryCard`: Displays key metrics
- `TaxDetailRow`: Shows individual tax components

## Data Flow

### User Input to Display

```
1. User types salary amount
   ↓
2. TaxCalculatorViewModel.salaryInput updates
   ↓
3. didSet triggers calculateTaxes()
   ↓
4. parseDecimal() converts string to Decimal
   ↓
5. TaxCalculator.calculateTaxes() is called
   ↓
6. ISR and IMSS are calculated
   ↓
7. TaxCalculationResult is created
   ↓
8. calculationResult @Published property updates
   ↓
9. SwiftUI view automatically refreshes
   ↓
10. Results displayed to user
```

## Dependencies

### Native iOS Frameworks

- **SwiftUI**: Modern declarative UI framework
- **Foundation**: Core data types (Decimal, NumberFormatter, etc.)
- **Combine**: Reactive programming (ObservableObject, Published)
- **XCTest**: Unit testing framework

### Third-Party Dependencies

**None** - This app uses only native iOS frameworks.

## Testing

### Test Coverage

**File**: `Tests/TaxCalculatorTests.swift`

Test categories:
1. **ISR Tax Bracket Tests**: Verify each bracket calculation
2. **IMSS Tests**: Validate social security calculations
3. **Complete Calculation Tests**: End-to-end validation
4. **Period Conversion Tests**: Multi-period support
5. **Edge Cases**: Zero salary, minimum wage, very high income

**Total Tests**: 15+ test cases covering all scenarios

### Running Tests

```bash
# Command line
xcodebuild test -scheme MexicoTaxCalculator -destination 'platform=iOS Simulator,name=iPhone 15'

# Or in Xcode: ⌘U
```

## Build Configuration

### Minimum Requirements

- **iOS Deployment Target**: 17.0+
- **Swift Version**: 5.9+
- **Xcode Version**: 15.0+

### Build Settings (Recommended)

```
PRODUCT_NAME: MexicoTaxCalculator
PRODUCT_BUNDLE_IDENTIFIER: com.yourcompany.MexicoTaxCalculator
TARGETED_DEVICE_FAMILY: 1,2 (iPhone and iPad)
SUPPORTS_MACCATALYST: NO
SWIFT_VERSION: 5.9
```

## Localization

Currently supports:
- **Spanish (Mexico)**: Primary target audience
- **English**: Secondary (for code and some UI elements)

### Future Localization

To add Spanish localization:
1. Add Spanish strings file
2. Localize UI text
3. Add Spanish tax terminology
4. Format currency with Mexican locale

## Performance Considerations

### Optimizations

1. **Decimal Arithmetic**: Uses `Decimal` instead of `Double` for precise financial calculations
2. **Lazy Loading**: Results calculated only when needed
3. **Efficient Bracket Search**: Linear search through 11 brackets (O(n), n=11)
4. **No External Dependencies**: Reduces app size and load time

### Scalability

Current implementation handles:
- ✅ Real-time calculations (< 1ms)
- ✅ Any salary amount (tested up to $1,000,000)
- ✅ All pay periods
- ✅ iPhone and iPad

## Future Enhancements

### Potential Features

1. **Advanced Calculations**:
   - Annual tax filing calculator
   - Deduction tracking
   - Multiple income sources
   - Freelancer tax calculator

2. **Data Persistence**:
   - Save calculation history
   - Compare multiple scenarios
   - Export to PDF/Excel

3. **Additional Taxes**:
   - IVA (VAT) calculator
   - Import/export taxes
   - Property tax estimator

4. **UI Improvements**:
   - Dark mode optimization
   - Custom themes
   - Charts and graphs
   - Comparison view

5. **Automation**:
   - Auto-update tax tables from SAT API
   - Notifications for tax law changes
   - Integration with payroll systems

## Maintenance

### Updating Tax Tables

When SAT publishes new tax brackets:

1. Update `TaxBracket.monthlyBrackets2026` array
2. Create new constant (e.g., `monthlyBrackets2027`)
3. Update tests with new expected values
4. Update README and documentation

### Updating IMSS Rates

When IMSS rates change:

1. Edit `IMSSConstants.swift`
2. Update `EmployeeRates` struct
3. Update UMA values
4. Run tests to verify calculations

## License & Compliance

### Disclaimer

This app provides estimates only and should not be used as official tax filing software. Users should consult:
- SAT (Servicio de Administración Tributaria)
- Certified tax professionals
- Official payroll systems

### Data Privacy

- No data collection
- No network requests
- All calculations performed locally
- No personal information stored

## Support & Documentation

### Resources

- **Official Tax Tables**: [SAT Website](https://www.sat.gob.mx/)
- **IMSS Information**: [IMSS Website](https://www.imss.gob.mx/)
- **Swift Documentation**: [Swift.org](https://swift.org/documentation/)
- **SwiftUI Tutorials**: [Apple Developer](https://developer.apple.com/tutorials/swiftui)

### Contact

For technical issues or feature requests, please refer to the project repository or contact the development team.

---

**Last Updated**: February 2026
**Version**: 1.0
**iOS Target**: 17.0+
