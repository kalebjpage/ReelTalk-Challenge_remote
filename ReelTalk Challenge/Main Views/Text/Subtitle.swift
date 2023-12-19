import SwiftUI

struct Subtitle: View {
    
    var text: String
    var color: Color
    
    var body: some View {
        Text(text)
            .font(.custom("Avenir Next", size: 17))
            .foregroundColor(color)
    }
}

#Preview {
    Subtitle(text: "Hello World!", color: .black)
}
