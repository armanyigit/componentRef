import SwiftUI

struct AdaptiveStack<Content: View>: View {
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    init(
        horizontalAlignment: HorizontalAlignment = .center,
        verticalAlignment: VerticalAlignment = .center,
        spacing: CGFloat? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct AdaptiveStackView: View {
    @State private var isCompact = true
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Adaptive Stacks")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Toggle("Compact Layout", isOn: $isCompact)
                    .padding()
                
                Group {
                    Text("Basic Adaptive Stack")
                        .font(.headline)
                    
                    AdaptiveStack(spacing: 20) {
                        ForEach(1...3, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 100, height: 100)
                                .overlay(Text("\(index)"))
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Group {
                    Text("Content-Aware Stack")
                        .font(.headline)
                    
                    ViewThatFits {
                        HStack(spacing: 20) {
                            ForEach(1...3, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green.opacity(0.2))
                                    .frame(width: 100, height: 100)
                                    .overlay(Text("\(index)"))
                            }
                        }
                        
                        VStack(spacing: 20) {
                            ForEach(1...3, id: \.self) { index in
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green.opacity(0.2))
                                    .frame(width: 100, height: 100)
                                    .overlay(Text("\(index)"))
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
            .environment(\.horizontalSizeClass, isCompact ? .compact : .regular)
        }
    }
}

#Preview {
    AdaptiveStackView()
} 