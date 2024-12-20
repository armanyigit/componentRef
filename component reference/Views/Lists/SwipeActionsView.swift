import SwiftUI

struct SwipeActionsView: View {
    @State private var items = [
        ListItem(title: "Item 1", subtitle: "Swipe me left or right"),
        ListItem(title: "Item 2", subtitle: "Try different actions"),
        ListItem(title: "Item 3", subtitle: "More swipe options")
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text(item.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        if let index = items.firstIndex(where: { $0.id == item.id }) {
                            items.remove(at: index)
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    
                    Button {
                        // Archive action
                    } label: {
                        Label("Archive", systemImage: "archivebox")
                    }
                    .tint(.orange)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        // Pin action
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.blue)
                    
                    Button {
                        // Flag action
                    } label: {
                        Label("Flag", systemImage: "flag")
                    }
                    .tint(.purple)
                }
            }
        }
        .navigationTitle("Swipe Actions")
    }
} 