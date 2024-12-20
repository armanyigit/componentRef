import SwiftUI

struct FormattedTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Text Formatting Examples")
                .font(.largeTitle)
                .padding(.bottom)
            
            Text("Combined **bold** and *italic* text")
            
            Text("Custom spacing").tracking(5)
            
            Text("Underlined text")
                .underline()
            
            Text("Strikethrough text")
                .strikethrough()
            
            Text("Gradient text")
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .purple],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
        .padding()
    }
}

#Preview {
    FormattedTextView()
} 