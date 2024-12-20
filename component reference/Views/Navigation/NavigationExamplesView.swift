import SwiftUI

struct DetailView: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 200)
            
            Text("Detail View for \(title)")
                .font(.headline)
            
            Text("This is a detail view demonstrating navigation.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
        .navigationTitle(title)
    }
}

struct SidebarItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let color: Color
    let icon: String
}

struct NavigationExamplesView: View {
    @State private var selectedItem: SidebarItem?
    @State private var showingSheet = false
    @State private var path = NavigationPath()
    
    let items = [
        SidebarItem(title: "Dashboard", color: .blue, icon: "square.grid.2x2"),
        SidebarItem(title: "Profile", color: .purple, icon: "person.circle"),
        SidebarItem(title: "Settings", color: .orange, icon: "gear"),
        SidebarItem(title: "Help", color: .green, icon: "questionmark.circle")
    ]
    
    var body: some View {
        NavigationSplitView {
            // Sidebar
            List(items, selection: $selectedItem) { item in
                NavigationLink(value: item) {
                    Label(item.title, systemImage: item.icon)
                }
            }
            .navigationTitle("Navigation")
        } detail: {
            // Detail View
            NavigationStack(path: $path) {
                if let selectedItem {
                    DetailView(title: selectedItem.title, color: selectedItem.color)
                        .toolbar {
                            ToolbarItem(placement: .primaryAction) {
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    Image(systemName: "info.circle")
                                }
                            }
                        }
                } else {
                    ContentUnavailableView(
                        "Select an Item",
                        systemImage: "sidebar.left",
                        description: Text("Choose an item from the sidebar to view its details.")
                    )
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                List {
                    Section("Navigation Features") {
                        Text("• Navigation Split View")
                        Text("• Navigation Stack")
                        Text("• Navigation Links")
                        Text("• Toolbar Items")
                        Text("• Sheets")
                        Text("• Sidebar")
                    }
                }
                .navigationTitle("Info")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            showingSheet = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationExamplesView()
} 