import SwiftUI

struct ContinueButton: View {
    @State var opacity = 0.0
    @State var size = 0.0
    
    var body: some View {
            Text("Continue")
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .font(.custom("Avenir Next", size: 17))
            .foregroundColor(.black)
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

//struct CustomButton: View {
//    @State var opacity = 0.0
//    @State var size = 0.0
//    var action: () -> Void
//    let height: CGFloat = 50
//    let text: String
//    
//    var body: some View {
//        Button(action: action) {
//            Text(text)
//                .frame(maxWidth: .infinity)
//                .frame(height: height)
//        }
//        .font(.custom("Avenir Next", size: 17))
//        .foregroundColor(.black)
//        .frame(maxWidth: .infinity)
//        .frame(height: height)
//        .background(Color.customTint)
//        .scaleEffect(size)
//        .opacity(opacity)
//        .onAppear {
//            withAnimation(.easeInOut(duration: 0.2)) {
//                self.opacity = 1
//                self.size = 1
//            }
//        }
//    }
//}

#Preview {
    ContinueButton()
}
