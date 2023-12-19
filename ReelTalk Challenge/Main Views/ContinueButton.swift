import SwiftUI

struct ContinueButton: View {
    @State var opacity = 0.0
    @State var size = 0.0
    var action: () -> Void
    let height: CGFloat = 50
    
    var body: some View {
        Button(action: action) {
            Text("Continue")
                .frame(maxWidth: .infinity)
                .frame(height: height)
        }
        .font(.custom("Avenir Next", size: 17))
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .frame(height: height)
        .background(Color.customTint)
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.2)) {
                self.opacity = 1
                self.size = 1
            }
        }
    }
}

#Preview {
    ContinueButton(action: {
        print("Button Pressed")
    })
}
