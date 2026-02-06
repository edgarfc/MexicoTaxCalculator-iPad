//
//  TaxCalculatorViewModel.swift
//  MexicoTaxCalculator
//
//  ViewModel for tax calculator
//

import Foundation
import Combine

class TaxCalculatorViewModel: ObservableObject {
    @Published var salaryInput: String = "" {
        didSet {
            calculateTaxes()
        }
    }

    @Published var selectedPeriod: TaxCalculationResult.SalaryPeriod = .monthly {
        didSet {
            calculateTaxes()
        }
    }

    @Published var calculationResult: TaxCalculationResult?

    private let taxCalculator = TaxCalculator()

    init() {
        // Set default example value
        salaryInput = "10000"
        calculateTaxes()
    }

    private func calculateTaxes() {
        // Parse salary input
        guard let salary = parseDecimal(from: salaryInput), salary > 0 else {
            calculationResult = nil
            return
        }

        // Calculate taxes
        let result = taxCalculator.calculateTaxes(grossSalary: salary, period: selectedPeriod)
        calculationResult = result
    }

    private func parseDecimal(from string: String) -> Decimal? {
        // Remove any non-numeric characters except decimal point
        let cleaned = string.replacingOccurrences(of: ",", with: "")

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")

        if let number = formatter.number(from: cleaned) {
            return Decimal(string: number.stringValue)
        }

        return Decimal(string: cleaned)
    }
}
