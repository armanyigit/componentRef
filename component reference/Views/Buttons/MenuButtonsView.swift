import SwiftUI

struct MenuButtonsView: View {
    @State private var selectedOption = "Option 1"
    @State private var showingSheet = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Menu Buttons")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Menu("Basic Menu") {
                    Button("Option 1") {}
                    Button("Option 2") {}
                    Button("Option 3") {}
                }
                
                Menu {
                    Button("Share...") {}
                    Button("Bookmark") {}
                    Button("Add to Favorites") {}
                } label: {
                    Label("Actions", systemImage: "ellipsis.circle")
                }
                
                Menu {
                    Button("Copy", action: {})
                    Button("Paste", action: {})
                    Divider()
                    Menu("Advanced") {
                        Button("Import...", action: {})
                        Button("Export...", action: {})
                    }
                } label: {
                    Text("Nested Menu")
                }
                
                Menu {
                    Picker("Options", selection: $selectedOption) {
                        Text("Option 1").tag("Option 1")
                        Text("Option 2").tag("Option 2")
                        Text("Option 3").tag("Option 3")
                    }
                } label: {
                    Text("Selection Menu: \(selectedOption)")
                }
                
                Text("Selected: \(selectedOption)")
                    .font(.caption)
            }
            .padding()
        }
    }
} 