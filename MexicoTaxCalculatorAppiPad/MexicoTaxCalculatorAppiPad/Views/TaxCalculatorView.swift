//
//  TaxCalculatorView.swift
//  MexicoTaxCalculator
//
//  Main calculator interface
//

import SwiftUI

struct TaxCalculatorView: View {
    @StateObject private var viewModel = TaxCalculatorViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    // Helper to detect iPad
    var isIPad: Bool {
        horizontalSizeClass == .regular
    }

    // Responsive font sizes
    func fontSize(_ baseSize: CGFloat) -> CGFloat {
        isIPad ? baseSize * 1.3 : baseSize
    }

    var body: some View {
        NavigationView {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.1, green: 0.2, blue: 0.45),
                        Color(red: 0.2, green: 0.3, blue: 0.6),
                        Color(red: 0.3, green: 0.4, blue: 0.7)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 8) {
                            Text("Calculadora de Impuestos")
                                .font(.system(size: fontSize(34), weight: .bold))
                                .foregroundColor(.white)

                            Text("ISR & IMSS 2026")
                                .font(.system(size: fontSize(15)))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(.top)

                        // Input Section
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Información Salarial")
                                .font(.system(size: fontSize(17), weight: .semibold))
                                .foregroundColor(.white)

                            // Salary Input
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Salario Bruto")
                                    .font(.system(size: fontSize(15)))
                                    .foregroundColor(.white.opacity(0.8))

                                HStack {
                                    Text("$")
                                        .foregroundColor(.white.opacity(0.8))
                                        .font(.system(size: fontSize(20)))

                                    ZStack(alignment: .leading) {
                                        if viewModel.salaryInput.isEmpty {
                                            Text("Ingresa cantidad")
                                                .font(.system(size: fontSize(16)))
                                                .foregroundColor(.white.opacity(0.5))
                                                .padding(.leading, 16)
                                        }
                                        TextField("", text: $viewModel.salaryInput)
                                            .keyboardType(.decimalPad)
                                            .font(.system(size: fontSize(16)))
                                            .padding()
                                            .foregroundColor(.white)
                                    }
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.white.opacity(0.15))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(.white.opacity(0.3), lineWidth: 1)
                                            )
                                    )
                                }
                            }

                            // Period Selector - Liquid Glass Style
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Período de Pago")
                                    .font(.system(size: fontSize(15)))
                                    .foregroundColor(.white.opacity(0.8))

                                // 2x2 Grid layout
                                VStack(spacing: 8) {
                                    HStack(spacing: 8) {
                                        PeriodButton(
                                            period: .monthly,
                                            isSelected: viewModel.selectedPeriod == .monthly
                                        ) {
                                            withAnimation(.spring(response: 0.3)) {
                                                viewModel.selectedPeriod = .monthly
                                            }
                                        }

                                        PeriodButton(
                                            period: .biweekly,
                                            isSelected: viewModel.selectedPeriod == .biweekly
                                        ) {
                                            withAnimation(.spring(response: 0.3)) {
                                                viewModel.selectedPeriod = .biweekly
                                            }
                                        }
                                    }

                                    HStack(spacing: 8) {
                                        PeriodButton(
                                            period: .weekly,
                                            isSelected: viewModel.selectedPeriod == .weekly
                                        ) {
                                            withAnimation(.spring(response: 0.3)) {
                                                viewModel.selectedPeriod = .weekly
                                            }
                                        }

                                        PeriodButton(
                                            period: .annual,
                                            isSelected: viewModel.selectedPeriod == .annual
                                        ) {
                                            withAnimation(.spring(response: 0.3)) {
                                                viewModel.selectedPeriod = .annual
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .opacity(0.8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(.white.opacity(0.2), lineWidth: 1.5)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                        )

                        // Results Section
                        if let result = viewModel.calculationResult {
                            VStack(spacing: 16) {
                                // Summary Cards
                                HStack(spacing: 12) {
                                    LiquidGlassSummaryCard(
                                        title: "Salario Neto",
                                        amount: result.netSalary,
                                        color: Color(red: 0.3, green: 0.9, blue: 0.6)
                                    )

                                    LiquidGlassSummaryCard(
                                        title: "Impuestos Totales",
                                        amount: result.totalDeductions,
                                        color: Color(red: 1.0, green: 0.4, blue: 0.4)
                                    )
                                }

                                // Detailed Breakdown
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Desglose de Impuestos")
                                        .font(.system(size: fontSize(17), weight: .semibold))
                                        .foregroundColor(.white)

                                    LiquidGlassTaxDetailRow(
                                        title: "ISR (Impuesto sobre la Renta)",
                                        amount: result.isrAmount,
                                        color: Color(red: 1.0, green: 0.7, blue: 0.3)
                                    )

                                    LiquidGlassTaxDetailRow(
                                        title: "IMSS (Seguro Social)",
                                        amount: result.imssAmount,
                                        color: Color(red: 0.4, green: 0.7, blue: 1.0)
                                    )

                                    Rectangle()
                                        .fill(.white.opacity(0.6))
                                        .frame(height: 1)
                                        .padding(.vertical, 8)

                                    LiquidGlassTaxDetailRow(
                                        title: "Deducciones Totales",
                                        amount: result.totalDeductions,
                                        color: Color(red: 1.0, green: 0.4, blue: 0.4),
                                        isBold: true
                                    )
                                }
                                .padding(20)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.ultraThinMaterial)
                                        .opacity(0.8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.white.opacity(0.2), lineWidth: 1.5)
                                        )
                                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                                )

                                // Tax Rates
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Tasas de Impuesto")
                                        .font(.system(size: fontSize(17), weight: .semibold))
                                        .foregroundColor(.white)

                                    HStack {
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text("Tasa Promedio")
                                                .font(.system(size: fontSize(15)))
                                                .foregroundColor(.white.opacity(0.7))
                                            Text(result.averageTaxRatePercentage)
                                                .font(.system(size: fontSize(28), weight: .semibold))
                                                .foregroundColor(.white)
                                        }

                                        Spacer()

                                        VStack(alignment: .trailing, spacing: 2) {
                                            Text("Tasa Marginal")
                                                .font(.system(size: fontSize(15)))
                                                .foregroundColor(.white.opacity(0.7))
                                            Text(result.marginalTaxRatePercentage)
                                                .font(.system(size: fontSize(28), weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .padding(20)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.ultraThinMaterial)
                                        .opacity(0.8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(.white.opacity(0.2), lineWidth: 1.5)
                                        )
                                        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                                )

                                // Tax Bracket Info
                                if let bracket = result.isrBracket {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Tu Categoría de ISR")
                                            .font(.system(size: fontSize(17), weight: .semibold))
                                            .foregroundColor(.white)

                                        VStack(alignment: .leading, spacing: 4) {
                                            HStack {
                                                Text("Rango de ingresos mensuales:")
                                                    .font(.system(size: fontSize(15)))
                                                    .foregroundColor(.white.opacity(0.7))
                                                Spacer()
                                            }

                                            if let upper = bracket.upperLimit {
                                                Text("$\(formatCurrency(bracket.lowerLimit)) - $\(formatCurrency(upper))")
                                                    .font(.system(size: fontSize(20), weight: .semibold))
                                                    .foregroundColor(.white)
                                            } else {
                                                Text("$\(formatCurrency(bracket.lowerLimit)) en adelante")
                                                    .font(.system(size: fontSize(20), weight: .semibold))
                                                    .foregroundColor(.white)
                                            }

                                            Rectangle()
                                                .fill(.white.opacity(0.3))
                                                .frame(height: 1)
                                                .padding(.vertical, 6)

                                            HStack {
                                                Text("Tasa sobre excedente:")
                                                    .font(.system(size: fontSize(15)))
                                                    .foregroundColor(.white.opacity(0.7))
                                                Spacer()
                                                Text("\(formatPercentage(bracket.percentageOnExcess))%")
                                                    .font(.system(size: fontSize(20), weight: .semibold))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                    }
                                    .padding(20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.ultraThinMaterial)
                                            .opacity(0.8)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.white.opacity(0.2), lineWidth: 1.5)
                                            )
                                            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                                    )
                                }

                                // Disclaimer
                                Text("Esta calculadora proporciona una estimación basada en las tablas de ISR 2026 y tasas del IMSS. Para cálculos oficiales, consulte con un profesional fiscal o el SAT (Servicio de Administración Tributaria).")
                                    .font(.system(size: fontSize(12)))
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(.white.opacity(0.1))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(.white.opacity(0.15), lineWidth: 1)
                                            )
                                    )
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    private func formatCurrency(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value as NSDecimalNumber) ?? "0.00"
    }

    private func formatPercentage(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value as NSDecimalNumber) ?? "0.00"
    }
}

// MARK: - Supporting Views - Liquid Glass Components

struct PeriodButton: View {
    let period: TaxCalculationResult.SalaryPeriod
    let isSelected: Bool
    let action: () -> Void
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular
    }

    var body: some View {
        Button(action: action) {
            Text(period.displayName)
                .font(.system(size: isIPad ? 19.5 : 15))
                .fontWeight(isSelected ? .semibold : .regular)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
                .padding(.vertical, isIPad ? 16 : 12)
                .padding(.horizontal, isIPad ? 12 : 8)
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        if isSelected {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white.opacity(0.25))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.white.opacity(0.4), lineWidth: 1.5)
                                )
                                .shadow(color: .white.opacity(0.3), radius: 8, x: 0, y: 4)
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.white.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(.white.opacity(0.2), lineWidth: 1)
                                )
                        }
                    }
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LiquidGlassSummaryCard: View {
    let title: String
    let amount: Decimal
    let color: Color
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: isIPad ? 19.5 : 15))
                .foregroundColor(.white.opacity(0.8))

            Text("$\(formatCurrency(amount))")
                .font(.system(size: isIPad ? 28 : 22, weight: .bold))
                .foregroundColor(color)
                .shadow(color: color.opacity(0.5), radius: 8, x: 0, y: 0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .opacity(0.8)

                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.3), lineWidth: 1.5)

                // Inner glow effect
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color.opacity(0.2),
                                Color.clear
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
        )
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
    }

    private func formatCurrency(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value as NSDecimalNumber) ?? "0.00"
    }
}

struct LiquidGlassTaxDetailRow: View {
    let title: String
    let amount: Decimal
    let color: Color
    var isBold: Bool = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular
    }

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Circle()
                    .fill(color)
                    .frame(width: isIPad ? 13 : 10, height: isIPad ? 13 : 10)
                    .shadow(color: color.opacity(0.6), radius: 4, x: 0, y: 0)

                Text(title)
                    .font(.system(size: isIPad ? 22 : 17, weight: isBold ? .bold : .regular))
                    .foregroundColor(.white)
            }

            Spacer()

            Text("$\(formatCurrency(amount))")
                .font(.system(size: isIPad ? 22 : 17, weight: isBold ? .bold : .regular))
                .foregroundColor(color)
        }
    }

    private func formatCurrency(_ value: Decimal) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: value as NSDecimalNumber) ?? "0.00"
    }
}

#Preview {
    TaxCalculatorView()
}
