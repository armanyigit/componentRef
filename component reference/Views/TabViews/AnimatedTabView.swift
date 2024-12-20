import SwiftUI

struct AnimatedTabView: View {
    @State private var selectedTab = 0
    @State private var previousTab = 0
    @State private var tabAnimation: Animation = .default
    
    let tabs = [
        TabInfo(title: "Home", icon: "house.fill", color: .blue),
        TabInfo(title: "Search", icon: "magnifyingglass", color: .green),
        TabInfo(title: "Profile", icon: "person.fill", color: .purple)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(tabs.indices, id: \.self) { index in
                    Color(tabs[index].color.opacity(0.2))
                        .overlay(
                            Text(tabs[index].title)
                                .font(.largeTitle)
                        )
                        .tag(index)
                }
            }
            
            HStack {
                ForEach(tabs.indices, id: \.self) { index in
                    Spacer()
                    TabButton(
                        tab: tabs[index],
                        isSelected: selectedTab == index,
                        action: {
                            withAnimation(tabAnimation) {
                                previousTab = selectedTab
                                selectedTab = index
                            }
                        }
                    )
                    Spacer()
                }
            }
            .frame(height: 60)
            .background(.ultraThinMaterial)
        }
        .overlay(alignment: .top) {
            HStack {
                ForEach(AnimationType.allCases, id: \.self) { type in
                    Button(type.rawValue) {
                        tabAnimation = type.animation
                    }
                    .buttonStyle(.bordered)
                }
            }
            .padding()
        }
    }
}

struct TabInfo {
    let title: String
    let icon: String
    let color: Color
}

struct TabButton: View {
    let tab: TabInfo
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack {
            Image(systemName: tab.icon)
                .font(.system(size: 24))
                .symbolEffect(.bounce, value: isSelected)
            
            Text(tab.title)
                .font(.caption)
        }
        .foregroundColor(isSelected ? tab.color : .gray)
        .onTapGesture(perform: action)
    }
}

enum AnimationType: String, CaseIterable {
    case smooth = "Smooth"
    case spring = "Spring"
    case bounce = "Bounce"
    
    var animation: Animation {
        switch self {
        case .smooth:
            return .easeInOut(duration: 0.3)
        case .spring:
            return .spring(response: 0.3, dampingFraction: 0.8)
        case .bounce:
            return .interpolatingSpring(mass: 1, stiffness: 100, damping: 10)
        }
    }
}

#Preview {
    AnimatedTabView()
} 