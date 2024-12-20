import SwiftUI

struct FullScreenCoverView: View {
    @State private var showingBasicCover = false
    @State private var showingCustomCover = false
    @State private var showingInteractiveCover = false
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
        List {
            Section("Basic Full Screen") {
                Button("Show Basic Cover") {
                    showingBasicCover.toggle()
                }
                .fullScreenCover(isPresented: $showingBasicCover) {
                    BasicFullScreenContent()
                }
            }
            
            Section("Custom Full Screen") {
                Button("Show Custom Cover") {
                    showingCustomCover.toggle()
                }
                .fullScreenCover(isPresented: $showingCustomCover) {
                    CustomFullScreenContent()
                }
            }
            
            Section("Interactive Dismissal") {
                Button("Show Interactive Cover") {
                    showingInteractiveCover.toggle()
                }
                .fullScreenCover(isPresented: $showingInteractiveCover) {
                    InteractiveFullScreenContent(isPresented: $showingInteractiveCover)
                }
            }
        }
        .navigationTitle("Full Screen Covers")
    }
}

struct BasicFullScreenContent: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                ForEach(1...20, id: \.self) { index in
                    Text("Item \(index)")
                }
            }
            .navigationTitle("Basic Cover")
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
        }
    }
}

struct CustomFullScreenContent: View {
    @Environment(\.dismiss) var dismiss
    @State private var scale = 0.8
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Custom Cover")
                    .font(.largeTitle)
                
                Image(systemName: "star.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.yellow)
                
                Button("Dismiss") {
                    withAnimation(.spring()) {
                        scale = 0.8
                        opacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        dismiss()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .scaleEffect(scale)
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.spring()) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}

struct InteractiveFullScreenContent: View {
    @Binding var isPresented: Bool
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        ZStack {
            Color.purple.opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Text("Drag Down to Dismiss")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Image(systemName: "arrow.down.circle.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.purple)
                    .opacity(isDragging ? 1.0 : 0.5)
                    .scaleEffect(isDragging ? 1.2 : 1.0)
                    .animation(.spring(), value: isDragging)
                
                Spacer()
            }
        }
        .offset(y: offset.height)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    isDragging = true
                    if gesture.translation.height > 0 {
                        offset = gesture.translation
                    }
                }
                .onEnded { gesture in
                    isDragging = false
                    if gesture.translation.height > 100 {
                        withAnimation {
                            isPresented = false
                        }
                    } else {
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

#Preview {
    NavigationView {
        FullScreenCoverView()
    }
} 