import SwiftUI

/// A custom email text field for the log in views.

struct EmailTextField: View {
    @State private var emailTextField = ""
    
    var body: some View {
        VStack {
            TextField(text: $emailTextField) {
                Text("Email")
                    .foregroundColor(.gray)
            }
            .foregroundColor(.gray)
            .padding(.leading)
            Rectangle()
                .frame(height: 2)
                .padding(.leading)
                .padding(.trailing)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        EmailTextField()
    }
}
