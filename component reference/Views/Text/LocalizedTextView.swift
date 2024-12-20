import SwiftUI

struct LocalizedTextView: View {
    @Environment(\.locale) var locale
    @State private var selectedLanguage = "en"
    
    let languages = [
        "en": "English",
        "es": "Spanish",
        "fr": "French",
        "de": "German"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Localized Text Examples")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                Picker("Select Language", selection: $selectedLanguage) {
                    ForEach(languages.sorted(by: { $0.value < $1.value }), id: \.key) { key, value in
                        Text(value).tag(key)
                    }
                }
                .pickerStyle(.menu)
                
                Group {
                    Text("hello_world")
                        .environment(\.locale, .init(identifier: selectedLanguage))
                    Text("welcome_message")
                        .environment(\.locale, .init(identifier: selectedLanguage))
                    Text("app_description")
                        .environment(\.locale, .init(identifier: selectedLanguage))
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Number Formatting")
                        .font(.headline)
                    
                    let number = 1234567.89
                    Text("Number: \(number, format: .number.locale(Locale(identifier: selectedLanguage)))")
                    
                    let date = Date()
                    Text("Date: \(date, format: .dateTime.locale(Locale(identifier: selectedLanguage)))")
                    
                    let currency = 99.99
                    Text("Price: \(currency, format: .currency(code: "USD").locale(Locale(identifier: selectedLanguage)))")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Text("Note: Add Localizable.strings files for each language to see actual translations")
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
    LocalizedTextView()
} 