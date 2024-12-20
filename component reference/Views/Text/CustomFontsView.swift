import SwiftUI

struct CustomFontsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Custom Fonts")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("System Font Weights")
                        .font(.headline)
                    
                    Text("Ultralight Weight")
                        .font(.system(size: 20, weight: .ultraLight))
                    
                    Text("Light Weight")
                        .font(.system(size: 20, weight: .light))
                    
                    Text("Regular Weight")
                        .font(.system(size: 20, weight: .regular))
                    
                    Text("Medium Weight")
                        .font(.system(size: 20, weight: .medium))
                    
                    Text("Semibold Weight")
                        .font(.system(size: 20, weight: .semibold))
                    
                    Text("Bold Weight")
                        .font(.system(size: 20, weight: .bold))
                    
                    Text("Heavy Weight")
                        .font(.system(size: 20, weight: .heavy))
                    
                    Text("Black Weight")
                        .font(.system(size: 20, weight: .black))
                }
                
                Group {
                    Text("Font Design")
                        .font(.headline)
                        .padding(.top)
                    
                    Text("Default Design")
                        .font(.system(size: 20, design: .default))
                    
                    Text("Monospaced Design")
                        .font(.system(size: 20, design: .monospaced))
                    
                    Text("Rounded Design")
                        .font(.system(size: 20, design: .rounded))
                    
                    Text("Serif Design")
                        .font(.system(size: 20, design: .serif))
                }
                
                // Note: To use custom fonts, you need to:
                // 1. Add font files to your project
                // 2. Include them in your Info.plist
                // 3. Register them using the font name
                
                Text("Note: To use custom font files, add them to your project and register them in Info.plist")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    CustomFontsView()
} 