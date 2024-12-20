import SwiftUI

struct LayoutPrioritiesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Layout Priorities")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Horizontal Layout Priority")
                        .font(.headline)
                    
                    HStack {
                        Text("Fixed Width")
                            .frame(width: 100)
                            .background(Color.blue.opacity(0.2))
                        
                        Text("Flexible Width with Priority")
                            .layoutPriority(1)
                            .background(Color.green.opacity(0.2))
                        
                        Text("Low Priority")
                            .layoutPriority(0)
                            .background(Color.orange.opacity(0.2))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Group {
                    Text("Vertical Layout Priority")
                        .font(.headline)
                    
                    VStack {
                        Text("Fixed Height")
                            .frame(height: 50)
                            .background(Color.blue.opacity(0.2))
                        
                        Text("This is a flexible height text that will expand based on content and has a higher layout priority")
                            .layoutPriority(1)
                            .background(Color.green.opacity(0.2))
                        
                        Text("Low Priority")
                            .layoutPriority(0)
                            .background(Color.orange.opacity(0.2))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Group {
                    Text("Frame Priority")
                        .font(.headline)
                    
                    HStack {
                        Text("Priority 1")
                            .frame(maxWidth: .infinity)
                            .layoutPriority(1)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                        
                        Text("Priority 2")
                            .frame(maxWidth: .infinity)
                            .layoutPriority(2)
                            .padding()
                            .background(Color.green.opacity(0.2))
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
    LayoutPrioritiesView()
} 