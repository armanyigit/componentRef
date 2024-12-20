import SwiftUI

struct SystemImagesView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("System Images")
                .font(.largeTitle)
                .padding(.bottom)
            
            // Basic SF Symbol
            Image(systemName: "star.fill")
                .font(.title)
            
            // Colored symbol
            Image(systemName: "heart.fill")
                .font(.title)
                .foregroundColor(.red)
            
            // Scaled symbol
            Image(systemName: "cloud.sun.fill")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 50))
            
            // Variable symbol
            Image(systemName: "wifi")
                .symbolVariant(.slash)
                .font(.title)
            
            // Symbol with badge
            Image(systemName: "envelope.fill")
                .font(.title)
                .symbolRenderingMode(.multicolor)
                .badge(5)
        }
        .padding()
    }
}

#Preview {
    SystemImagesView()
} 