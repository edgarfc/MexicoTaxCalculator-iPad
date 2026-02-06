//
//  TaxCalculatorViewModel.swift
//  MexicoTaxCalculator
//
//  ViewModel para la calculadora de impuestos
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
        // Start with empty input - user enters their own salary
    }

    private func calculateTaxes() {
        // Procesa la entrada de salario
        guard let salary = parseDecimal(from: salaryInput), salary > 0 else {
            calculationResult = nil
            return
        }

        // Calcula impuestos
        let result = taxCalculator.calculateTaxes(grossSalary: salary, period: selectedPeriod)
        calculationResult = result
    }

    private func parseDecimal(from string: String) -> Decimal? {
        // Elimina caracteres no numéricos excepto punto decimal
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
