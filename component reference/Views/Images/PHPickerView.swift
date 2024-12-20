import SwiftUI
import PhotosUI

struct PHPickerView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []
    @State private var isShowingMultiPicker = false
    @State private var singleSelectedItem: PhotosPickerItem?
    @State private var singleSelectedImage: Image?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Photo Picker")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Single Photo Selection")
                        .font(.headline)
                    
                    PhotosPicker(selection: $singleSelectedItem,
                               matching: .images) {
                        Label("Select Photo", systemImage: "photo.fill")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    if let singleSelectedImage {
                        singleSelectedImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
                
                Group {
                    Text("Multiple Photo Selection")
                        .font(.headline)
                    
                    PhotosPicker(selection: $selectedItems,
                               maxSelectionCount: 5,
                               matching: .images) {
                        Label("Select Multiple Photos", systemImage: "photo.stack.fill")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                        ForEach(selectedImages.indices, id: \.self) { index in
                            selectedImages[index]
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .padding()
            .onChange(of: singleSelectedItem) { oldValue, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        singleSelectedImage = Image(uiImage: uiImage)
                    }
                }
            }
            .onChange(of: selectedItems) { oldValue, newValue in
                Task {
                    selectedImages.removeAll()
                    for item in newValue {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            selectedImages.append(Image(uiImage: uiImage))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PHPickerView()
} 