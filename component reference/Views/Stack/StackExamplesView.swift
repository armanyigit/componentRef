import SwiftUI

struct StackExamplesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("Stack Examples")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                // HStack Example
                VStack(alignment: .leading) {
                    Text("HStack Example")
                        .font(.headline)
                    
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
                VStack(alignment: .leading) {
                    Text("VStack Example")
                        .font(.headline)
                    
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
                VStack(alignment: .leading) {
                    Text("ZStack Example")
                        .font(.headline)
                    
                    ZStack {
                        ForEach((0..<3).reversed(), id: \.self) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.purple.opacity(0.3))
                                .frame(width: 100, height: 100)
                                .offset(x: CGFloat(index * 20), y: CGFloat(index * 20))
                                .overlay(Text("\(index + 1)"))
                        }
                    }
                }
                
                // Alignment Example
                VStack(alignment: .leading) {
                    Text("Alignment Example")
                        .font(.headline)
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 50, height: 50)
                        
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 50, height: 75)
                        
                        Rectangle()
                            .fill(Color.blue.opacity(0.3))
                            .frame(width: 50, height: 100)
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