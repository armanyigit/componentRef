import SwiftUI

struct SectionItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
}

struct SectionListView: View {
    let sections = [
        (header: "First Section", items: [
            SectionItem(title: "Item 1", subtitle: "Description 1"),
            SectionItem(title: "Item 2", subtitle: "Description 2"),
            SectionItem(title: "Item 3", subtitle: "Description 3")
        ]),
        (header: "Second Section", items: [
            SectionItem(title: "Item 4", subtitle: "Description 4"),
            SectionItem(title: "Item 5", subtitle: "Description 5"),
            SectionItem(title: "Item 6", subtitle: "Description 6")
        ])
    ]
    
    var body: some View {
        List {
            ForEach(sections, id: \.header) { section in
                Section(header: Text(section.header)) {
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
    }
}

#Preview {
    SectionListView()
} 