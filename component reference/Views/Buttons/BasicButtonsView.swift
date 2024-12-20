import SwiftUI

struct BasicButtonsView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Button Examples")
                .font(.largeTitle)
                .padding(.bottom)
            
            // Standard button
            Button("Standard Button") {
                count += 1
            }
            
            // Button with custom colors
            Button(action: { count += 1 }) {
                Text("Custom Color Button")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            // Icon button
            Button(action: { count += 1 }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
            }
            
            // Button with icon and text
            Button(action: { count += 1 }) {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Like")
                }
                .padding()
                .background(Color.pink.opacity(0.2))
                .cornerRadius(10)
            }
            
            Text("Count: \(count)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    BasicButtonsView()
} 