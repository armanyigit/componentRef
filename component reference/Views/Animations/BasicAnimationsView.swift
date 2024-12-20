import SwiftUI

struct BasicAnimationsView: View {
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Basic Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Basic Animation
                VStack {
                    Text("Basic Animation")
                        .font(.headline)
                    
                    Circle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                        .offset(x: isAnimating ? 100 : -100)
                        .animation(.default, value: isAnimating)
                }
                
                // Spring Animation
                VStack {
                    Text("Spring Animation")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 100, height: 100)
                        .scaleEffect(scale)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: scale)
                }
                
                // Rotation Animation
                VStack {
                    Text("Rotation Animation")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                        .rotationEffect(.degrees(rotation))
                        .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: rotation)
                }
                
                // Combined Animations
                VStack {
                    Text("Combined Animations")
                        .font(.headline)
                    
                    Image(systemName: "heart.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.red)
                        .scaleEffect(isAnimating ? 1.5 : 1.0)
                        .opacity(isAnimating ? 0.5 : 1.0)
                        .animation(.easeInOut(duration: 1).repeatForever(), value: isAnimating)
                }
            }
            .padding()
        }
        .onAppear {
            isAnimating = true
            scale = 1.5
            rotation = 360
        }
    }
}

#Preview {
    BasicAnimationsView()
} 