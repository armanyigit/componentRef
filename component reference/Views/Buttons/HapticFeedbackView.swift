import SwiftUI

struct HapticFeedbackView: View {
    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
    let selectionFeedback = UISelectionFeedbackGenerator()
    let notificationFeedback = UINotificationFeedbackGenerator()
    
    // Define feedback styles without conforming to CaseIterable
    let impactStyles: [UIImpactFeedbackGenerator.FeedbackStyle] = [
        .light, .medium, .heavy, .soft, .rigid
    ]
    
    // Define feedback types without conforming to CaseIterable
    let notificationTypes: [UINotificationFeedbackGenerator.FeedbackType] = [
        .success, .warning, .error
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Haptic Feedback")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Text("Impact Feedback")
                        .font(.headline)
                    
                    HStack(spacing: 20) {
                        ForEach(impactStyles, id: \.self) { style in
                            Button {
                                let generator = UIImpactFeedbackGenerator(style: style)
                                generator.impactOccurred()
                            } label: {
                                Text(style.name)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Group {
                    Text("Selection Feedback")
                        .font(.headline)
                    
                    Button {
                        selectionFeedback.selectionChanged()
                    } label: {
                        Text("Selection Changed")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
                Group {
                    Text("Notification Feedback")
                        .font(.headline)
                    
                    HStack(spacing: 20) {
                        ForEach(notificationTypes, id: \.self) { type in
                            Button {
                                notificationFeedback.notificationOccurred(type)
                            } label: {
                                Text(type.name)
                                    .padding()
                                    .background(type.color)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// Helper extensions without conforming to CaseIterable
extension UIImpactFeedbackGenerator.FeedbackStyle {
    var name: String {
        switch self {
        case .light: return "Light"
        case .medium: return "Medium"
        case .heavy: return "Heavy"
        case .soft: return "Soft"
        case .rigid: return "Rigid"
        @unknown default: return "Unknown"
        }
    }
}

extension UINotificationFeedbackGenerator.FeedbackType {
    var name: String {
        switch self {
        case .success: return "Success"
        case .warning: return "Warning"
        case .error: return "Error"
        @unknown default: return "Unknown"
        }
    }
    
    var color: Color {
        switch self {
        case .success: return .green
        case .warning: return .orange
        case .error: return .red
        @unknown default: return .gray
        }
    }
}

#Preview {
    HapticFeedbackView()
} 