import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            CurrentBalance()
                .padding(.bottom)
            HStack(alignment: .center, spacing: 30) {
                AddMoneyButton()
                SendMoneyButton()
                InsightsButton()
            }
            .padding(.bottom)
            LatestTransactionsView()
        }
    }
}

#Preview {
    HomeView()
}
