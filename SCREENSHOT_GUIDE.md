# App Store Screenshot Guide

## Required Screenshot Sizes

### iPhone Screenshots
- **6.7" Display** (iPhone 15 Pro Max): 1290 × 2796 pixels
- **6.5" Display** (iPhone 14 Plus): 1284 × 2778 pixels
- Minimum: 3 screenshots, Maximum: 10 screenshots

### iPad Screenshots
- **12.9" Display** (iPad Pro 12.9"): 2048 × 2732 pixels (Portrait)
- **12.9" Display** (iPad Pro 12.9"): 2732 × 2048 pixels (Landscape)
- Minimum: 3 screenshots, Maximum: 10 screenshots

---

## Step-by-Step Instructions

### 1. Open Project in Xcode

```bash
cd /Users/eaflores/claude-sandbox/MexicoTaxCalculator-ipad
open MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad.xcodeproj
```

### 2. Select Simulator Device

In Xcode toolbar (top), click the device selector and choose:

#### For iPhone Screenshots:
- **iPhone 15 Pro Max** (6.7" - 1290 × 2796)

#### For iPad Screenshots:
- **iPad Pro (12.9-inch) (6th generation)** (2048 × 2732)

### 3. Build and Run

1. Click the **Play** button (▶️) in Xcode toolbar
2. Wait for simulator to launch and app to open
3. App will display with your new liquid glass design

### 4. Prepare Sample Scenarios

#### Screenshot 1: Default/Welcome State
- Use salary: **$15,000** (monthly)
- Period: **Mensual**
- Shows mid-range salary calculation

#### Screenshot 2: High Salary
- Use salary: **$50,000** (monthly)
- Period: **Mensual**
- Shows higher tax bracket

#### Screenshot 3: Biweekly Example
- Use salary: **$7,500**
- Period: **Quincenal**
- Shows biweekly calculation

#### Screenshot 4: Weekly Example
- Use salary: **$3,500**
- Period: **Semanal**
- Shows weekly calculation

#### Screenshot 5: Annual View
- Use salary: **$180,000**
- Period: **Anual**
- Shows annual calculation

### 5. Take Screenshots

#### Method 1: Using Simulator (Easiest)
1. With simulator active, press: **⌘ + S** (Command + S)
2. Screenshot saves to Desktop automatically
3. Name format: `Simulator Screenshot - Device Name - Date.png`

#### Method 2: Using Xcode
1. Debug → Take Screenshot (while simulator is running)
2. Screenshot appears in Xcode console
3. Right-click → Save Image As...

#### Method 3: Screenshot Toolbar
1. In Simulator menu: **File → New Screen Recording** (or **⌘ + R**)
2. Take individual frames from recording

### 6. Verify Screenshot Dimensions

After taking screenshots, verify dimensions:

```bash
# Check image dimensions
sips -g pixelWidth -g pixelHeight screenshot.png
```

Expected outputs:
- iPhone 15 Pro Max: 1290 × 2796
- iPad Pro 12.9": 2048 × 2732 (Portrait) or 2732 × 2048 (Landscape)

### 7. Organize Screenshots

Move screenshots to project folder:

```bash
# Create directories
mkdir -p screenshots/appstore/iphone
mkdir -p screenshots/appstore/ipad

# Move iPhone screenshots
mv ~/Desktop/*iPhone*.png screenshots/appstore/iphone/

# Move iPad screenshots
mv ~/Desktop/*iPad*.png screenshots/appstore/ipad/
```

### 8. Rename for Clarity

Use descriptive names:
- `01-iphone-monthly-15k.png`
- `02-iphone-high-salary-50k.png`
- `03-iphone-biweekly.png`
- `01-ipad-monthly-15k.png`
- `02-ipad-landscape.png`

---

## 🎨 Screenshot Tips for Best Results

### Composition
1. **Use the liquid glass design fully**
   - Show the gradient background
   - Ensure all glass effects are visible
   - Good lighting in the simulator

2. **Fill in realistic data**
   - Use different salary amounts
   - Show all pay period options
   - Display complete tax breakdown

3. **Highlight key features**
   - Tax breakdown with colored indicators
   - ISR and IMSS calculations
   - Tax rates (average and marginal)
   - Tax bracket information

### What to Show in Each Screenshot

**Screenshot 1** - Main Interface
- Clean, complete calculation
- Salary input filled
- All result cards visible
- Period selector showing "Mensual"

**Screenshot 2** - Different Period
- Show "Quincenal" selected
- Different salary amount
- Emphasize the period selector buttons

**Screenshot 3** - Tax Breakdown
- Scroll to show tax breakdown section clearly
- Highlight ISR and IMSS values
- Show colored indicators

**Screenshot 4** - Tax Rates
- Focus on average and marginal rates
- Show percentage values clearly

**Screenshot 5** - Tax Bracket Info (Optional)
- Show bracket information section
- Display income range
- Show rate on excess

### iPad-Specific Tips

1. **Take both orientations**
   - Portrait mode (vertical)
   - Landscape mode (horizontal)

2. **Rotate simulator**
   - Hardware → Rotate Left (⌘ + ←)
   - Hardware → Rotate Right (⌘ + →)

3. **Show the spacious layout**
   - Demonstrate iPad optimization
   - Show how content uses the larger screen

---

## 📱 Quick Command Reference

### Open Project
```bash
open MexicoTaxCalculatorAppiPad/MexicoTaxCalculatorAppiPad.xcodeproj
```

### Take Screenshot in Simulator
- **Keyboard**: ⌘ + S

### Rotate Simulator
- **Rotate Left**: ⌘ + ←
- **Rotate Right**: ⌘ + →

### Check Image Size
```bash
sips -g pixelWidth -g pixelHeight filename.png
```

### Resize if Needed (not recommended - use correct simulator)
```bash
sips -z 2796 1290 input.png --out output.png
```

---

## ✅ Checklist

### iPhone Screenshots
- [ ] Open iPhone 15 Pro Max simulator
- [ ] Take screenshot with $15,000 monthly
- [ ] Take screenshot with $50,000 monthly
- [ ] Take screenshot with biweekly period
- [ ] Take screenshot showing different features
- [ ] Verify all are 1290 × 2796 pixels
- [ ] Save to screenshots/appstore/iphone/

### iPad Screenshots
- [ ] Open iPad Pro 12.9" simulator
- [ ] Take portrait screenshot with example
- [ ] Take landscape screenshot
- [ ] Take screenshot showing tax breakdown
- [ ] Take screenshot with different periods
- [ ] Verify all are 2048 × 2732 or 2732 × 2048
- [ ] Save to screenshots/appstore/ipad/

### Organization
- [ ] All screenshots renamed descriptively
- [ ] Organized in correct folders
- [ ] Dimensions verified
- [ ] Ready for App Store Connect upload

---

## 🎯 Final Check

Before uploading to App Store Connect:

1. ✅ Minimum 3 screenshots per device type
2. ✅ Correct dimensions (no resizing/cropping)
3. ✅ Shows app's best features
4. ✅ Professional appearance
5. ✅ Liquid glass design clearly visible
6. ✅ No personal/sensitive information visible
7. ✅ Spanish text clearly readable
8. ✅ File format: PNG or JPEG

---

## 📤 Next Steps

After taking screenshots:
1. Review each screenshot for quality
2. Select 3-5 best screenshots per device
3. Order them (best first)
4. Upload to App Store Connect
5. Add localized descriptions for each screenshot (optional)

**Estimated Time**: 1-2 hours for complete screenshot set

Good luck! Your liquid glass design will look amazing in the App Store! 🚀
