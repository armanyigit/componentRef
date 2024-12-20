import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    let tabs = [
        TabItem(title: "Home", icon: "house.fill", color: .blue),
        TabItem(title: "Search", icon: "magnifyingglass", color: .green),
        TabItem(title: "Profile", icon: "person.fill", color: .purple)
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
                    VStack {
                        Image(systemName: selectedTab == index ? 
                              tabs[index].icon : tabs[index].icon.replacingOccurrences(of: ".fill", with: ""))
                            .font(.system(size: 24))
                        Text(tabs[index].title)
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == index ? tabs[index].color : .gray)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = index
                        }
                    }
                    Spacer()
                }
            }
            .frame(height: 60)
            .background(.ultraThinMaterial)
        }
    }
}

struct TabItem {
    let title: String
    let icon: String
    let color: Color
}

#Preview {
    CustomTabView()
} 