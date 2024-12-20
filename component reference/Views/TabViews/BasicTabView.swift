import SwiftUI

struct BasicTabView: View {
    @State private var selectedTab = 0
    @State private var badgeCount = 3
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeTab()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            FavoritesTab()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
                .tag(1)
                .badge(badgeCount)
            
            SettingsTab()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
    }
}

struct HomeTab: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct FavoritesTab: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...5, id: \.self) { index in
                    Text("Favorite \(index)")
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct SettingsTab: View {
    var body: some View {
        NavigationView {
            List {
                Section("Account") {
                    Text("Profile")
                    Text("Security")
                }
                Section("Preferences") {
                    Text("Notifications")
                    Text("Appearance")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    BasicTabView()
} 