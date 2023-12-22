import SwiftUI

struct ContinueButton: View {
    @EnvironmentObject var buttonController: ContinueButtonController
    @State var opacity = 0.0
    @State var size = 0.0
    
    var body: some View {
            Text("Continue")
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .font(.custom("Avenir Next", size: 17))
            .foregroundColor(!self.buttonController.isDisabled ? .black : .white.opacity(0.5))
            .background(!self.buttonController.isDisabled ? Color.customTint : Color.gray)
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

