//
//  IMSSConstants.swift
//  MexicoTaxCalculator
//
//  IMSS (Instituto Mexicano del Seguro Social) Constants for 2026
//

import Foundation

struct IMSSConstants {
    /// UMA (Unidad de Medida y Actualización) values for 2026
    static let umaDaily2026: Decimal = 117.31
    static let umaMonthly2026: Decimal = 3566.22

    /// Employee IMSS Contribution Rates (2026)
    struct EmployeeRates {
        // Enfermedades y Maternidad (Sickness and Maternity)
        static let sicknessFixedQuota: Decimal = 0.00 / 100
        static let sicknessAboveThreeUMAs: Decimal = 0.40 / 100
        static let medicalExpensesPensioners: Decimal = 0.375 / 100
        static let cashBenefits: Decimal = 0.25 / 100

        // Invalidez y Vida (Disability and Life)
        static let disabilityAndLife: Decimal = 0.625 / 100

        // Cesantía y Vejez (Old Age and Severance)
        static let oldAgeAndSeverance: Decimal = 1.125 / 100

        // Total approximate employee contribution
        static let totalApproximate: Decimal = 2.775 / 100
    }

    /// Maximum SBC (Salario Base de Cotización) for 2026
    /// Maximum = 25 UMAs
    static let maxDailySBC: Decimal = umaDaily2026 * 25

    /// Minimum wage 2026 (varies by region)
    /// ZLFN (Zona Libre de la Frontera Norte): $419.88
    /// General: $278.80
    static let minimumWageGeneral2026: Decimal = 278.80
    static let minimumWageBorder2026: Decimal = 419.88
}
