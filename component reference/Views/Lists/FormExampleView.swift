import SwiftUI

struct FormExampleView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var agreeToTerms = false
    @State private var notificationsEnabled = true
    @State private var selectedTheme = "Light"
    @State private var birthDate = Date()
    
    let themes = ["Light", "Dark", "System"]
    
    var body: some View {
        Form {
            Section(header: Text("Profile Information")) {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                DatePicker("Birth Date", selection: $birthDate, displayedComponents: .date)
            }
            
            Section(header: Text("Preferences")) {
                Picker("Theme", selection: $selectedTheme) {
                    ForEach(themes, id: \.self) { theme in
                        Text(theme)
                    }
                }
                Toggle("Enable Notifications", isOn: $notificationsEnabled)
            }
            
            Section(header: Text("Terms & Conditions")) {
                Toggle("I agree to terms", isOn: $agreeToTerms)
                
                Button(action: {
                    // Submit form
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                }
                .disabled(!agreeToTerms)
            }
        }
        .navigationTitle("Form Example")
    }
} 