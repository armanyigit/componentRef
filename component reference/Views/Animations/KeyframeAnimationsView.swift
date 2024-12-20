import SwiftUI

struct KeyframeAnimationsView: View {
    @State private var phase = 0.0
    @State private var isAnimating = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Keyframe Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Basic Keyframe
                VStack {
                    Text("Basic Keyframe")
                        .font(.headline)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 50, height: 50)
                        .modifier(KeyframeAnimationSequence(phase: phase))
                }
                
                // Multiple Properties
                VStack {
                    Text("Multiple Properties")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 100, height: 100)
                        .modifier(MultiPropertyKeyframe(isAnimating: isAnimating))
                }
                
                // Repeating Sequence
                VStack {
                    Text("Repeating Sequence")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                        .modifier(RepeatingKeyframe(isAnimating: isAnimating))
                }
                
                Button(isAnimating ? "Stop Animation" : "Start Animation") {
                    withAnimation {
                        isAnimating.toggle()
                        if isAnimating {
                            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                                phase = 1.0
                            }
                        } else {
                            phase = 0.0
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

struct KeyframeAnimationSequence: AnimatableModifier {
    var phase: Double
    
    var animatableData: Double {
        get { phase }
        set { phase = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: sin(phase * .pi * 2) * 100)
            .scaleEffect(1 + sin(phase * .pi * 4) * 0.2)
    }
}

struct MultiPropertyKeyframe: AnimatableModifier {
    var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(
                isAnimating ? .degrees(360) : .degrees(0),
                axis: (x: 1, y: 1, z: 0)
            )
            .scaleEffect(isAnimating ? 1.5 : 1)
            .opacity(isAnimating ? 0.5 : 1)
            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),
                      value: isAnimating)
    }
}

struct RepeatingKeyframe: ViewModifier {
    var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? 1.5 : 1)
            .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
            .offset(y: isAnimating ? -50 : 0)
            .animation(
                .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true),
                value: isAnimating
            )
    }
}

#Preview {
    KeyframeAnimationsView()
} 