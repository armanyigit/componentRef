import SwiftUI
import PhotosUI

struct LivePhotoView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var livePhotoData: Data?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Live Photos")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                PhotosPicker(selection: $selectedItem,
                           matching: .livePhotos) {
                    Label("Select Live Photo", systemImage: "livephoto")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if let livePhotoData {
                    LivePhotoRepresentable(data: livePhotoData)
                        .frame(height: 400)
                        .cornerRadius(10)
                } else {
                    ContentUnavailableView(
                        "No Live Photo Selected",
                        systemImage: "livephoto",
                        description: Text("Select a Live Photo to view it here")
                    )
                    .frame(height: 400)
                }
                
                Text("Note: Live Photos can be played by long-pressing on the image")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
            .onChange(of: selectedItem) { _ in
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                        livePhotoData = data
                    }
                }
            }
        }
    }
}

struct LivePhotoRepresentable: UIViewRepresentable {
    let data: Data
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        if let image = UIImage(data: data) {
            uiView.image = image
        }
    }
}

#Preview {
    LivePhotoView()
} 