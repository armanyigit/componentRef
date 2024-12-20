import SwiftUI

struct PathAnimationsView: View {
    @State private var progress: CGFloat = 0
    @State private var isAnimating = false
    
    let path = Path { path in
        path.move(to: CGPoint(x: 50, y: 50))
        path.addCurve(
            to: CGPoint(x: 300, y: 50),
            control1: CGPoint(x: 100, y: 0),
            control2: CGPoint(x: 250, y: 100)
        )
        path.addLine(to: CGPoint(x: 300, y: 200))
        path.addCurve(
            to: CGPoint(x: 50, y: 200),
            control1: CGPoint(x: 250, y: 150),
            control2: CGPoint(x: 100, y: 250)
        )
        path.closeSubpath()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Path Animations")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Path Drawing
                VStack {
                    Text("Path Drawing")
                        .font(.headline)
                    
                    path
                        .trim(from: 0, to: progress)
                        .stroke(.blue, lineWidth: 3)
                        .animation(.easeInOut(duration: 2), value: progress)
                }
                .frame(height: 300)
                
                // Moving Along Path
                VStack {
                    Text("Moving Along Path")
                        .font(.headline)
                    
                    ZStack {
                        Circle()
                            .stroke(.gray.opacity(0.2), lineWidth: 2)
                            .frame(width: 200, height: 200)
                        
                        Circle()
                            .fill(.red)
                            .frame(width: 20, height: 20)
                            .offset(x: cos(isAnimating ? .pi * 2 : 0) * 100,
                                    y: sin(isAnimating ? .pi * 2 : 0) * 100)
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false),
                                     value: isAnimating)
                    }
                }
                
                // Controls
                VStack(spacing: 20) {
                    Button("Draw Path") {
                        progress = progress == 0 ? 1 : 0
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(isAnimating ? "Stop Animation" : "Start Animation") {
                        isAnimating.toggle()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
            .onAppear {
                isAnimating = true
            }
        }
    }
}

#Preview {
    PathAnimationsView()
} 