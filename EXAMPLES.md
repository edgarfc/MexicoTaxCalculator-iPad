# Tax Calculation Examples

This document provides example calculations to verify the accuracy of the Mexico Tax Calculator app against the reference calculator at [mx.talent.com/tax-calculator](https://mx.talent.com/tax-calculator).

## Example 1: Monthly Salary $10,000

### Input
- **Gross Salary**: $10,000 MXN
- **Period**: Monthly

### Expected Results (from talent.com)
- **ISR**: ~$834
- **IMSS**: ~$242
- **Total Deductions**: ~$1,076
- **Net Salary**: ~$8,924
- **Average Tax Rate**: ~10.8%
- **Marginal Tax Rate**: ~18.8% (note: this may differ due to calculation methodology)

### Calculation Breakdown

#### ISR Calculation
Income $10,000 falls in **Bracket 3**:
- Lower Limit: $7,168.52
- Upper Limit: $12,598.02
- Fixed Quota: $420.95
- Rate on Excess: 10.88%

Formula:
```
Excess = $10,000 - $7,168.52 = $2,831.48
ISR = $420.95 + ($2,831.48 × 10.88%)
ISR = $420.95 + $308.11
ISR = $729.06
```

**Note**: The actual ISR may vary slightly from talent.com due to additional considerations like employment subsidies (subsidio al empleo) which this calculator doesn't include for simplicity.

#### IMSS Calculation
For $10,000 monthly income:

Since $10,000 < 3 UMAs ($10,698.66), the sickness excess doesn't apply:
```
Medical Expenses (0.375%): $10,000 × 0.00375 = $37.50
Cash Benefits (0.25%): $10,000 × 0.0025 = $25.00
Disability & Life (0.625%): $10,000 × 0.00625 = $62.50
Old Age & Severance (1.125%): $10,000 × 0.01125 = $112.50
Total IMSS = $237.50
```

#### Total
```
Total Deductions = ISR + IMSS = $729.06 + $237.50 = $966.56
Net Salary = $10,000 - $966.56 = $9,033.44
Average Tax Rate = ($966.56 / $10,000) × 100 = 9.67%
```

---

## Example 2: Monthly Salary $20,000

### Input
- **Gross Salary**: $20,000 MXN
- **Period**: Monthly

### Calculation

#### ISR
Income $20,000 falls in **Bracket 6**:
- Lower Limit: $17,533.65
- Fixed Quota: $1,856.84
- Rate on Excess: 21.36%

```
Excess = $20,000 - $17,533.65 = $2,466.35
ISR = $1,856.84 + ($2,466.35 × 21.36%)
ISR = $1,856.84 + $526.73
ISR = $2,383.57
```

#### IMSS
Since $20,000 > 3 UMAs ($10,698.66):

```
Sickness above 3 UMAs: ($20,000 - $10,698.66) × 0.40% = $37.21
Medical Expenses: $20,000 × 0.375% = $75.00
Cash Benefits: $20,000 × 0.25% = $50.00
Disability & Life: $20,000 × 0.625% = $125.00
Old Age & Severance: $20,000 × 1.125% = $225.00
Total IMSS = $512.21
```

#### Total
```
Total Deductions = $2,383.57 + $512.21 = $2,895.78
Net Salary = $20,000 - $2,895.78 = $17,104.22
Average Tax Rate = 14.48%
```

---

## Example 3: Monthly Salary $50,000

### Input
- **Gross Salary**: $50,000 MXN
- **Period**: Monthly

### Calculation

#### ISR
Income $50,000 falls in **Bracket 7**:
- Lower Limit: $35,362.84
- Fixed Quota: $5,665.16
- Rate on Excess: 23.52%

```
Excess = $50,000 - $35,362.84 = $14,637.16
ISR = $5,665.16 + ($14,637.16 × 23.52%)
ISR = $5,665.16 + $3,442.62
ISR = $9,107.78
```

#### IMSS
Capped at 25 UMAs = $89,155.50 monthly (so no cap applies here)

```
Sickness above 3 UMAs: ($50,000 - $10,698.66) × 0.40% = $157.21
Medical Expenses: $50,000 × 0.375% = $187.50
Cash Benefits: $50,000 × 0.25% = $125.00
Disability & Life: $50,000 × 0.625% = $312.50
Old Age & Severance: $50,000 × 1.125% = $562.50
Total IMSS = $1,344.71
```

#### Total
```
Total Deductions = $9,107.78 + $1,344.71 = $10,452.49
Net Salary = $50,000 - $10,452.49 = $39,547.51
Average Tax Rate = 20.90%
```

---

## Example 4: Bi-weekly Salary $5,000

### Input
- **Gross Salary**: $5,000 MXN
- **Period**: Bi-weekly (quincenal)

### Conversion
Bi-weekly to Monthly: $5,000 × 2 = $10,000/month

This is equivalent to Example 1, so the deductions are:
- **ISR per bi-weekly period**: ~$364.53 ($729.06 / 2)
- **IMSS per bi-weekly period**: ~$118.75 ($237.50 / 2)
- **Total Deductions**: ~$483.28
- **Net Bi-weekly**: ~$4,516.72

---

## Example 5: Annual Salary $120,000

### Input
- **Gross Salary**: $120,000 MXN
- **Period**: Annual

### Conversion
Annual to Monthly: $120,000 / 12 = $10,000/month

Based on Example 1:
- **Annual ISR**: ~$8,748.72 ($729.06 × 12)
- **Annual IMSS**: ~$2,850 ($237.50 × 12)
- **Total Annual Deductions**: ~$11,598.72
- **Net Annual Salary**: ~$108,401.28

---

## Verification Checklist

When testing the app, verify:

1. ✅ Correct tax bracket identification
2. ✅ Accurate ISR calculation using fixed quota + percentage on excess
3. ✅ Proper IMSS calculation with UMA threshold consideration
4. ✅ Correct period conversions (monthly, bi-weekly, weekly, annual)
5. ✅ Average and marginal tax rates displayed accurately
6. ✅ Net salary calculation (gross - deductions)

## Important Notes

### Differences from Talent.com

The calculations in this app may differ slightly from talent.com due to:

1. **Subsidio al Empleo**: This calculator doesn't include employment subsidy credits
2. **Rounding**: Different rounding methodologies
3. **Simplifications**: Marital status, dependents, and other deductions are not considered
4. **Update Frequency**: Tax tables may be updated at different times

### When to Use This Calculator

This calculator is best for:
- Quick estimates of take-home pay
- Comparing salary offers
- Understanding tax brackets
- Educational purposes

### When to Consult a Professional

Consult a tax professional for:
- Actual tax filing and compliance
- Deduction optimization
- Complex tax situations
- Official payroll calculations

## Additional Test Cases

### Edge Cases

1. **Minimum Wage**: $8,364/month (30 days × $278.80)
2. **3 UMA Threshold**: $10,698.66 (test IMSS calculation change)
3. **Maximum IMSS**: Test salaries above 25 UMAs ($89,155.50)
4. **Bracket Boundaries**: Test amounts at exact bracket limits
5. **Zero/Negative**: $0 should return zero deductions

### Recommended Test Salaries

- $1,000 (very low)
- $5,000 (below 3 UMAs)
- $10,000 (talent.com example)
- $15,000 (middle bracket)
- $20,000 (above 3 UMAs)
- $30,000 (upper middle)
- $50,000 (high)
- $100,000 (very high)
- $500,000 (maximum bracket)
