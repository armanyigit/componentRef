import SwiftUI

struct CompositionalLayoutView: View {
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 16)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Compositional Layout")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Grid Layout")
                        .font(.headline)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(0..<12) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.2))
                                .frame(height: 100)
                                .overlay(Text("\(index + 1)"))
                        }
                    }
                }
                
                Group {
                    Text("Featured Layout")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.fixed(200))], spacing: 16) {
                            ForEach(0..<5) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green.opacity(0.2))
                                    .frame(width: 300)
                                    .overlay(Text("Featured \(index + 1)"))
                            }
                        }
                    }
                }
                
                Group {
                    Text("Mixed Layout")
                        .font(.headline)
                    
                    VStack(spacing: 16) {
                        // Featured Item
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.purple.opacity(0.2))
                            .frame(height: 200)
                            .overlay(Text("Featured"))
                        
                        // Grid Items
                        LazyVGrid(columns: [
                            GridItem(.flexible(), spacing: 16),
                            GridItem(.flexible(), spacing: 16)
                        ], spacing: 16) {
                            ForEach(0..<4) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange.opacity(0.2))
                                    .frame(height: 100)
                                    .overlay(Text("\(index + 1)"))
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CompositionalLayoutView()
} 