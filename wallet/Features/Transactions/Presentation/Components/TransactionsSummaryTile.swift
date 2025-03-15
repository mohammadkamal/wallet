import SwiftUI

struct TransactionsSummaryTile: View {
    let label: String
    let value: Double
    let incoming: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.gray)
            Spacer()
            Text("\(incoming ? "+" : "-")EGP \(value, specifier: "%.2f")")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    TransactionsSummaryTile(label: "Today", value: 900, incoming: true)
}
