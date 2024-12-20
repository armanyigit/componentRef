import SwiftUI

// Image Cache Manager
class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    
    func get(forKey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}

// Cached Image Loader
class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: String
    private let cache = ImageCache.shared
    
    init(url: String) {
        self.url = url
    }
    
    func load() {
        if let cached = cache.get(forKey: url) {
            self.image = cached
            return
        }
        
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.cache.set(image, forKey: self.url)
                self.image = image
            }
        }.resume()
    }
}

// Cached Image View
struct CachedImageView: View {
    @StateObject private var loader: ImageLoader
    let url: String
    
    init(url: String) {
        self.url = url
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.load()
        }
    }
}

// Demo View
struct ImageCachingView: View {
    let imageUrls = [
        "https://picsum.photos/id/1/300",
        "https://picsum.photos/id/2/300",
        "https://picsum.photos/id/3/300"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Image Caching")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                ForEach(imageUrls, id: \.self) { url in
                    VStack {
                        CachedImageView(url: url)
                            .frame(height: 200)
                        
                        Text("Image URL: \(url)")
                            .font(.caption)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Text("Images are cached and will load instantly on subsequent views")
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
    ImageCachingView()
} 