import SwiftUI

struct AppTabsView: View {
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTabIndex) {
                ForEach(AppTabs.allCases, id: \.self) { tab in
                    Tab(tab.label, systemImage: tab.iconName, value: tab.rawValue) {
                        tab.view
                    }
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

private enum AppTabs: Int, CaseIterable {
    case home
    case transactions
    case myCards
    case more
    
    var label: String {
        switch self {
        case .home:
            return "Home"
        case .transactions:
            return "Transactions"
        case .myCards:
            return "My Cards"
        case .more:
            return "More"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .transactions:
            return "arrow.left.arrow.right"
        case .myCards:
            return "creditcard"
        case .more:
            return "square.grid.2x2"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .home:
            HomeView()
        case .transactions:
            TransactionsView()
        case .myCards:
            CardsView()
        case .more:
            Text("More")
        }
    }
}

#Preview {
    AppTabsView()
}
