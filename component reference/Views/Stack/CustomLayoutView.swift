import SwiftUI

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        
        var yOffset: CGFloat = 0
        for line in result.lines {
            var xOffset = bounds.minX
            
            for item in line {
                let position = CGPoint(x: xOffset, y: bounds.minY + yOffset)
                subviews[item.index].place(at: position, proposal: .init(item.size))
                xOffset += item.size.width + spacing
            }
            
            if let maxHeight = line.map({ $0.size.height }).max() {
                yOffset += maxHeight + spacing
            }
        }
    }
    
    struct FlowResult {
        var lines: [[Item]] = []
        var size: CGSize = .zero
        
        struct Item {
            let index: Int
            let size: CGSize
        }
        
        init(in width: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var currentLine: [Item] = []
            var currentX: CGFloat = 0
            var currentY: CGFloat = 0
            var maxHeight: CGFloat = 0
            
            for (index, subview) in subviews.enumerated() {
                let size = subview.sizeThatFits(.unspecified)
                let item = Item(index: index, size: size)
                
                if currentX + size.width > width && !currentLine.isEmpty {
                    lines.append(currentLine)
                    currentLine = []
                    currentX = 0
                    currentY += maxHeight + spacing
                    maxHeight = 0
                }
                
                currentLine.append(item)
                currentX += size.width + spacing
                maxHeight = max(maxHeight, size.height)
            }
            
            if !currentLine.isEmpty {
                lines.append(currentLine)
            }
            
            let totalHeight = currentY + maxHeight
            let maxWidth = lines.map { line in
                line.reduce(0) { $0 + $1.size.width } + CGFloat(max(0, line.count - 1)) * spacing
            }.max() ?? 0
            
            size = CGSize(width: maxWidth, height: totalHeight)
        }
    }
}

struct CustomLayoutView: View {
    let items = (1...20).map { "Item \($0)" }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Custom Layouts")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Flow Layout")
                        .font(.headline)
                    
                    FlowLayout(spacing: 10) {
                        ForEach(items, id: \.self) { item in
                            Text(item)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Group {
                    Text("Custom Grid")
                        .font(.headline)
                    
                    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(1...9, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.green.opacity(0.2))
                                .frame(height: 80)
                                .overlay(Text("\(index)"))
                        }
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

#Preview {
    CustomLayoutView()
} 