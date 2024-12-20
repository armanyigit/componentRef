import SwiftUI

struct TypographyScalingView: View {
    @ScaledMetric var scaledPadding: CGFloat = 20
    @ScaledMetric(relativeTo: .title) var titleSize: CGFloat = 34
    @ScaledMetric(relativeTo: .body) var bodySize: CGFloat = 17
    
    var body: some View {
        ScrollView {
            VStack(spacing: scaledPadding) {
                Text("Typography Scaling")
                    .font(.system(size: titleSize, weight: .bold))
                    .padding(.bottom)
                
                Group {
                    Text("Default Text Scaling")
                        .font(.headline)
                    
                    Text("This text scales with Dynamic Type")
                        .font(.body)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                    
                    Text("Custom Scaled Text")
                        .font(.system(size: bodySize))
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Group {
                    Text("Scaled Metrics")
                        .font(.headline)
                    
                    HStack(spacing: scaledPadding) {
                        ForEach(1...3, id: \.self) { index in
                            Circle()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: scaledPadding * 2, height: scaledPadding * 2)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                
                Group {
                    Text("Relative Scaling")
                        .font(.headline)
                    
                    Text("Large Title")
                        .font(.system(size: titleSize, weight: .bold))
                    
                    Text("Subheadline")
                        .font(.system(size: bodySize))
                        .foregroundColor(.gray)
                }
                
                Text("Note: Change text size in Settings to see scaling in action")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    TypographyScalingView()
} 