import SwiftUI

/// A bubble which fills in on click and updates the counter variable to let the view know a genre has been selected. When 3 have been selected, the buttonController object enables the continue button.

struct GenreBubble: View {
    @State var isSelected: Bool = false
    @EnvironmentObject var counter: Counter
    @EnvironmentObject var buttonController: ContinueButtonController
    let genre: String
    
    var body: some View {
        Button(action: {
            if self.isSelected {
                self.isSelected = false
                self.counter.genresSelected -= 1
            } else if counter.genresSelected < 3 {
                self.isSelected = true
                self.counter.genresSelected += 1
                
            }
            if counter.genresSelected == 3 {
                self.buttonController.isDisabled = false
            } else {
                self.buttonController.isDisabled = true
            }
        }, label: {
            CustomText(text: genre, color: self.isSelected ? .black : .white)
                .bold()
                .padding(.horizontal, 25.0)
                .padding(.vertical, 5.0)
                .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                .background(self.isSelected ? .white : Color.clear)
                .mask(Capsule())
            
        })
    }
}

#Preview {
    GenreBubble(genre: "Action")
}
