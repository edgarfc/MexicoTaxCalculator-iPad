//
//  TaxCalculatorTests.swift
//  MexicoTaxCalculatorTests
//
//  Unit tests for tax calculations
//

import XCTest
@testable import MexicoTaxCalculator

final class TaxCalculatorTests: XCTestCase {
    var calculator: TaxCalculator!

    override func setUp() {
        super.setUp()
        calculator = TaxCalculator()
    }

    override func tearDown() {
        calculator = nil
        super.tearDown()
    }

    // MARK: - ISR Tax Bracket Tests

    func testISRFirstBracket() {
        // Test income in first bracket: $500 monthly
        let result = calculator.calculateTaxes(grossSalary: 500, period: .monthly)

        // Expected ISR: 0.00 + (500 - 0.01) × 1.92% = 9.60
        let expectedISR = Decimal(string: "9.60")!

        XCTAssertEqual(result.isrAmount.rounded(2), expectedISR,
                       "ISR for $500 should be approximately $9.60")
        XCTAssertNotNil(result.isrBracket)
        XCTAssertEqual(result.isrBracket?.lowerLimit, 0.01)
    }

    func testISRSecondBracket() {
        // Test income in second bracket: $5,000 monthly
        let result = calculator.calculateTaxes(grossSalary: 5000, period: .monthly)

        // Expected ISR: 16.22 + (5000 - 844.60) × 6.40% = 282.11
        let excess = Decimal(5000) - Decimal(string: "844.60")!
        let expectedISR = Decimal(string: "16.22")! + (excess * Decimal(string: "0.064")!)

        XCTAssertEqual(result.isrAmount.rounded(2), expectedISR.rounded(2),
                       "ISR for $5,000 should match calculated amount")
    }

    func testISRExampleFrom10000() {
        // Test the example from talent.com: $10,000 monthly
        let result = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        // According to talent.com, ISR should be approximately $834
        // This falls in bracket 3: 7,168.52 - 12,598.02
        // ISR = 420.95 + (10000 - 7168.52) × 10.88%
        let excess = Decimal(10000) - Decimal(string: "7168.52")!
        let expectedISR = Decimal(string: "420.95")! + (excess * Decimal(string: "0.1088")!)

        XCTAssertEqual(result.isrAmount.rounded(0), expectedISR.rounded(0),
                       "ISR for $10,000 should be approximately $829")
    }

    func testISRHighestBracket() {
        // Test income in highest bracket: $500,000 monthly
        let result = calculator.calculateTaxes(grossSalary: 500000, period: .monthly)

        // ISR = 133,488.54 + (500,000 - 425,642.00) × 35%
        let excess = Decimal(500000) - Decimal(string: "425642.00")!
        let expectedISR = Decimal(string: "133488.54")! + (excess * Decimal(string: "0.35")!)

        XCTAssertEqual(result.isrAmount.rounded(2), expectedISR.rounded(2),
                       "ISR for $500,000 should match highest bracket calculation")
        XCTAssertEqual(result.isrBracket?.percentageOnExcess, 35.00)
    }

    // MARK: - IMSS Tests

    func testIMSSBasicCalculation() {
        // Test IMSS for $10,000 monthly
        let result = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        // According to talent.com, IMSS should be approximately $242
        // Total should be around 2.4% for this income level
        let imssPercentage = (result.imssAmount / result.grossSalary) * 100

        XCTAssertGreaterThan(result.imssAmount, 200)
        XCTAssertLessThan(result.imssAmount, 300)
        XCTAssertGreaterThan(imssPercentage, 2.0)
        XCTAssertLessThan(imssPercentage, 3.0)
    }

    func testIMSSBelowThreeUMAs() {
        // Test IMSS for income below 3 UMAs (3 × 3,566.22 = 10,698.66)
        let result = calculator.calculateTaxes(grossSalary: 5000, period: .monthly)

        // Below 3 UMAs, sickness contribution on excess doesn't apply
        // Only medical expenses (0.375%), cash benefits (0.25%), disability (0.625%), old age (1.125%)
        // Total: 2.375%
        let expectedPercentage = Decimal(string: "2.375")! / 100
        let expectedIMSS = Decimal(5000) * expectedPercentage

        XCTAssertEqual(result.imssAmount.rounded(2), expectedIMSS.rounded(2),
                       "IMSS below 3 UMAs should be 2.375%")
    }

    func testIMSSAboveThreeUMAs() {
        // Test IMSS for income above 3 UMAs
        let result = calculator.calculateTaxes(grossSalary: 20000, period: .monthly)

        // Above 3 UMAs, additional 0.40% applies to excess
        XCTAssertGreaterThan(result.imssAmount, 0)

        // Should be between 2.375% and 2.775%
        let imssPercentage = (result.imssAmount / result.grossSalary) * 100
        XCTAssertGreaterThan(imssPercentage, 2.375)
        XCTAssertLessThanOrEqual(imssPercentage, 2.775)
    }

    // MARK: - Complete Calculation Tests

    func testCompleteTaxCalculation10000() {
        // Test complete calculation for $10,000 monthly (talent.com example)
        let result = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        // ISR: ~$834, IMSS: ~$242, Total: ~$1,076, Net: ~$8,924
        XCTAssertEqual(result.grossSalary, 10000)
        XCTAssertGreaterThan(result.isrAmount, 800)
        XCTAssertLessThan(result.isrAmount, 850)
        XCTAssertGreaterThan(result.imssAmount, 200)
        XCTAssertLessThan(result.imssAmount, 280)

        let totalDeductions = result.isrAmount + result.imssAmount
        XCTAssertGreaterThan(totalDeductions, 1050)
        XCTAssertLessThan(totalDeductions, 1100)

        let netSalary = result.grossSalary - totalDeductions
        XCTAssertGreaterThan(netSalary, 8900)
        XCTAssertLessThan(netSalary, 8950)
    }

    func testAverageTaxRate() {
        let result = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        // Average tax rate should be around 10.8% for $10,000 monthly
        let averageTaxRatePercentage = (result.averageTaxRate as NSDecimalNumber).doubleValue * 100

        XCTAssertGreaterThan(averageTaxRatePercentage, 10.0)
        XCTAssertLessThan(averageTaxRatePercentage, 12.0)
    }

    func testMarginalTaxRate() {
        let result = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        // Marginal rate should be 10.88% (bracket 3)
        let marginalTaxRatePercentage = (result.marginalTaxRate as NSDecimalNumber).doubleValue * 100

        XCTAssertEqual(marginalTaxRatePercentage, 10.88, accuracy: 0.01)
    }

    // MARK: - Period Conversion Tests

    func testBiweeklyPeriod() {
        let result = calculator.calculateTaxes(grossSalary: 5000, period: .biweekly)

        // $5,000 bi-weekly = $10,000 monthly
        let monthlyEquivalent = calculator.calculateTaxes(grossSalary: 10000, period: .monthly)

        XCTAssertEqual(result.isrAmount.rounded(2), (monthlyEquivalent.isrAmount / 2).rounded(2),
                       "Bi-weekly ISR should be half of monthly for equivalent salary")
    }

    func testWeeklyPeriod() {
        let result = calculator.calculateTaxes(grossSalary: 2500, period: .weekly)

        // $2,500 weekly × 4.33 = ~$10,825 monthly
        XCTAssertGreaterThan(result.isrAmount, 0)
        XCTAssertGreaterThan(result.imssAmount, 0)
    }

    func testAnnualPeriod() {
        let result = calculator.calculateAnnualTaxes(annualIncome: 120000)

        // $120,000 annual / 12 = $10,000 monthly
        XCTAssertEqual(result.period, .annual)
        XCTAssertEqual(result.grossSalary, 120000)
    }

    // MARK: - Edge Cases

    func testZeroSalary() {
        let result = calculator.calculateTaxes(grossSalary: 0, period: .monthly)

        XCTAssertEqual(result.isrAmount, 0)
        XCTAssertEqual(result.imssAmount, 0)
        XCTAssertEqual(result.netSalary, 0)
    }

    func testMinimumWage() {
        // Test minimum wage (general): $278.80 daily × 30 = $8,364 monthly
        let monthlyMinimum = Decimal(string: "278.80")! * 30
        let result = calculator.calculateTaxes(grossSalary: monthlyMinimum, period: .monthly)

        XCTAssertGreaterThan(result.isrAmount, 0)
        XCTAssertGreaterThan(result.imssAmount, 0)
        XCTAssertLessThan(result.netSalary, monthlyMinimum)
    }

    func testVeryHighIncome() {
        // Test very high income: $1,000,000 monthly
        let result = calculator.calculateTaxes(grossSalary: 1000000, period: .monthly)

        // Should be in highest bracket (35%)
        XCTAssertEqual(result.isrBracket?.percentageOnExcess, 35.00)
        XCTAssertGreaterThan(result.isrAmount, 100000)
    }
}

// MARK: - Helper Extensions

extension Decimal {
    func rounded(_ scale: Int) -> Decimal {
        var result = self
        var roundedValue = self
        NSDecimalRound(&roundedValue, &result, scale, .plain)
        return roundedValue
    }
}
