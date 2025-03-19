import SwiftUI

struct AppTabsView: View {
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTabIndex) {
                ForEach(AppTab.allCases, id: \.self) { tab in
                    Tab(tab.label, systemImage: tab.iconName, value: tab.rawValue) {
                        tab.view
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing])
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TabPageTitle(tab: AppTab(rawValue: selectedTabIndex) ?? AppTab.home)
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

#Preview {
    AppTabsView()
}
