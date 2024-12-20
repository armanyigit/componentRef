import SwiftUI

struct ListSection: Identifiable {
    let id = UUID()
    let title: String
    let items: [ListItem]
}

struct SectionListView: View {
    @State private var sections = [
        ListSection(title: "Fruits", items: [
            ListItem(title: "Apple", subtitle: "Red and sweet"),
            ListItem(title: "Banana", subtitle: "Yellow and creamy"),
            ListItem(title: "Orange", subtitle: "Citrus delight")
        ]),
        ListSection(title: "Vegetables", items: [
            ListItem(title: "Carrot", subtitle: "Orange and crunchy"),
            ListItem(title: "Broccoli", subtitle: "Green and healthy"),
            ListItem(title: "Tomato", subtitle: "Red and juicy")
        ])
    ]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.title)) {
                    ForEach(section.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .navigationTitle("Sectioned List")
    }
} 