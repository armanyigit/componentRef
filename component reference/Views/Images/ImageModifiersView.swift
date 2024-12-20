import SwiftUI

struct ImageModifiersView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Image Modifiers")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Resizable Images")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("Scaled Images")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .imageScale(.large)
                    
                    Text("Templated Images")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                }
                
                Group {
                    Text("Styled Images")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.purple)
                        .symbolRenderingMode(.multicolor)
                    
                    Text("Clipped Images")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                
                Group {
                    Text("Overlay & Border")
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.blue, lineWidth: 4))
                }
            }
            .padding()
        }
    }
} 