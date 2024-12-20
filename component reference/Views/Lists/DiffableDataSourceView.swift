import SwiftUI

struct CategoryItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let category: String
}

struct DiffableDataSourceView: View {
    @State private var items: [CategoryItem] = [
        CategoryItem(title: "Apple", category: "Fruits"),
        CategoryItem(title: "Banana", category: "Fruits"),
        CategoryItem(title: "Carrot", category: "Vegetables"),
        CategoryItem(title: "Broccoli", category: "Vegetables"),
        CategoryItem(title: "Chicken", category: "Meat"),
        CategoryItem(title: "Beef", category: "Meat")
    ]
    
    @State private var searchText = ""
    @State private var selectedCategory: String?
    
    var categories: [String] {
        Array(Set(items.map { $0.category })).sorted()
    }
    
    var filteredItems: [CategoryItem] {
        items.filter { item in
            let matchesSearch = searchText.isEmpty || item.title.localizedCaseInsensitiveContains(searchText)
            let matchesCategory = selectedCategory == nil || item.category == selectedCategory
            return matchesSearch && matchesCategory
        }
    }
    
    var body: some View {
        List {
            Section {
                Picker("Category", selection: $selectedCategory) {
                    Text("All").tag(Optional<String>.none)
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(Optional(category))
                    }
                }
                .pickerStyle(.menu)
            }
            
            ForEach(categories, id: \.self) { category in
                Section(header: Text(category)) {
                    ForEach(filteredItems.filter { $0.category == category }) { item in
                        Text(item.title)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Diffable Data")
        .toolbar {
            Button("Shuffle") {
                withAnimation {
                    items.shuffle()
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        DiffableDataSourceView()
    }
} 