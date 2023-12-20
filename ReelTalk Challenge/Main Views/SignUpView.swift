import SwiftUI

struct SignUpView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            Text("Create Your Account")
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Sign Up")
        }
    }
}

#Preview {
    SignUpView()
}
