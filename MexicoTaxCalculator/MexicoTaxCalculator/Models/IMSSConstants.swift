//
//  IMSSConstants.swift
//  MexicoTaxCalculator
//
//  Constantes del IMSS (Instituto Mexicano del Seguro Social) para 2026
//

import Foundation

struct IMSSConstants {
    /// Valores de UMA (Unidad de Medida y Actualización) para 2026
    static let umaDaily2026: Decimal = 117.31
    static let umaMonthly2026: Decimal = 3566.22

    /// Tasas de Aportación del Trabajador al IMSS (2026)
    struct EmployeeRates {
        // Enfermedades y Maternidad
        static let sicknessFixedQuota: Decimal = 0.00 / 100
        static let sicknessAboveThreeUMAs: Decimal = 0.40 / 100
        static let medicalExpensesPensioners: Decimal = 0.375 / 100
        static let cashBenefits: Decimal = 0.25 / 100

        // Invalidez y Vida
        static let disabilityAndLife: Decimal = 0.625 / 100

        // Cesantía y Vejez
        static let oldAgeAndSeverance: Decimal = 1.125 / 100

        // Total aproximado de aportación del trabajador
        static let totalApproximate: Decimal = 2.775 / 100
    }

    /// SBC Máximo (Salario Base de Cotización) para 2026
    /// Máximo = 25 UMAs
    static let maxDailySBC: Decimal = umaDaily2026 * 25

    /// Salario mínimo 2026 (varía por región)
    /// ZLFN (Zona Libre de la Frontera Norte): $419.88
    /// General: $278.80
    static let minimumWageGeneral2026: Decimal = 278.80
    static let minimumWageBorder2026: Decimal = 419.88
}
