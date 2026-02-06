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

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 8) {
                        Text("Mexico Tax Calculator")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("ISR & IMSS Calculator 2026")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top)

                    // Input Section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Salary Information")
                            .font(.headline)

                        // Salary Input
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Gross Salary")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            HStack {
                                Text("$")
                                    .foregroundColor(.secondary)
                                TextField("Enter amount", text: $viewModel.salaryInput)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }

                        // Period Selector
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Pay Period")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Picker("Period", selection: $viewModel.selectedPeriod) {
                                ForEach(TaxCalculationResult.SalaryPeriod.allCases, id: \.self) { period in
                                    Text(period.displayName).tag(period)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                    // Results Section
                    if let result = viewModel.calculationResult {
                        VStack(spacing: 16) {
                            // Summary Cards
                            HStack(spacing: 12) {
                                SummaryCard(
                                    title: "Net Salary",
                                    amount: result.netSalary,
                                    color: .green
                                )

                                SummaryCard(
                                    title: "Total Tax",
                                    amount: result.totalDeductions,
                                    color: .red
                                )
                            }

                            // Detailed Breakdown
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Tax Breakdown")
                                    .font(.headline)

                                TaxDetailRow(
                                    title: "ISR (Income Tax)",
                                    amount: result.isrAmount,
                                    color: .orange
                                )

                                TaxDetailRow(
                                    title: "IMSS (Social Security)",
                                    amount: result.imssAmount,
                                    color: .blue
                                )

                                Divider()

                                TaxDetailRow(
                                    title: "Total Deductions",
                                    amount: result.totalDeductions,
                                    color: .red,
                                    isBold: true
                                )
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)

                            // Tax Rates
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Tax Rates")
                                    .font(.headline)

                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Average Tax Rate")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(result.averageTaxRatePercentage)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }

                                    Spacer()

                                    VStack(alignment: .trailing, spacing: 4) {
                                        Text("Marginal Tax Rate")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                        Text(result.marginalTaxRatePercentage)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)

                            // Tax Bracket Info
                            if let bracket = result.isrBracket {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Your ISR Tax Bracket")
                                        .font(.headline)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Monthly income range:")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)

                                        if let upper = bracket.upperLimit {
                                            Text("$\(formatCurrency(bracket.lowerLimit)) - $\(formatCurrency(upper))")
                                                .font(.body)
                                        } else {
                                            Text("$\(formatCurrency(bracket.lowerLimit)) and above")
                                                .font(.body)
                                        }

                                        Text("Rate on excess: \(formatPercentage(bracket.percentageOnExcess))%")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                            .padding(.top, 4)
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }

                            // Disclaimer
                            Text("This calculator provides an estimate based on 2026 ISR tax brackets and IMSS rates. For official tax calculations, consult with a tax professional or the SAT (Servicio de Administración Tributaria).")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding()
                        }
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
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

// MARK: - Supporting Views

struct SummaryCard: View {
    let title: String
    let amount: Decimal
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("$\(formatCurrency(amount))")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
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

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Circle()
                    .fill(color)
                    .frame(width: 8, height: 8)

                Text(title)
                    .font(isBold ? .body.bold() : .body)
            }

            Spacer()

            Text("$\(formatCurrency(amount))")
                .font(isBold ? .body.bold() : .body)
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
