import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Button Styles")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Group {
                    Button("Bordered Button") {}
                        .buttonStyle(.bordered)
                    
                    Button("Bordered Prominent") {}
                        .buttonStyle(.borderedProminent)
                    
                    Button("Borderless Button") {}
                        .buttonStyle(.borderless)
                    
                    Button(action: {}) {
                        Text("Custom Style")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {}) {
                        Text("Gradient Style")
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                LinearGradient(colors: [.blue, .purple],
                                             startPoint: .leading,
                                             endPoint: .trailing)
                            )
                            .cornerRadius(10)
                    }
                }
                
                Group {
                    Button(action: {}) {
                        Text("Shadow Style")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    
                    Button(action: {}) {
                        Text("Border Style")
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
            }
            .padding()
        }
    }
} 