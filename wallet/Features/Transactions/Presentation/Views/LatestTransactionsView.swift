import SwiftUI

struct LatestTransactionsView: View {
    var body: some View {
        ScrollView {
            VStack {
                TransactionsSummaryTile(label: "Today", value: 900, incoming: true)
                TransactionTile()
                TransactionTile()
                TransactionsSummaryTile(label: "Yesterday", value: 600, incoming: false)
                TransactionTile()
                TransactionTile()
            }
        }
    }
}

#Preview {
    LatestTransactionsView()
}
