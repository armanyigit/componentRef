import SwiftUI

struct DynamicTypeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30) {
                Text("Dynamic Type Examples")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Default Text Styles")
                        .font(.headline)
                    
                    Text("Large Title")
                        .font(.largeTitle)
                    
                    Text("Title")
                        .font(.title)
                    
                    Text("Title 2")
                        .font(.title2)
                    
                    Text("Title 3")
                        .font(.title3)
                    
                    Text("Headline")
                        .font(.headline)
                    
                    Text("Subheadline")
                        .font(.subheadline)
                    
                    Text("Body")
                        .font(.body)
                    
                    Text("Callout")
                        .font(.callout)
                }
                
                Group {
                    Text("Dynamic Type Size Control")
                        .font(.headline)
                        .padding(.top)
                    
                    Text("This text uses dynamic type size")
                        .dynamicTypeSize(.large)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text("This text has a maximum size limit")
                        .dynamicTypeSize(...DynamicTypeSize.accessibility2)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text("Custom font with dynamic type")
                        .font(.custom("Helvetica", size: 16, relativeTo: .body))
                        .padding()
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    DynamicTypeView()
} 