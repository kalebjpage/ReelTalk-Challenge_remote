import SwiftUI

/// In order for a continue button to funcion, it must have a ContinueButtonController environment object which tells it if it is disabled or not based on the desired conditions.

@MainActor class ContinueButtonController: ObservableObject {
    @Published var isDisabled: Bool = false
}

/// A custom continue button made according to the style of the app.

struct ContinueButton: View {
    @EnvironmentObject var buttonController: ContinueButtonController
    @State var opacity = 0.0
    @State var size = 0.0
    let text: String
    
    var body: some View {
            Text(text)
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

