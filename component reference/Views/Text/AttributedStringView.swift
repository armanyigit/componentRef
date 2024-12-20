import SwiftUI

struct AttributedStringView: View {
    var attributedText: AttributedString {
        var string = AttributedString("Attributed String Examples\n")
        string.font = .title.bold()
        string.foregroundColor = .blue
        
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
    
    var markdownText: AttributedString {
        try! AttributedString(markdown: """
            # Markdown Support
            
            - **Bold text**
            - *Italic text*
            - ***Bold and italic***
            - [A link](https://www.apple.com)
            - `Code style`
            """)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text(attributedText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                Text(markdownText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Date Formatting")
                        .font(.headline)
                    
                    let formattedDate: Text = {
                        let date = Date()
                        let formatter = DateFormatter()
                        formatter.dateStyle = .full
                        var dateString = AttributedString(formatter.string(from: date))
                        dateString.foregroundColor = .blue
                        return Text(dateString)
                    }()
                    
                    formattedDate
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("AttributedString")
    }
}

#Preview {
    NavigationView {
        AttributedStringView()
    }
} 