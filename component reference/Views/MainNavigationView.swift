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
            Component(title: "Text Animations", isImplemented: true, view: AnyView(TextAnimationsView())),
            Component(title: "Custom Fonts", isImplemented: true, view: AnyView(CustomFontsView())),
            Component(title: "LocalizedStringKey", isImplemented: true, view: AnyView(LocalizedTextView())),
            Component(title: "Typography Scaling", isImplemented: true, view: AnyView(TypographyScalingView()))
        ]),
        ComponentSection(title: "Buttons & Controls", components: [
            Component(title: "Basic Buttons", isImplemented: true, view: AnyView(BasicButtonsView())),
            Component(title: "Button Styles", isImplemented: true, view: AnyView(ButtonStylesView())),
            Component(title: "Menu Buttons", isImplemented: true, view: AnyView(MenuButtonsView())),
            Component(title: "Pull-Down Buttons", isImplemented: true, view: AnyView(PullDownButtonsView())),
            Component(title: "Haptic Feedback", isImplemented: true, view: AnyView(HapticFeedbackView()))
        ]),
        ComponentSection(title: "Images & Media", components: [
            Component(title: "System Images", isImplemented: true, view: AnyView(SystemImagesView())),
            Component(title: "Image Modifiers", isImplemented: true, view: AnyView(ImageModifiersView())),
            Component(title: "Async Loading", isImplemented: true, view: AnyView(AsyncImageView())),
            Component(title: "Image Caching", isImplemented: true, view: AnyView(ImageCachingView())),
            Component(title: "PHPicker", isImplemented: true, view: AnyView(PHPickerView())),
            Component(title: "Live Photos", isImplemented: true, view: AnyView(LivePhotoView())),
            Component(title: "Image Editing", isImplemented: true, view: AnyView(ImageEditingView()))
        ]),
        ComponentSection(title: "Stack Views", components: [
            Component(title: "Stack Examples", isImplemented: true, view: AnyView(StackExamplesView())),
            Component(title: "Custom Layouts", isImplemented: true, view: AnyView(CustomLayoutView())),
            Component(title: "Adaptive Stacks", isImplemented: true, view: AnyView(AdaptiveStackView())),
            Component(title: "Layout Priorities", isImplemented: true, view: AnyView(LayoutPrioritiesView()))
        ]),
        ComponentSection(title: "Lists & Collections", components: [
            Component(title: "Basic Lists", isImplemented: true, view: AnyView(BasicListView())),
            Component(title: "Section Lists", isImplemented: true, view: AnyView(SectionListView())),
            Component(title: "Forms", isImplemented: true, view: AnyView(FormExampleView())),
            Component(title: "Collection Views", isImplemented: true, view: AnyView(CollectionView())),
            Component(title: "Swipe Actions", isImplemented: true, view: AnyView(SwipeActionsView())),
            Component(title: "Pull to Refresh", isImplemented: true, view: AnyView(PullToRefreshView())),
            Component(title: "Compositional Layout", isImplemented: true, view: AnyView(CompositionalLayoutView())),
            Component(title: "Diffable Data Source", isImplemented: true, view: AnyView(DiffableDataSourceView()))
        ]),
        ComponentSection(title: "Navigation", components: [
            Component(title: "Navigation Examples", isImplemented: true, view: AnyView(NavigationExamplesView())),
            Component(title: "Page View", isImplemented: true, view: AnyView(PageView()))
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