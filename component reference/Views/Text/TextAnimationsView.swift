import SwiftUI

struct TextAnimationsView: View {
    @State private var isAnimating = false
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var rotation: Double = 0
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Text Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Scale Animation
                VStack {
                    Text("Scale Animation")
                        .font(.headline)
                    
                    Text("Tap me!")
                        .font(.title)
                        .scaleEffect(scale)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5)) {
                                scale = scale == 1.0 ? 1.5 : 1.0
                            }
                        }
                }
                
                // Opacity Animation
                VStack {
                    Text("Opacity Animation")
                        .font(.headline)
                    
                    Text("Fade In/Out")
                        .font(.title)
                        .opacity(opacity)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                opacity = opacity == 1.0 ? 0.2 : 1.0
                            }
                        }
                }
                
                // Rotation Animation
                VStack {
                    Text("Rotation Animation")
                        .font(.headline)
                    
                    Text("Spin me!")
                        .font(.title)
                        .rotationEffect(.degrees(rotation))
                        .onTapGesture {
                            withAnimation(.linear(duration: 1)) {
                                rotation += 360
                            }
                        }
                }
                
                // Slide Animation
                VStack {
                    Text("Slide Animation")
                        .font(.headline)
                    
                    Text("Slide me!")
                        .font(.title)
                        .offset(x: offset)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                offset = offset == 0 ? 100 : 0
                            }
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    TextAnimationsView()
} 