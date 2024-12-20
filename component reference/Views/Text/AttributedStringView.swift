import SwiftUI

struct AttributedStringView: View {
    var attributedText: AttributedString {
        var string = AttributedString("Styled Text Example\n")
        string.foregroundColor = .blue
        string.font = .title.bold()
        
        let subtitle = AttributedString("\nThis text demonstrates various attributes:\n\n")
        string += subtitle
        
        var colored = AttributedString("Colored Text ")
        colored.foregroundColor = .red
        string += colored
        
        var sized = AttributedString("Different Sizes ")
        sized.font = .title2
        string += sized
        
        var custom = AttributedString("Custom Style")
        custom.backgroundColor = .yellow
        custom.foregroundColor = .black
        string += custom
        
        return string
    }
    
    private var linkText: AttributedString = {
        try! AttributedString(markdown: "Visit [Apple's website](https://www.apple.com)")
    }()
    
    private var dateText: AttributedString = {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        var dateString = AttributedString(formatter.string(from: date))
        dateString.foregroundColor = .blue
        return dateString
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(attributedText)
                    .padding()
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Link Example")
                        .font(.headline)
                    Text(linkText)
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Date Formatting Example")
                        .font(.headline)
                    Text(dateText)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    AttributedStringView()
} 