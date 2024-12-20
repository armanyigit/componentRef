import SwiftUI

struct ComponentSection: Identifiable {
    let id = UUID()
    let title: String
    let components: [Component]
    
    var implementedComponents: [Component] {
        components.filter { $0.isImplemented }
    }
    
    var hasImplementedComponents: Bool {
        !implementedComponents.isEmpty
    }
}

struct Component: Identifiable {
    let id = UUID()
    let title: String
    let isImplemented: Bool
    let view: AnyView
}

struct MainNavigationView: View {
    let sections = [
        ComponentSection(title: "Text & Typography", components: [
            Component(title: "Basic Text & Labels", isImplemented: true, view: AnyView(BasicTextView())),
            Component(title: "Text Styles & Formatting", isImplemented: true, view: AnyView(FormattedTextView())),
            Component(title: "AttributedString", isImplemented: true, view: AnyView(AttributedStringView())),
            Component(title: "Dynamic Type Support", isImplemented: true, view: AnyView(DynamicTypeView())),
            Component(title: "LocalizedStringKey", isImplemented: false, view: AnyView(Text("Coming Soon")))
        ]),
        ComponentSection(title: "Buttons & Controls", components: [
            Component(title: "Basic Buttons", isImplemented: true, view: AnyView(BasicButtonsView())),
            Component(title: "Button Styles", isImplemented: true, view: AnyView(ButtonStylesView())),
            Component(title: "Menu Buttons", isImplemented: true, view: AnyView(MenuButtonsView()))
        ]),
        ComponentSection(title: "Images & Media", components: [
            Component(title: "System Images", isImplemented: true, view: AnyView(SystemImagesView())),
            Component(title: "Image Modifiers", isImplemented: true, view: AnyView(ImageModifiersView())),
            Component(title: "Async Loading", isImplemented: true, view: AnyView(AsyncImageView()))
        ]),
        ComponentSection(title: "Stack Views", components: [
            Component(title: "Stack Examples", isImplemented: true, view: AnyView(StackExamplesView()))
        ]),
        ComponentSection(title: "Lists & Collections", components: [
            Component(title: "Basic Lists", isImplemented: true, view: AnyView(BasicListView())),
            Component(title: "Section Lists", isImplemented: true, view: AnyView(SectionListView())),
            Component(title: "Forms", isImplemented: true, view: AnyView(FormExampleView())),
            Component(title: "Swipe Actions", isImplemented: true, view: AnyView(SwipeActionsView()))
        ])
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections.filter { $0.hasImplementedComponents }) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.implementedComponents) { component in
                            NavigationLink(destination: 
                                component.view
                                    .navigationTitle(component.title)
                            ) {
                                Text(component.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("iOS Components")
        }
    }
}

#Preview {
    MainNavigationView()
} 