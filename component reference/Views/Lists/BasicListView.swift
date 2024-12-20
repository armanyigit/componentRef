import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
}

struct BasicListView: View {
    @State private var items = [
        ListItem(title: "First Item", subtitle: "Description 1"),
        ListItem(title: "Second Item", subtitle: "Description 2"),
        ListItem(title: "Third Item", subtitle: "Description 3")
    ]
    
    var body: some View {
        List {
            Section(header: Text("Basic Items")) {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Section(header: Text("Interactive Items")) {
                ForEach(items) { item in
                    NavigationLink(destination: Text(item.title)) {
                        VStack(alignment: .leading) {
                            Text(item.title)
                            Text(item.subtitle)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .navigationTitle("List Examples")
    }
}

#Preview {
    NavigationView {
        BasicListView()
    }
} 