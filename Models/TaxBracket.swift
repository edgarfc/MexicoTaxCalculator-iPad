//
//  TaxBracket.swift
//  MexicoTaxCalculator
//
//  ISR Tax Bracket Model for 2026
//

import Foundation

struct TaxBracket {
    let lowerLimit: Decimal
    let upperLimit: Decimal?
    let fixedQuota: Decimal
    let percentageOnExcess: Decimal

    /// ISR Monthly Tax Brackets for 2026
    /// Source: Anexo 8 de la Resolución Miscelánea Fiscal 2026
    static let monthlyBrackets2026: [TaxBracket] = [
        TaxBracket(lowerLimit: 0.01, upperLimit: 844.59, fixedQuota: 0.00, percentageOnExcess: 1.92),
        TaxBracket(lowerLimit: 844.60, upperLimit: 7168.51, fixedQuota: 16.22, percentageOnExcess: 6.40),
        TaxBracket(lowerLimit: 7168.52, upperLimit: 12598.02, fixedQuota: 420.95, percentageOnExcess: 10.88),
        TaxBracket(lowerLimit: 12598.03, upperLimit: 14644.64, fixedQuota: 1011.68, percentageOnExcess: 16.00),
        TaxBracket(lowerLimit: 14644.65, upperLimit: 17533.64, fixedQuota: 1339.14, percentageOnExcess: 17.92),
        TaxBracket(lowerLimit: 17533.65, upperLimit: 35362.83, fixedQuota: 1856.84, percentageOnExcess: 21.36),
        TaxBracket(lowerLimit: 35362.84, upperLimit: 55736.68, fixedQuota: 5665.16, percentageOnExcess: 23.52),
        TaxBracket(lowerLimit: 55736.69, upperLimit: 106410.50, fixedQuota: 10457.09, percentageOnExcess: 30.00),
        TaxBracket(lowerLimit: 106410.51, upperLimit: 141880.66, fixedQuota: 25659.23, percentageOnExcess: 32.00),
        TaxBracket(lowerLimit: 141880.67, upperLimit: 425641.99, fixedQuota: 37009.69, percentageOnExcess: 34.00),
        TaxBracket(lowerLimit: 425642.00, upperLimit: nil, fixedQuota: 133488.54, percentageOnExcess: 35.00)
    ]

    /// Find the appropriate tax bracket for a given monthly income
    static func findBracket(for monthlyIncome: Decimal) -> TaxBracket? {
        return monthlyBrackets2026.first { bracket in
            if let upper = bracket.upperLimit {
                return monthlyIncome >= bracket.lowerLimit && monthlyIncome <= upper
            } else {
                return monthlyIncome >= bracket.lowerLimit
            }
        }
    }
}
