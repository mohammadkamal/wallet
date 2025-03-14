import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                CurrentBalance()
                    .padding(.bottom)
                HStack {
                    AddMoneyButton()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Home")
                        .font(.title)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    ProfileIcon()
                }
            }
            
        }
    }
}

#Preview {
    HomeView()
}
