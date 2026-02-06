//
//  TaxCalculationResult.swift
//  MexicoTaxCalculator
//
//  Modelo para resultados de cálculo de impuestos
//

import Foundation

struct TaxCalculationResult {
    // Entrada
    let grossSalary: Decimal
    let period: SalaryPeriod

    // ISR (Impuesto Sobre la Renta)
    let isrAmount: Decimal
    let isrBracket: TaxBracket?

    // IMSS (Seguro Social)
    let imssAmount: Decimal

    // Totales
    let totalDeductions: Decimal
    let netSalary: Decimal

    // Tasas de impuestos
    let averageTaxRate: Decimal
    let marginalTaxRate: Decimal

    enum SalaryPeriod: String, CaseIterable {
        case monthly = "Mensual"
        case biweekly = "Quincenal"
        case weekly = "Semanal"
        case annual = "Anual"

        var monthlyMultiplier: Decimal {
            switch self {
            case .monthly: return 1
            case .biweekly: return Decimal(2)
            case .weekly: return Decimal(4.33)
            case .annual: return Decimal(1) / Decimal(12)
            }
        }

        var displayName: String {
            return self.rawValue
        }
    }

    var averageTaxRatePercentage: String {
        return String(format: "%.1f%%", (averageTaxRate as NSDecimalNumber).doubleValue * 100)
    }

    var marginalTaxRatePercentage: String {
        return String(format: "%.2f%%", (marginalTaxRate as NSDecimalNumber).doubleValue * 100)
    }
}
