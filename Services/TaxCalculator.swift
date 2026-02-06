//
//  TaxCalculator.swift
//  MexicoTaxCalculator
//
//  Main tax calculation service for Mexican ISR and IMSS
//

import Foundation

class TaxCalculator {
    /// Calculate taxes based on gross salary and period
    func calculateTaxes(grossSalary: Decimal, period: TaxCalculationResult.SalaryPeriod) -> TaxCalculationResult {
        // Convert salary to monthly amount for calculation
        let monthlySalary = grossSalary * period.monthlyMultiplier

        // Calculate ISR (Income Tax)
        let (isrAmount, bracket) = calculateISR(monthlyIncome: monthlySalary)

        // Calculate IMSS (Social Security)
        let imssAmount = calculateIMSS(monthlyIncome: monthlySalary)

        // Calculate totals
        let totalDeductions = isrAmount + imssAmount
        let netSalary = grossSalary - (totalDeductions / period.monthlyMultiplier)

        // Calculate tax rates
        let averageTaxRate = grossSalary > 0 ? totalDeductions / monthlySalary : 0
        let marginalTaxRate = bracket?.percentageOnExcess ?? 0

        return TaxCalculationResult(
            grossSalary: grossSalary,
            period: period,
            isrAmount: isrAmount / period.monthlyMultiplier,
            isrBracket: bracket,
            imssAmount: imssAmount / period.monthlyMultiplier,
            totalDeductions: totalDeductions / period.monthlyMultiplier,
            netSalary: netSalary,
            averageTaxRate: averageTaxRate,
            marginalTaxRate: marginalTaxRate / 100
        )
    }

    /// Calculate ISR (Impuesto Sobre la Renta) - Income Tax
    /// Formula: ISR = Fixed Quota + (Excess Amount × Percentage Rate)
    /// Where excess amount = taxable income - lower bracket limit
    private func calculateISR(monthlyIncome: Decimal) -> (amount: Decimal, bracket: TaxBracket?) {
        guard let bracket = TaxBracket.findBracket(for: monthlyIncome) else {
            return (0, nil)
        }

        // Calculate excess over lower limit
        let excess = monthlyIncome - bracket.lowerLimit

        // Apply formula: Fixed Quota + (Excess × Percentage Rate / 100)
        let isrAmount = bracket.fixedQuota + (excess * (bracket.percentageOnExcess / 100))

        return (max(isrAmount, 0), bracket)
    }

    /// Calculate IMSS (Instituto Mexicano del Seguro Social) - Social Security
    /// Employee contribution is approximately 2.775% of gross salary
    /// Components:
    /// - Sickness and Maternity (varies based on UMA threshold)
    /// - Disability and Life: 0.625%
    /// - Old Age and Severance: 1.125%
    private func calculateIMSS(monthlyIncome: Decimal) -> Decimal {
        // Calculate SBC (Salario Base de Cotización)
        // For simplicity, we use the monthly income as SBC
        let sbc = monthlyIncome

        // Cap SBC at maximum (25 UMAs monthly)
        let maxSBC = IMSSConstants.umaMonthly2026 * 25
        let cappedSBC = min(sbc, maxSBC)

        var totalIMSS: Decimal = 0

        // 1. Sickness and Maternity (Enfermedades y Maternidad)
        // Only applies to income above 3 UMAs
        let threeUMAs = IMSSConstants.umaMonthly2026 * 3
        if cappedSBC > threeUMAs {
            let excessOverThreeUMAs = cappedSBC - threeUMAs
            totalIMSS += excessOverThreeUMAs * IMSSConstants.EmployeeRates.sicknessAboveThreeUMAs
        }

        // Medical expenses for pensioners (0.375%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.medicalExpensesPensioners

        // Cash benefits (0.25%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.cashBenefits

        // 2. Disability and Life (0.625%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.disabilityAndLife

        // 3. Old Age and Severance (1.125%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.oldAgeAndSeverance

        return totalIMSS
    }

    /// Calculate annual tax for a given annual income
    func calculateAnnualTaxes(annualIncome: Decimal) -> TaxCalculationResult {
        let monthlyIncome = annualIncome / 12
        let result = calculateTaxes(grossSalary: monthlyIncome, period: .monthly)

        return TaxCalculationResult(
            grossSalary: annualIncome,
            period: .annual,
            isrAmount: result.isrAmount * 12,
            isrBracket: result.isrBracket,
            imssAmount: result.imssAmount * 12,
            totalDeductions: result.totalDeductions * 12,
            netSalary: result.netSalary * 12,
            averageTaxRate: result.averageTaxRate,
            marginalTaxRate: result.marginalTaxRate
        )
    }
}
