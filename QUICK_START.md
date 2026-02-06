# Quick Start Guide

Get the Mexico Tax Calculator iOS app running in under 5 minutes!

## Prerequisites

- macOS computer
- Xcode 15.0+ installed ([Download from App Store](https://apps.apple.com/app/xcode/id497799835))

## Setup Steps

### 1. Create Xcode Project (2 minutes)

1. Open Xcode
2. **File → New → Project** (or press ⇧⌘N)
3. Select **iOS** → **App**
4. Fill in:
   - Product Name: `MexicoTaxCalculator`
   - Interface: **SwiftUI**
   - Language: **Swift**
5. Click **Next** and save anywhere

### 2. Organize Project Structure (1 minute)

In Xcode's left sidebar, create these groups (right-click project → New Group):
- Models
- Services
- ViewModels
- Views

### 3. Add Source Files (2 minutes)

Copy files from this repository to your Xcode project:

**Root Level:**
- Delete default `ContentView.swift`
- Replace `MexicoTaxCalculatorApp.swift` with provided version

**Models folder:**
- `TaxBracket.swift`
- `IMSSConstants.swift`
- `TaxCalculationResult.swift`

**Services folder:**
- `TaxCalculator.swift`

**ViewModels folder:**
- `TaxCalculatorViewModel.swift`

**Views folder:**
- `TaxCalculatorView.swift`

**Tests folder:**
- Delete default test file
- Add `TaxCalculatorTests.swift`

### 4. Build & Run

1. Select simulator: **iPhone 15 Pro** (or any iPhone)
2. Press **⌘R** or click Play button
3. App launches in simulator

## Verify Installation

The app should display:
- Title: "Mexico Tax Calculator"
- Default salary: $10,000
- Tax calculations showing:
  - ISR: ~$729
  - IMSS: ~$237
  - Net Salary: ~$9,033

## Test the App

Try these inputs:
- **$10,000 monthly** → Net: ~$9,033
- **$20,000 monthly** → Net: ~$17,104
- **$50,000 monthly** → Net: ~$39,547

Change period to:
- **Bi-weekly**: $5,000 → Net: ~$4,517
- **Annual**: $120,000 → Net: ~$108,401

## Run Tests

Press **⌘U** to run all unit tests. All 15+ tests should pass.

## Troubleshooting

### "Cannot find TaxCalculatorView"
- Ensure all files are added to the **MexicoTaxCalculator** target
- Check box in right panel when selecting file

### Build fails
- Clean build folder: **⇧⌘K**
- Rebuild: **⌘B**

### Simulator won't start
- **Xcode → Open Developer Tool → Simulator**
- Or restart Xcode

## Next Steps

- Read [README.md](README.md) for detailed documentation
- See [EXAMPLES.md](EXAMPLES.md) for calculation examples
- Check [SETUP.md](SETUP.md) for advanced setup

## Support

- [Xcode Help](https://developer.apple.com/documentation/xcode)
- [SwiftUI Tutorial](https://developer.apple.com/tutorials/swiftui)

---

**Total Time**: ~5 minutes
**Difficulty**: Beginner-friendly
