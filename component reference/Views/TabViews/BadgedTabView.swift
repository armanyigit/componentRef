import SwiftUI

struct BadgedTabView: View {
    @State private var selectedTab = 0
    @State private var notifications = 5
    @State private var messages = 3
    @State private var updates = 12
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NotificationsTab(count: $notifications)
                .tabItem {
                    Label("Notifications", systemImage: "bell.fill")
                }
                .tag(0)
                .badge(notifications)
            
            MessagesTab(count: $messages)
                .tabItem {
                    Label("Messages", systemImage: "message.fill")
                }
                .tag(1)
                .badge(messages)
            
            UpdatesTab(count: $updates)
                .tabItem {
                    Label("Updates", systemImage: "arrow.triangle.2.circlepath")
                }
                .tag(2)
                .badge("New")
        }
    }
}

struct NotificationsTab: View {
    @Binding var count: Int
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<count, id: \.self) { index in
                    Text("Notification \(index + 1)")
                }
                .onDelete { indexSet in
                    count -= indexSet.count
                }
            }
            .navigationTitle("Notifications")
            .toolbar {
                Button("Clear All") {
                    count = 0
                }
            }
        }
    }
}

struct MessagesTab: View {
    @Binding var count: Int
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<count, id: \.self) { index in
                    Text("Message \(index + 1)")
                }
                .onDelete { indexSet in
                    count -= indexSet.count
                }
            }
            .navigationTitle("Messages")
        }
    }
}

struct UpdatesTab: View {
    @Binding var count: Int
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<count, id: \.self) { index in
                    Text("Update \(index + 1)")
                }
                .onDelete { indexSet in
                    count -= indexSet.count
                }
            }
            .navigationTitle("Updates")
        }
    }
}

#Preview {
    BadgedTabView()
} 