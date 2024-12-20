import SwiftUI

struct ProgrammableTabView: View {
    @State private var selectedTab = 0
    @State private var tabs = [
        ProgrammableTab(title: "Home", icon: "house", isEnabled: true),
        ProgrammableTab(title: "Search", icon: "magnifyingglass", isEnabled: true),
        ProgrammableTab(title: "Profile", icon: "person", isEnabled: false)
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ForEach(tabs.indices, id: \.self) { index in
                    if tabs[index].isEnabled {
                        Text(tabs[index].title)
                            .tabItem {
                                Label(tabs[index].title, systemImage: tabs[index].icon)
                            }
                            .tag(index)
                    }
                }
            }
            
            List {
                ForEach($tabs) { $tab in
                    Toggle(tab.title, isOn: $tab.isEnabled)
                }
            }
            .frame(height: 200)
        }
    }
}

struct ProgrammableTab: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
    var isEnabled: Bool
}

#Preview {
    ProgrammableTabView()
} 