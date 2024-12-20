import SwiftUI
import PhotosUI

struct ImageEditingView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var originalImage: UIImage?
    @State private var editedImage: UIImage?
    @State private var brightness: Double = 0
    @State private var contrast: Double = 1
    @State private var saturation: Double = 1
    @State private var isShowingCropSheet = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Image Editing")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                PhotosPicker(selection: $selectedItem,
                           matching: .images) {
                    Label("Select Image to Edit", systemImage: "photo.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if let image = editedImage ?? originalImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(10)
                    
                    VStack(spacing: 20) {
                        Group {
                            Text("Brightness")
                            Slider(value: $brightness, in: -1...1) { _ in
                                applyFilters()
                            }
                        }
                        
                        Group {
                            Text("Contrast")
                            Slider(value: $contrast, in: 0.5...1.5) { _ in
                                applyFilters()
                            }
                        }
                        
                        Group {
                            Text("Saturation")
                            Slider(value: $saturation, in: 0...2) { _ in
                                applyFilters()
                            }
                        }
                        
                        Button("Reset Filters") {
                            brightness = 0
                            contrast = 1
                            saturation = 1
                            editedImage = originalImage
                        }
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                } else {
                    ContentUnavailableView(
                        "No Image Selected",
                        systemImage: "photo",
                        description: Text("Select an image to start editing")
                    )
                }
            }
            .padding()
            .onChange(of: selectedItem) { oldValue, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        originalImage = image
                        editedImage = image
                    }
                }
            }
        }
    }
    
    private func applyFilters() {
        guard let image = originalImage,
              let ciImage = CIImage(image: image) else { return }
        
        let filter = ciImage
            .applyingFilter("CIColorControls", parameters: [
                kCIInputBrightnessKey: brightness,
                kCIInputContrastKey: contrast,
                kCIInputSaturationKey: saturation
            ])
        
        let context = CIContext()
        if let cgImage = context.createCGImage(filter, from: filter.extent) {
            editedImage = UIImage(cgImage: cgImage)
        }
    }
}

#Preview {
    ImageEditingView()
} 