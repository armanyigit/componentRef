import SwiftUI

struct CollectionItem: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let icon: String
}

struct CollectionView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 16)
    ]
    
    let items = [
        CollectionItem(title: "Photos", color: .blue, icon: "photo"),
        CollectionItem(title: "Videos", color: .purple, icon: "video"),
        CollectionItem(title: "Music", color: .pink, icon: "music.note"),
        CollectionItem(title: "Documents", color: .orange, icon: "doc"),
        CollectionItem(title: "Downloads", color: .green, icon: "arrow.down.circle"),
        CollectionItem(title: "Favorites", color: .red, icon: "star"),
        CollectionItem(title: "Shared", color: .blue, icon: "person.2"),
        CollectionItem(title: "Recent", color: .gray, icon: "clock")
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items) { item in
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(item.color.opacity(0.2))
                            .overlay(
                                Image(systemName: item.icon)
                                    .font(.system(size: 30))
                                    .foregroundColor(item.color)
                            )
                            .frame(height: 120)
                        
                        Text(item.title)
                            .font(.headline)
                    }
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Collection View")
    }
}

#Preview {
    NavigationView {
        CollectionView()
    }
} 