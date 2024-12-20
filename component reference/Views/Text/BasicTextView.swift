import SwiftUI

struct BasicTextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Basic Text Example")
                .font(.largeTitle)
            
            Text("Regular text with default styling")
            
            Text("Custom font size text")
                .font(.system(size: 24))
            
            Text("Bold text")
                .bold()
            
            Text("Italic text")
                .italic()
            
            Text("Multiline text that demonstrates how SwiftUI handles longer content with automatic wrapping when needed.")
                .lineLimit(3)
            
            Text("Custom colored text")
                .foregroundColor(.blue)
        }
        .padding()
    }
}

#Preview {
    BasicTextView()
} 