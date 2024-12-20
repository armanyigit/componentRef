import SwiftUI

struct PageContent: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
    let icon: String
}

struct PageView: View {
    @State private var currentPage = 0
    
    let pages = [
        PageContent(
            title: "Welcome",
            description: "This is a demonstration of SwiftUI's TabView used as a page view.",
            color: .blue,
            icon: "hand.wave"
        ),
        PageContent(
            title: "Features",
            description: "Swipe left or right to navigate between pages. The dots below indicate your current position.",
            color: .green,
            icon: "star"
        ),
        PageContent(
            title: "Customization",
            description: "Pages can contain any content and can be styled however you like.",
            color: .purple,
            icon: "paintbrush"
        ),
        PageContent(
            title: "Get Started",
            description: "You're ready to start using page views in your app!",
            color: .orange,
            icon: "arrow.right.circle"
        )
    ]
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(pages.enumerated()), id: \.element.id) { index, page in
                VStack(spacing: 20) {
                    Image(systemName: page.icon)
                        .font(.system(size: 60))
                        .foregroundColor(page.color)
                    
                    Text(page.title)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(page.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    if index == pages.count - 1 {
                        Button(action: {
                            currentPage = 0
                        }) {
                            Text("Start Over")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(page.color)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                    }
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    PageView()
} 