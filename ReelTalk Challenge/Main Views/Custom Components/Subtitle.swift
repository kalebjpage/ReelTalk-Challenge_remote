import SwiftUI

struct Subtitle: View {
    
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
    Subtitle(text: "Hello World!", color: .black)
}
