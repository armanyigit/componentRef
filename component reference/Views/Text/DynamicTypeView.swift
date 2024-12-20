import SwiftUI

struct DynamicTypeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Group {
                    Text("Dynamic Type Examples")
                        .font(.largeTitle)
                    
                    Text("Large Title")
                        .font(.largeTitle)
                    
                    Text("Title 1")
                        .font(.title)
                    
                    Text("Title 2")
                        .font(.title2)
                    
                    Text("Title 3")
                        .font(.title3)
                }
                
                Group {
                    Text("Headline")
                        .font(.headline)
                    
                    Text("Subheadline")
                        .font(.subheadline)
                    
                    Text("Body")
                        .font(.body)
                    
                    Text("Callout")
                        .font(.callout)
                    
                    Text("Caption 1")
                        .font(.caption)
                    
                    Text("Caption 2")
                        .font(.caption2)
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Dynamic Type Customization")
                    .font(.headline)
                    .padding(.top)
                
                Text("This text uses custom font size with dynamic type")
                    .font(.custom("Helvetica", size: 16, relativeTo: .body))
                
                Text("This text scales with accessibility settings")
                    .dynamicTypeSize(.large)
                
                Text("This text has a maximum dynamic type size")
                    .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
            }
            .padding()
        }
    }
}

#Preview {
    DynamicTypeView()
} 