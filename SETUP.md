# Setup Instructions for Mexico Tax Calculator iOS App

This document provides step-by-step instructions to set up and run the Mexico Tax Calculator iOS app in Xcode.

## Prerequisites

- **macOS**: macOS 13 (Ventura) or later
- **Xcode**: Version 15.0 or later
- **iOS Deployment Target**: iOS 17.0 or later

## Option 1: Create Xcode Project from Scratch

### Step 1: Create New Xcode Project

1. Open Xcode
2. Select **File > New > Project** (or press ⇧⌘N)
3. Choose **iOS** tab
4. Select **App** template
5. Click **Next**

### Step 2: Configure Project Settings

Fill in the following details:

- **Product Name**: `MexicoTaxCalculator`
- **Team**: Select your development team (or leave as "None" for simulator only)
- **Organization Identifier**: `com.yourname` (or your preferred identifier)
- **Bundle Identifier**: Will be auto-generated as `com.yourname.MexicoTaxCalculator`
- **Interface**: Select **SwiftUI**
- **Language**: Select **Swift**
- **Storage**: Select **None**
- **Include Tests**: Check this option

Click **Next** and choose a location to save the project.

### Step 3: Organize Project Structure

In Xcode's Project Navigator (left sidebar):

1. Right-click on the `MexicoTaxCalculator` group (yellow folder)
2. Select **New Group** and create the following groups:
   - `Models`
   - `Views`
   - `ViewModels`
   - `Services`

### Step 4: Add Source Files

For each file in this repository:

1. **Delete the default `ContentView.swift`** file that Xcode created
2. Right-click on the appropriate group and select **New File**
3. Choose **Swift File**
4. Name it according to the file structure below
5. Copy and paste the contents from the corresponding file in this repository

**File Organization:**

```
MexicoTaxCalculator/
├── MexicoTaxCalculatorApp.swift (root level - replace default)
├── Models/
│   ├── TaxBracket.swift
│   ├── IMSSConstants.swift
│   └── TaxCalculationResult.swift
├── Services/
│   └── TaxCalculator.swift
├── ViewModels/
│   └── TaxCalculatorViewModel.swift
└── Views/
    └── TaxCalculatorView.swift
```

**For Tests:**
1. Expand `MexicoTaxCalculatorTests` group
2. Delete the default test file
3. Create new file: `TaxCalculatorTests.swift`
4. Copy contents from `Tests/TaxCalculatorTests.swift`

### Step 5: Update Info.plist (Optional)

The Info.plist is now mostly handled automatically, but you can customize:

1. Select the project in Project Navigator (blue icon)
2. Select the `MexicoTaxCalculator` target
3. Go to the **Info** tab
4. Update **Display Name** to "Mexico Tax Calculator"

### Step 6: Build and Run

1. Select a simulator from the device menu (e.g., iPhone 15 Pro)
2. Press ⌘R or click the Play button to build and run
3. The app should launch in the iOS Simulator

## Option 2: Using Provided Files

If you've cloned this repository:

1. Open Xcode
2. Create a new iOS App project as described in Option 1
3. Delete all default Swift files from the new project
4. Drag and drop all files from the repository into Xcode
5. Ensure files are copied to the project when prompted
6. Make sure all files are added to the target (check the box in the file inspector)
7. Organize files into groups as needed

## Running Tests

1. Press ⌘U or select **Product > Test**
2. View test results in the Test Navigator (⌘6)
3. All tests should pass, validating the tax calculations

### Test Coverage

The test suite includes:
- ISR calculations for each tax bracket
- IMSS calculation validation
- Complete tax calculation tests
- Period conversion tests (monthly, bi-weekly, weekly, annual)
- Edge cases (zero salary, minimum wage, very high income)

## Troubleshooting

### Build Errors

**"Cannot find 'TaxCalculatorView' in scope"**
- Ensure all files are added to the correct target
- Check that file organization matches the structure above
- Verify all imports are correct

**Module compilation errors**
- Clean build folder: ⇧⌘K
- Rebuild: ⌘B

### Runtime Issues

**App crashes on launch**
- Check that `MexicoTaxCalculatorApp.swift` is set as the main entry point
- Verify the `@main` attribute is present

**UI not displaying correctly**
- Check that all View files are properly imported
- Verify SwiftUI preview is working (⌥⌘P)

### Simulator Issues

**Simulator not showing**
- Select **Xcode > Open Developer Tool > Simulator**
- Or select a device from the device menu in Xcode

## Development Tips

### Live Preview

1. Open `TaxCalculatorView.swift`
2. Press ⌥⌘P to show SwiftUI preview
3. Click "▶" on the preview to make it interactive
4. Changes to the code will update the preview in real-time

### Debugging

1. Set breakpoints by clicking the line number gutter
2. Run in debug mode (⌘R)
3. Use the debug console (⇧⌘Y) to inspect variables

### Testing Individual Components

You can test individual components using SwiftUI previews:

```swift
#Preview {
    TaxCalculatorView()
}
```

## Deployment

### Running on a Physical Device

1. Connect your iPhone/iPad via USB
2. Select your device from the device menu
3. In project settings, select a Team under **Signing & Capabilities**
4. Xcode will handle provisioning automatically
5. Press ⌘R to build and run

### App Store Preparation

1. Update version and build numbers in project settings
2. Add app icons to `Assets.xcassets`
3. Configure app capabilities as needed
4. Archive the app: **Product > Archive**
5. Follow Apple's App Store submission guidelines

## Customization

### Updating Tax Tables

To update tax brackets for future years:

1. Edit `Models/TaxBracket.swift`
2. Update the `monthlyBrackets2026` array with new values
3. Update the struct name to reflect the new year
4. Update tests to match new expected values

### Changing UMA Values

Edit `Models/IMSSConstants.swift`:
- Update `umaDaily2026` and `umaMonthly2026`
- Update minimum wage values if changed

### Adding New Features

Suggested enhancements:
- Annual income tax calculator with deductions
- Comparison between different salary scenarios
- Export results as PDF
- Historical tax calculation (multiple years)
- INFONAVIT contribution calculator

## Resources

- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [SAT Official Website](https://www.sat.gob.mx/)
- [IMSS Official Website](https://www.imss.gob.mx/)

## Support

For issues with the tax calculation logic, please refer to the official SAT and IMSS documentation. For app development issues, consult the Xcode documentation or Apple Developer forums.
