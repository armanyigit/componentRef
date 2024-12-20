import SwiftUI

struct PopoverItem: Identifiable {
    let id = UUID()
    let title: String
}

struct PopoverView: View {
    @State private var showingPopover = false
    @State private var showingCustomPopover = false
    @State private var selectedItem: PopoverItem?
    
    let items = [
        PopoverItem(title: "Item 1"),
        PopoverItem(title: "Item 2"),
        PopoverItem(title: "Item 3")
    ]
    
    var body: some View {
        List {
            Section("Basic Popovers") {
                Button("Show Popover") {
                    showingPopover.toggle()
                }
                .popover(isPresented: $showingPopover) {
                    PopoverContent()
                }
            }
            
            Section("Custom Popovers") {
                Button("Show Custom Popover") {
                    showingCustomPopover.toggle()
                }
                .popover(isPresented: $showingCustomPopover) {
                    CustomPopoverContent()
                        .presentationCompactAdaptation(.popover)
                }
            }
            
            Section("Item Selection") {
                ForEach(items) { item in
                    Text(item.title)
                        .popover(item: $selectedItem) { item in
                            ItemDetailPopover(item: item.title)
                        }
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }
        }
        .navigationTitle("Popovers")
    }
}

struct PopoverContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Popover Content")
                .font(.headline)
            
            Text("This is a basic popover with some content.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct CustomPopoverContent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
                .font(.system(size: 50))
                .foregroundColor(.yellow)
            
            Text("Custom Popover")
                .font(.headline)
            
            Button("Dismiss") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

struct ItemDetailPopover: View {
    let item: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Details for \(item)")
                .font(.headline)
            
            Text("This is a detailed view for the selected item.")
                .multilineTextAlignment(.center)
        }
        .frame(width: 300, height: 200)
        .padding()
    }
}

#Preview {
    NavigationView {
        PopoverView()
    }
} 