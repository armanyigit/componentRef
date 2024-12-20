import SwiftUI

struct AsyncImageView: View {
    let imageUrls = [
        "https://picsum.photos/200",
        "https://picsum.photos/300",
        "https://picsum.photos/400"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Async Image Loading")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                ForEach(imageUrls, id: \.self) { url in
                    VStack {
                        AsyncImage(url: URL(string: url)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 200)
                            case .failure:
                                Image(systemName: "exclamationmark.triangle")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 200)
                        
                        Text("Image from: \(url)")
                            .font(.caption)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
} 