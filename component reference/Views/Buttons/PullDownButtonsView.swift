import SwiftUI

struct PullDownButtonsView: View {
    @State private var selectedOption = "Option 1"
    @State private var selectedColor = Color.blue
    @State private var selectedSize = "Medium"
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    let colors: [Color] = [.blue, .red, .green, .purple]
    let sizes = ["Small", "Medium", "Large", "Extra Large"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Pull-Down Buttons")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // Basic Pull-Down
                VStack(alignment: .leading) {
                    Text("Basic Pull-Down")
                        .font(.headline)
                    
                    Picker("Select Option", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Styled Pull-Down
                VStack(alignment: .leading) {
                    Text("Styled Pull-Down")
                        .font(.headline)
                    
                    Picker("Select Color", selection: $selectedColor) {
                        ForEach(colors, id: \.self) { color in
                            HStack {
                                Circle()
                                    .fill(color)
                                    .frame(width: 20, height: 20)
                                Text(color.description.capitalized)
                            }
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Pull-Down with Groups
                VStack(alignment: .leading) {
                    Text("Grouped Pull-Down")
                        .font(.headline)
                    
                    Picker("Select Size", selection: $selectedSize) {
                        Group {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                        }
                        
                        Group {
                            Text("Large").tag("Large")
                            Text("Extra Large").tag("Extra Large")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Current Selections
                GroupBox("Current Selections") {
                    VStack(alignment: .leading) {
                        Text("Option: \(selectedOption)")
                        HStack {
                            Text("Color:")
                            Circle()
                                .fill(selectedColor)
                                .frame(width: 20, height: 20)
                        }
                        Text("Size: \(selectedSize)")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PullDownButtonsView()
} 