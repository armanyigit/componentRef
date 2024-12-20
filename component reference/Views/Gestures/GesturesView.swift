import SwiftUI

struct GesturesView: View {
    @State private var tapCount = 0
    @State private var isLongPressing = false
    @State private var offset = CGSize.zero
    @State private var rotation = Angle.zero
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Tap Gesture
                VStack {
                    Text("Tap Gesture")
                        .font(.headline)
                    
                    Text("Taps: \(tapCount)")
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .onTapGesture {
                            tapCount += 1
                        }
                }
                
                // Long Press Gesture
                VStack {
                    Text("Long Press Gesture")
                        .font(.headline)
                    
                    Circle()
                        .fill(isLongPressing ? Color.green : Color.blue)
                        .frame(width: 100, height: 100)
                        .scaleEffect(isLongPressing ? 1.5 : 1.0)
                        .animation(.spring(), value: isLongPressing)
                        .onLongPressGesture(minimumDuration: 1) {
                            isLongPressing.toggle()
                        }
                }
                
                // Drag Gesture
                VStack {
                    Text("Drag Gesture")
                        .font(.headline)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.purple.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .offset(offset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    offset = gesture.translation
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        offset = .zero
                                    }
                                }
                        )
                }
                
                // Rotation Gesture
                VStack {
                    Text("Rotation Gesture")
                        .font(.headline)
                    
                    Image(systemName: "arrow.up")
                        .font(.system(size: 50))
                        .rotationEffect(rotation)
                        .gesture(
                            RotationGesture()
                                .onChanged { angle in
                                    rotation = angle
                                }
                        )
                }
                
                // Magnification Gesture
                VStack {
                    Text("Magnification Gesture")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.yellow)
                        .scaleEffect(scale)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = value
                                }
                                .onEnded { _ in
                                    withAnimation {
                                        scale = 1.0
                                    }
                                }
                        )
                }
            }
            .padding()
        }
        .navigationTitle("Gestures")
    }
}

#Preview {
    NavigationView {
        GesturesView()
    }
} 