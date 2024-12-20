import SwiftUI

struct SpringAnimationsView: View {
    @State private var offset: CGFloat = -100
    @State private var scale: CGFloat = 0.5
    @State private var rotation: Double = 0
    @State private var showingControls = false
    
    @State private var response: Double = 0.5
    @State private var dampingFraction: Double = 0.5
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Spring Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Animation Preview
                VStack {
                    Text("Animation Preview")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                        .offset(x: offset)
                        .scaleEffect(scale)
                        .rotationEffect(.degrees(rotation))
                        .animation(.spring(
                            response: response,
                            dampingFraction: dampingFraction
                        ), value: offset)
                }
                
                // Controls
                VStack(spacing: 20) {
                    Text("Controls")
                        .font(.headline)
                    
                    VStack {
                        Text("Response: \(response, specifier: "%.2f")")
                        Slider(value: $response, in: 0.1...2)
                    }
                    
                    VStack {
                        Text("Damping: \(dampingFraction, specifier: "%.2f")")
                        Slider(value: $dampingFraction, in: 0.1...1)
                    }
                    
                    Button("Animate") {
                        offset = offset == -100 ? 100 : -100
                        scale = scale == 0.5 ? 1.5 : 0.5
                        rotation = rotation == 0 ? 180 : 0
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                // Presets
                VStack(spacing: 15) {
                    Text("Presets")
                        .font(.headline)
                    
                    Button("Bouncy") {
                        response = 0.5
                        dampingFraction = 0.5
                    }
                    
                    Button("Smooth") {
                        response = 0.8
                        dampingFraction = 0.8
                    }
                    
                    Button("Elastic") {
                        response = 0.7
                        dampingFraction = 0.3
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SpringAnimationsView()
} 