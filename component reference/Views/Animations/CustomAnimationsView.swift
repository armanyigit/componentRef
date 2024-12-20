import SwiftUI

struct CustomAnimationsView: View {
    @State private var isAnimating = false
    @State private var showingPath = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Custom Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Custom Timing Curve
                VStack {
                    Text("Custom Timing")
                        .font(.headline)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                        .offset(x: isAnimating ? 150 : -150)
                        .animation(
                            .timingCurve(0.68, -0.6, 0.32, 1.6),
                            value: isAnimating
                        )
                }
                
                // Keyframe Animation
                VStack {
                    Text("Keyframe Animation")
                        .font(.headline)
                    
                    Circle()
                        .fill(.green)
                        .frame(width: 50, height: 50)
                        .modifier(KeyframeAnimationModifier(isAnimating: isAnimating))
                }
                
                // Path Animation
                VStack {
                    Text("Path Animation")
                        .font(.headline)
                    
                    ZStack {
                        Circle()
                            .stroke(.gray.opacity(0.2), lineWidth: 2)
                            .frame(width: 200, height: 200)
                        
                        Circle()
                            .fill(.purple)
                            .frame(width: 20, height: 20)
                            .offset(x: showingPath ? 100 : 0)
                            .rotationEffect(.degrees(showingPath ? 360 : 0))
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: showingPath)
                    }
                }
                
                Button("Animate") {
                    isAnimating.toggle()
                    showingPath.toggle()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct KeyframeAnimationModifier: AnimatableModifier {
    var isAnimating: Bool
    
    var animatableData: CGFloat {
        get { isAnimating ? 1 : 0 }
        set { _ = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? 2 : 1)
            .opacity(isAnimating ? 0.5 : 1)
            .offset(y: isAnimating ? 100 : 0)
            .animation(.easeInOut(duration: 1), value: isAnimating)
    }
}

#Preview {
    CustomAnimationsView()
} 