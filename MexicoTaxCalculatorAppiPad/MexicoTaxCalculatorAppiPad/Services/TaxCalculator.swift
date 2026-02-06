//
//  TaxCalculator.swift
//  MexicoTaxCalculator
//
//  Servicio principal de cálculo de impuestos para ISR e IMSS de México
//

import Foundation

class TaxCalculator {
    /// Calcula impuestos basados en el salario bruto y período
    func calculateTaxes(grossSalary: Decimal, period: TaxCalculationResult.SalaryPeriod) -> TaxCalculationResult {
        // Convertir salario a cantidad mensual para el cálculo
        let monthlySalary = grossSalary * period.monthlyMultiplier

        // Calcular ISR (Impuesto Sobre la Renta)
        let (isrAmount, bracket) = calculateISR(monthlyIncome: monthlySalary)

        // Calcular IMSS (Seguro Social)
        let imssAmount = calculateIMSS(monthlyIncome: monthlySalary)

        // Calcular totales
        let totalDeductions = isrAmount + imssAmount
        let netSalary = grossSalary - (totalDeductions / period.monthlyMultiplier)

        // Calcular tasas de impuestos
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

    /// Calcula ISR (Impuesto Sobre la Renta)
    /// Fórmula: ISR = Cuota Fija + (Cantidad Excedente × Tasa Porcentual)
    /// Donde cantidad excedente = ingreso gravable - límite inferior del rango
    private func calculateISR(monthlyIncome: Decimal) -> (amount: Decimal, bracket: TaxBracket?) {
        guard let bracket = TaxBracket.findBracket(for: monthlyIncome) else {
            return (0, nil)
        }

        // Calcular excedente sobre el límite inferior
        let excess = monthlyIncome - bracket.lowerLimit

        // Aplicar fórmula: Cuota Fija + (Excedente × Tasa Porcentual / 100)
        let isrAmount = bracket.fixedQuota + (excess * (bracket.percentageOnExcess / 100))

        return (max(isrAmount, 0), bracket)
    }

    /// Calcula IMSS (Instituto Mexicano del Seguro Social)
    /// La aportación del trabajador es aproximadamente 2.775% del salario bruto
    /// Componentes:
    /// - Enfermedades y Maternidad (varía según umbral de UMA)
    /// - Invalidez y Vida: 0.625%
    /// - Cesantía y Vejez: 1.125%
    private func calculateIMSS(monthlyIncome: Decimal) -> Decimal {
        // Calcular SBC (Salario Base de Cotización)
        // Por simplicidad, usamos el ingreso mensual como SBC
        let sbc = monthlyIncome

        // Limitar SBC al máximo (25 UMAs mensuales)
        let maxSBC = IMSSConstants.umaMonthly2026 * 25
        let cappedSBC = min(sbc, maxSBC)

        var totalIMSS: Decimal = 0

        // 1. Enfermedades y Maternidad
        // Solo aplica a ingresos arriba de 3 UMAs
        let threeUMAs = IMSSConstants.umaMonthly2026 * 3
        if cappedSBC > threeUMAs {
            let excessOverThreeUMAs = cappedSBC - threeUMAs
            totalIMSS += excessOverThreeUMAs * IMSSConstants.EmployeeRates.sicknessAboveThreeUMAs
        }

        // Gastos médicos para pensionados (0.375%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.medicalExpensesPensioners

        // Prestaciones en dinero (0.25%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.cashBenefits

        // 2. Invalidez y Vida (0.625%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.disabilityAndLife

        // 3. Cesantía y Vejez (1.125%)
        totalIMSS += cappedSBC * IMSSConstants.EmployeeRates.oldAgeAndSeverance

        return totalIMSS
    }

    /// Calcula impuestos anuales para un ingreso anual dado
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
