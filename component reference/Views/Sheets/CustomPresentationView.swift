import SwiftUI

struct CustomPresentationView: View {
    @State private var showingSheet = false
    @State private var selectedDetent: PresentationDetent = .medium
    @State private var showingMultiple = false
    @State private var showingCustomDetent = false
    
    var body: some View {
        List {
            Section("Presentation Detents") {
                Button("Show Sheet with Detents") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    DetentSheetContent(selectedDetent: $selectedDetent)
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }
            }
            
            Section("Multiple Presentations") {
                Button("Show Multiple Sheets") {
                    showingMultiple.toggle()
                }
                .sheet(isPresented: $showingMultiple) {
                    MultipleSheetContent()
                }
            }
            
            Section("Custom Detents") {
                Button("Show Custom Detents") {
                    showingCustomDetent.toggle()
                }
                .sheet(isPresented: $showingCustomDetent) {
                    CustomDetentContent()
                        .presentationDetents([
                            .height(100),
                            .fraction(0.5),
                            .large
                        ])
                }
            }
        }
        .navigationTitle("Custom Presentations")
    }
}

struct DetentSheetContent: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedDetent: PresentationDetent
    
    var body: some View {
        NavigationView {
            List {
                Section("Current Detent") {
                    Text(selectedDetent == .medium ? "Medium" : "Large")
                }
                
                Section("Content") {
                    ForEach(1...20, id: \.self) { index in
                        Text("Item \(index)")
                    }
                }
            }
            .navigationTitle("Detent Sheet")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct MultipleSheetContent: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingSecondSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("First Sheet")
                    .font(.largeTitle)
                
                Button("Show Second Sheet") {
                    showingSecondSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showingSecondSheet) {
                    SecondSheetContent()
                }
            }
            .navigationTitle("Multiple Sheets")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct SecondSheetContent: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingThirdSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Second Sheet")
                    .font(.largeTitle)
                
                Button("Show Third Sheet") {
                    showingThirdSheet.toggle()
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showingThirdSheet) {
                    ThirdSheetContent()
                }
            }
            .navigationTitle("Second Sheet")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct ThirdSheetContent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Third Sheet")
                    .font(.largeTitle)
            }
            .navigationTitle("Third Sheet")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct CustomDetentContent: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Detents")
                .font(.headline)
            
            Text("• Height: 100pt")
            Text("• Fraction: 0.5")
            Text("• Large")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        CustomPresentationView()
    }
} 