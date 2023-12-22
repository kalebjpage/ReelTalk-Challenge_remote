import SwiftUI

/// An extension on UIApplication that allows for the closing of the keyboard on physical devices.

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
