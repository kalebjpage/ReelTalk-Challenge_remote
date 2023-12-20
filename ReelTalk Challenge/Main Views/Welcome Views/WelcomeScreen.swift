import SwiftUI

struct WelcomeScreen: View {
    let image: String
    let text: String

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(image)
                .padding()
            Subtitle(text: text, color: .white)
                .font(.custom("Avenir Next", size: 17))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
    
}

#Preview {
    WelcomeView()
}
