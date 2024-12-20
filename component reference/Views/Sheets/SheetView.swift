import SwiftUI

struct SheetView: View {
    @State private var showingSheet = false
    @State private var showingFullScreenCover = false
    @State private var showingCustomSheet = false
    @State private var detent: PresentationDetent = .medium
    
    var body: some View {
        List {
            Section("Basic Sheets") {
                Button("Show Regular Sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SheetContent(title: "Regular Sheet")
                }
                
                Button("Show Full Screen Cover") {
                    showingFullScreenCover.toggle()
                }
                .fullScreenCover(isPresented: $showingFullScreenCover) {
                    FullScreenContent()
                }
            }
            
            Section("Custom Sheets") {
                Button("Show Custom Sheet") {
                    showingCustomSheet.toggle()
                }
                .sheet(isPresented: $showingCustomSheet) {
                    SheetContent(title: "Custom Sheet")
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                        .presentationCornerRadius(30)
                }
            }
        }
        .navigationTitle("Sheets")
    }
}

struct SheetContent: View {
    @Environment(\.dismiss) var dismiss
    let title: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct FullScreenContent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack {
                Text("Full Screen Content")
                    .font(.largeTitle)
                
                Button("Dismiss") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    NavigationView {
        SheetView()
    }
} 