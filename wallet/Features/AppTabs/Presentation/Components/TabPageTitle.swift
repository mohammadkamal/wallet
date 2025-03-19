import SwiftUI

struct TabPageTitle: View {
    let tab: AppTab
    
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

#Preview {
    TabPageTitle(tab: AppTab.home)
}
