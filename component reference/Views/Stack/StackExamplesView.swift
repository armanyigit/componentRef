import SwiftUI

struct StackExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Stack Examples")
                    .font(.largeTitle)
                
                // HStack Example
                GroupBox("HStack") {
                    HStack(spacing: 15) {
                        ForEach(0..<3) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .overlay(Text("\(index + 1)"))
                        }
                    }
                }
                
                // VStack Example
                GroupBox("VStack") {
                    VStack(spacing: 15) {
                        ForEach(0..<3) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green.opacity(0.3))
                                .frame(width: 100, height: 40)
                                .overlay(Text("\(index + 1)"))
                        }
                    }
                }
                
                // ZStack Example
                GroupBox("ZStack") {
                    ZStack {
                        ForEach(0..<3) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.purple.opacity(0.3))
                                .frame(width: 100, height: 100)
                                .offset(x: CGFloat(index * 20), y: CGFloat(index * 20))
                                .overlay(Text("\(index + 1)"))
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    StackExamplesView()
} 