import SwiftUI

struct AppTabsView: View {
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTabIndex) {
                Tab("Home", systemImage: "house", value: AppTabs.home.rawValue){
                    HomeView()
                }
                Tab("Transactions", systemImage: "arrow.left.arrow.right", value: AppTabs.transactions.rawValue) {
                    Text("")
                }
                Tab("My Cards", systemImage: "creditcard", value: AppTabs.myCards.rawValue) {
                    Text("")
                }
                Tab("More", systemImage: "square.grid.2x2", value: AppTabs.more.rawValue) {
                    Text("")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing])
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TabPageTitle(tab: AppTabs(rawValue: selectedTabIndex) ?? AppTabs.home)
                }
                if(selectedTabIndex != 3)
                {
                    ToolbarItem(placement: .topBarTrailing) {
                        ProfileIcon()
                    }
                }
            }
        }
    }
}

private struct TabPageTitle: View {
    let tab: AppTabs
    
    var body: some View {
        switch tab {
        case .home:
            Text("Home").font(.title)
        case .transactions:
            Text("Transactions").font(.title)
        case .myCards:
            Text("My Cards").font(.title)
        case .more:
            Text("More").font(.title)
        }
    }
}

private enum AppTabs: Int {
    case home
    case transactions
    case myCards
    case more
}

#Preview {
    AppTabsView()
}
