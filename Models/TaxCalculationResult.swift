//
//  TaxCalculationResult.swift
//  MexicoTaxCalculator
//
//  Model for tax calculation results
//

import Foundation

struct TaxCalculationResult {
    // Input
    let grossSalary: Decimal
    let period: SalaryPeriod

    // ISR (Income Tax)
    let isrAmount: Decimal
    let isrBracket: TaxBracket?

    // IMSS (Social Security)
    let imssAmount: Decimal

    // Totals
    let totalDeductions: Decimal
    let netSalary: Decimal

    // Tax rates
    let averageTaxRate: Decimal
    let marginalTaxRate: Decimal

    enum SalaryPeriod: String, CaseIterable {
        case monthly = "Monthly"
        case biweekly = "Bi-weekly"
        case weekly = "Weekly"
        case annual = "Annual"

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
