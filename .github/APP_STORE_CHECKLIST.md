# App Store Submission Checklist

This checklist will help you prepare the Mexico Tax Calculator app for App Store submission.

## ❌ Critical Requirements (Must Fix Before Submission)

### 1. **App Icon** ❌ REQUIRED
- [ ] **Status**: Missing - No app icon images configured
- [ ] **What's needed**: 1024x1024px PNG app icon (no transparency, no rounded corners)
- [ ] **Where to add**:
  - Open Xcode
  - Navigate to Assets.xcassets → AppIcon
  - Drag your 1024x1024 icon into the slot
- [ ] **Design requirements**:
  - Must be exactly 1024x1024 pixels
  - No alpha channel (transparency)
  - RGB color space
  - PNG format
  - Represents your app (calculator/tax theme)
- [ ] **Tools for creation**:
  - Canva, Figma, Sketch, or hire a designer
  - Consider icons: calculator, Mexican flag colors, money symbols

### 2. **Bundle Identifier** ⚠️ NEEDS UPDATE
- [ ] **Current**: `test.MexicoTaxCalculatorAppiPad`
- [ ] **Issue**: "test" prefix is not suitable for production
- [ ] **Recommended**: `com.edgarflores.MexicoTaxCalculator` or `com.yourcompany.MexicoTaxCalculator`
- [ ] **How to change**:
  1. Open Xcode project
  2. Select project in navigator
  3. Select target → General tab
  4. Update "Bundle Identifier" field
  5. Must be unique (not used by any other app)

### 3. **Apple Developer Account** ❌ REQUIRED
- [ ] **Status**: Unknown - Do you have an Apple Developer account?
- [ ] **Cost**: $99 USD/year
- [ ] **Sign up**: https://developer.apple.com/programs/
- [ ] **Required for**: App Store submission, TestFlight, code signing
- [ ] **What you'll need**:
  - Apple ID
  - Credit card
  - Tax information (IRS W-9 or W-8BEN)
  - Banking information (for receiving payments if app is paid)

### 4. **Privacy Policy** ⚠️ RECOMMENDED
- [ ] **Status**: Missing
- [ ] **Required if**: App collects any user data (even analytics)
- [ ] **Current app**: Does NOT collect data, but App Store may still require it
- [ ] **What to include**:
  - Statement that no data is collected
  - Clarification that calculations are done locally
  - Disclaimer about tax accuracy
  - Contact information
- [ ] **Where to host**:
  - GitHub Pages (free)
  - Personal website
  - Legal services like iubenda.com
- [ ] **Template provided below**: See Privacy Policy Template section

### 5. **App Store Screenshots** ❌ REQUIRED
- [ ] **Status**: Have 2 screenshots, need more for App Store
- [ ] **Required sizes** for iPhone:
  - [ ] 6.7" display (iPhone 15 Pro Max): 1290 x 2796 pixels
  - [ ] 6.5" display (iPhone 14 Plus): 1284 x 2778 pixels
  - [ ] 5.5" display (iPhone 8 Plus): 1242 x 2208 pixels
- [ ] **Required sizes** for iPad:
  - [ ] 12.9" display (iPad Pro): 2048 x 2732 pixels
  - [ ] 11" display (iPad Pro): 1668 x 2388 pixels
- [ ] **Minimum required**: 3-10 screenshots per device size
- [ ] **Tips**:
  - Show key features
  - Use different salary amounts
  - Show tax breakdown, rates, bracket info
  - Can add text overlays highlighting features
  - First screenshot is most important

## ⚠️ Important (Should Fix)

### 6. **App Description & Metadata**
- [ ] **App Name**: "Mexico Tax Calculator" or "Calculadora de Impuestos México"
- [ ] **Subtitle**: Short description (30 chars max)
  - Example: "ISR & IMSS Calculator 2026"
- [ ] **Description**: Detailed description (4000 chars max)
  - Explain features
  - Mention ISR and IMSS calculations
  - List supported pay periods
  - Include disclaimer
  - Bilingual (Spanish/English) recommended
- [ ] **Keywords**: Comma-separated for search
  - Example: "ISR,IMSS,impuestos,tax,calculator,calculadora,salario,salary,SAT,Mexico"
- [ ] **Category**: Primary = Finance, Secondary = Productivity
- [ ] **Age Rating**: 4+

### 7. **Versioning**
- [x] **Marketing Version**: 1.0 ✅ (Currently set correctly)
- [x] **Build Number**: 1 ✅ (Currently set correctly)
- [ ] **Plan for updates**: Each submission needs unique build number

### 8. **Testing**
- [ ] **Test on real devices**:
  - [ ] iPhone SE (smallest screen)
  - [ ] iPhone 14/15 (standard size)
  - [ ] iPhone 15 Pro Max (largest)
  - [ ] iPad (10.2" or 10.9")
  - [ ] iPad Pro (12.9")
- [ ] **Test orientations**:
  - [ ] Portrait (iPhone and iPad)
  - [ ] Landscape (iPad)
- [ ] **Test edge cases**:
  - [ ] Very small salaries
  - [ ] Very large salaries (> 1 million)
  - [ ] Boundary values between tax brackets
  - [ ] Empty input handling
  - [ ] Invalid input (letters, symbols)
  - [ ] All pay period options
- [ ] **Accessibility testing**:
  - [ ] VoiceOver navigation
  - [ ] Dynamic Type (larger text sizes)
  - [ ] Sufficient color contrast

### 9. **Localization**
- [ ] **Current**: Spanish (Mexican) ✅
- [ ] **Consider adding**:
  - [ ] English (for international users in Mexico)
  - [ ] Update README to mention language support

### 10. **Legal & Compliance**
- [x] **Disclaimer**: Already included in app ✅
- [ ] **Terms of Service**: Optional but recommended
- [ ] **Copyright**: Add copyright notice
  - Example: "© 2026 Edgar Flores. All rights reserved."
- [ ] **Data accuracy**: Verify ISR and IMSS rates are current
- [ ] **Review guidelines**: Read Apple's App Store Review Guidelines
  - https://developer.apple.com/app-store/review/guidelines/

## ✅ Already Complete

- [x] **Clean, working app** ✅
- [x] **SwiftUI implementation** ✅
- [x] **iPad optimization** ✅
- [x] **Responsive design** ✅
- [x] **Official 2026 tax rates** ✅
- [x] **Multiple pay periods** ✅
- [x] **Accurate calculations** ✅
- [x] **No crashes or bugs** ✅
- [x] **Professional UI** ✅
- [x] **Source control with git** ✅
- [x] **Documentation** ✅

## 📋 App Store Connect Setup Steps

Once you have Apple Developer account:

### 1. Create App Record
1. Log in to App Store Connect (https://appstoreconnect.apple.com)
2. Go to "My Apps"
3. Click "+" → "New App"
4. Fill in:
   - Platform: iOS
   - Name: Mexico Tax Calculator
   - Primary Language: Spanish (Mexico)
   - Bundle ID: (must match Xcode)
   - SKU: Unique identifier (e.g., "mex-tax-calc-2026")
   - User Access: Full Access

### 2. Upload Build via Xcode
1. Open Xcode project
2. Select "Any iOS Device" as target
3. Product → Archive
4. Click "Distribute App"
5. Select "App Store Connect"
6. Follow wizard to upload

### 3. Complete App Information
- App Privacy (declare no data collection)
- Pricing (Free or Paid)
- App Information (description, keywords, screenshots)
- Age Rating (complete questionnaire)
- App Review Information (contact info, demo account if needed)

### 4. Submit for Review
- Select uploaded build
- Complete all required fields
- Click "Submit for Review"
- Wait 1-3 days for Apple review

## 🎨 Privacy Policy Template

If you need a simple privacy policy, here's a template:

```markdown
# Privacy Policy - Mexico Tax Calculator

Last updated: February 6, 2026

## Data Collection

Mexico Tax Calculator does NOT collect, store, or transmit any personal data.

## What We DON'T Collect
- We do not collect names, emails, or contact information
- We do not collect salary information you enter
- We do not track your usage or analytics
- We do not use cookies or tracking technologies
- We do not share any data with third parties

## How the App Works
- All tax calculations are performed locally on your device
- No data leaves your device
- No internet connection is required
- No accounts or sign-up needed

## Tax Calculation Accuracy
This app provides estimates based on official 2026 ISR tax brackets and IMSS rates.
Calculations are for informational purposes only and should not be considered official
tax advice. For official tax calculations, please consult:
- A certified tax professional
- SAT (Servicio de Administración Tributaria)
- Your employer's payroll department

## Data Sources
Tax rates are based on:
- SAT Anexo 8 de la Resolución Miscelánea Fiscal 2026
- Official IMSS employee contribution rates for 2026
- 2026 UMA (Unidad de Medida y Actualización) values

## Contact
For questions about this privacy policy or the app:
Email: edgar.afc@gmail.com
GitHub: https://github.com/edgarfc/MexicoTaxCalculator-iPad

## Changes to Privacy Policy
We may update this privacy policy from time to time. Updates will be posted in the app
and on our GitHub repository.

## Your Rights
Since we don't collect data, there is no data to access, modify, or delete.
```

## 🚀 Quick Start Guide

### Minimum to Submit (Fast Track)
1. ✅ Create app icon (1024x1024 PNG)
2. ✅ Update bundle identifier
3. ✅ Get Apple Developer account ($99/year)
4. ✅ Take required screenshots
5. ✅ Create privacy policy (host on GitHub Pages)
6. ✅ Upload to App Store Connect
7. ✅ Fill out metadata
8. ✅ Submit for review

**Estimated time**: 2-4 hours (assuming you have developer account)

### Professional Submission (Recommended)
Include all items above PLUS:
- Professional app icon design
- Localization for English
- Comprehensive testing on real devices
- Marketing materials (website, social media presence)
- Support email/website
- Terms of Service

**Estimated time**: 1-2 weeks

## ⏱️ Timeline Estimate

- **App icon design**: 1-4 hours
- **Screenshots**: 1 hour
- **Bundle ID update**: 5 minutes
- **Privacy policy**: 30 minutes
- **App Store Connect setup**: 1 hour
- **Metadata writing**: 1-2 hours
- **Testing**: 2-4 hours
- **Upload & submission**: 30 minutes
- **Apple review wait**: 1-3 days
- **Total**: ~2-3 days of work + review time

## 📞 Next Steps

1. **Do you have Apple Developer account?**
   - If NO: Sign up at https://developer.apple.com/programs/
   - If YES: Proceed to next steps

2. **Create app icon**
   - Use design tool or hire designer
   - Must be 1024x1024 PNG

3. **Update bundle identifier in Xcode**

4. **Take screenshots** on simulators or real devices

5. **Create privacy policy** (can use template above)

6. **Upload to App Store Connect**

---

## ❓ Questions?

- Apple's App Store Review Guidelines: https://developer.apple.com/app-store/review/guidelines/
- Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/
- App Store Connect Help: https://help.apple.com/app-store-connect/

**Good luck with your submission! 🚀**
