//
//  TaxCalculatorView.swift
//  MexicoTaxCalculator
//
//  Interfaz principal de la calculadora
//

import SwiftUI

struct TaxCalculatorView: View {
    @StateObject private var viewModel = TaxCalculatorViewModel()
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    if isIPad {
                        // iPad Layout: Two columns
                        let horizontalPadding: CGFloat = 32
                        let columnSpacing: CGFloat = 24
                        let availableWidth = geometry.size.width - (horizontalPadding * 2) - columnSpacing
                        let leftColumnWidth = availableWidth * 0.38
                        let rightColumnWidth = availableWidth * 0.62

                        HStack(alignment: .top, spacing: columnSpacing) {
                            // Left column: Input section
                            VStack(spacing: 24) {
                                headerView
                                inputSection
                            }
                            .frame(width: leftColumnWidth)

                            // Right column: Results
                            if viewModel.calculationResult != nil {
                                resultsSection
                                    .frame(width: rightColumnWidth)
                            } else {
                                placeholderView
                                    .frame(width: rightColumnWidth)
                            }
                        }
                        .padding(.horizontal, horizontalPadding)
                        .padding(.vertical, 24)
                    } else {
                        // iPhone Layout: Single column
                        VStack(spacing: 24) {
                            headerView
                            inputSection

                            if viewModel.calculationResult != nil {
                                resultsSection
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }

    // MARK: - Header
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("Calculadora de Impuestos")
                .font(isIPad ? .system(size: 36, weight: .bold) : .largeTitle)
                .fontWeight(.bold)

            Text("Calculadora ISR e IMSS 2026")
                .font(isIPad ? .title3 : .subheadline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: isIPad ? .leading : .center)
        .padding(.top, isIPad ? 8 : 0)
    }

    // MARK: - Input Section
    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Información Salarial")
                .font(isIPad ? .title2 : .headline)
                .fontWeight(.semibold)

            // Entrada de salario
            VStack(alignment: .leading, spacing: 10) {
                Text("Salario Bruto")
                    .font(isIPad ? .body : .subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 8) {
                    Text("$")
                        .font(isIPad ? .title3 : .body)
                        .foregroundColor(.secondary)
                        .frame(width: 20)

                    TextField("Ingresa la cantidad", text: $viewModel.salaryInput)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(isIPad ? .title3 : .body)
                }
            }

            // Selector de período
            VStack(alignment: .leading, spacing: 10) {
                Text("Período de Pago")
                    .font(isIPad ? .body : .subheadline)
                    .foregroundColor(.secondary)

                Picker("Período", selection: $viewModel.selectedPeriod) {
                    ForEach(TaxCalculationResult.SalaryPeriod.allCases, id: \.self) { period in
                        Text(period.displayName).tag(period)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .font(isIPad ? .body : .subheadline)
            }
        }
        .padding(isIPad ? 24 : 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }

    // MARK: - Placeholder View
    private var placeholderView: some View {
        VStack(spacing: 16) {
            Image(systemName: "calculator.fill")
                .font(.system(size: 60))
                .foregroundColor(.secondary.opacity(0.5))

            Text("Ingresa un salario para calcular")
                .font(.title3)
                .foregroundColor(.secondary)

            Text("Los resultados aparecerán aquí")
                .font(.subheadline)
                .foregroundColor(.secondary.opacity(0.7))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
    }

    // MARK: - Results Section
    private var resultsSection: some View {
        Group {
            if let result = viewModel.calculationResult {
                VStack(spacing: isIPad ? 20 : 16) {
                    // Tarjetas resumen
                    if isIPad {
                        VStack(spacing: 16) {
                            SummaryCard(
                                title: "Salario Neto",
                                amount: result.netSalary,
                                color: .green,
                                isIPad: isIPad
                            )

                            SummaryCard(
                                title: "Total de Impuestos",
                                amount: result.totalDeductions,
                                color: .red,
                                isIPad: isIPad
                            )
                        }
                    } else {
                        HStack(spacing: 12) {
                            SummaryCard(
                                title: "Salario Neto",
                                amount: result.netSalary,
                                color: .green,
                                isIPad: isIPad
                            )

                            SummaryCard(
                                title: "Total de Impuestos",
                                amount: result.totalDeductions,
                                color: .red,
                                isIPad: isIPad
                            )
                        }
                    }

                    // Desglose detallado
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Desglose de Impuestos")
                            .font(isIPad ? .title2 : .headline)
                            .fontWeight(.semibold)

                        TaxDetailRow(
                            title: "ISR (Impuesto Sobre la Renta)",
                            amount: result.isrAmount,
                            color: .orange,
                            isIPad: isIPad
                        )

                        TaxDetailRow(
                            title: "IMSS (Seguro Social)",
                            amount: result.imssAmount,
                            color: .blue,
                            isIPad: isIPad
                        )

                        Divider()
                            .padding(.vertical, 4)

                        TaxDetailRow(
                            title: "Total de Deducciones",
                            amount: result.totalDeductions,
                            color: .red,
                            isBold: true,
                            isIPad: isIPad
                        )
                    }
                    .padding(isIPad ? 24 : 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    // Tasas de impuestos
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Tasas de Impuestos")
                            .font(isIPad ? .title2 : .headline)
                            .fontWeight(.semibold)

                        HStack(spacing: isIPad ? 32 : 16) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Tasa Promedio")
                                    .font(isIPad ? .body : .subheadline)
                                    .foregroundColor(.secondary)
                                Text(result.averageTaxRatePercentage)
                                    .font(isIPad ? .system(size: 32, weight: .semibold) : .title2)
                                    .fontWeight(.semibold)
                            }

                            Spacer()

                            VStack(alignment: .trailing, spacing: 6) {
                                Text("Tasa Marginal")
                                    .font(isIPad ? .body : .subheadline)
                                    .foregroundColor(.secondary)
                                Text(result.marginalTaxRatePercentage)
                                    .font(isIPad ? .system(size: 32, weight: .semibold) : .title2)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .padding(isIPad ? 24 : 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(16)

                    // Información del rango de ISR
                    if let bracket = result.isrBracket {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Tu Rango de ISR")
                                .font(isIPad ? .title2 : .headline)
                                .fontWeight(.semibold)

                            VStack(alignment: .leading, spacing: 6) {
                                Text("Rango de ingreso mensual:")
                                    .font(isIPad ? .body : .subheadline)
                                    .foregroundColor(.secondary)

                                if let upper = bracket.upperLimit {
                                    Text("$\(formatCurrency(bracket.lowerLimit)) - $\(formatCurrency(upper))")
                                        .font(isIPad ? .title3 : .body)
                                        .fontWeight(.medium)
                                } else {
                                    Text("$\(formatCurrency(bracket.lowerLimit)) en adelante")
                                        .font(isIPad ? .title3 : .body)
                                        .fontWeight(.medium)
                                }

                                Text("Tasa sobre excedente: \(formatPercentage(bracket.percentageOnExcess))%")
                                    .font(isIPad ? .body : .subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 6)
                            }
                        }
                        .padding(isIPad ? 24 : 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                    }

                    // Aviso legal
                    Text("Esta calculadora proporciona una estimación basada en las tablas de ISR 2026 y tasas de IMSS. Para cálculos fiscales oficiales, consulte con un profesional fiscal o el SAT (Servicio de Administración Tributaria).")
                        .font(isIPad ? .footnote : .caption)
                        .foregroundColor(.secondary)
                        .padding(isIPad ? 16 : 12)
                        .multilineTextAlignment(.leading)
                }
            }
        }
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

// MARK: - Vistas de soporte

struct SummaryCard: View {
    let title: String
    let amount: Decimal
    let color: Color
    var isIPad: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: isIPad ? 12 : 8) {
            HStack {
                Image(systemName: iconName)
                    .font(isIPad ? .title2 : .title3)
                    .foregroundColor(color)

                Text(title)
                    .font(isIPad ? .title3 : .subheadline)
                    .foregroundColor(.secondary)
            }

            Text("$\(formatCurrency(amount))")
                .font(isIPad ? .system(size: 36, weight: .bold) : .title2)
                .fontWeight(.bold)
                .foregroundColor(color)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(isIPad ? 24 : 16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
    }

    private var iconName: String {
        switch title {
        case "Salario Neto":
            return "dollarsign.circle.fill"
        case "Total de Impuestos":
            return "chart.pie.fill"
        default:
            return "dollarsign.circle"
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

struct TaxDetailRow: View {
    let title: String
    let amount: Decimal
    let color: Color
    var isBold: Bool = false
    var isIPad: Bool = false

    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: isIPad ? 12 : 8) {
                Circle()
                    .fill(color)
                    .frame(width: isIPad ? 10 : 8, height: isIPad ? 10 : 8)

                Text(title)
                    .font(isBold ? (isIPad ? .title3.bold() : .body.bold()) : (isIPad ? .title3 : .body))
            }

            Spacer()

            Text("$\(formatCurrency(amount))")
                .font(isBold ? (isIPad ? .title3.bold() : .body.bold()) : (isIPad ? .title3 : .body))
                .foregroundColor(color)
        }
        .padding(.vertical, isIPad ? 4 : 2)
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
