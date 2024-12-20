import SwiftUI

struct RefreshableItem: Identifiable {
    let id = UUID()
    let title: String
    let timestamp: Date
}

struct PullToRefreshView: View {
    @State private var items: [RefreshableItem] = []
    @State private var isLoading = false
    
    func loadItems() {
        items = (1...10).map { index in
            RefreshableItem(
                title: "Item \(index)",
                timestamp: Date()
            )
        }
    }
    
    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.timestamp, style: .relative)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .refreshable {
            // Simulate network delay
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            loadItems()
        }
        .overlay(Group {
            if items.isEmpty {
                ContentUnavailableView(
                    "Pull to Load Items",
                    systemImage: "arrow.down",
                    description: Text("Pull down to load the initial items")
                )
            }
        })
        .navigationTitle("Pull to Refresh")
    }
}

#Preview {
    NavigationView {
        PullToRefreshView()
    }
} 