import SwiftUICore

enum AppTab: Int, CaseIterable {
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
