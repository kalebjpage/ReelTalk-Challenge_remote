import SwiftUI

/// A custom text view used commonly throughout the app. It uses the correct font, "Avenir Next."

struct CustomText: View {
    
    var text: String
    var color: Color
    var textSize: CGFloat = 17
    
    var body: some View {
        Text(text)
            .font(.custom("Avenir Next", size: textSize))
            .foregroundColor(color)
    }
}

#Preview {
    CustomText(text: "Hello World!", color: .black)
}
