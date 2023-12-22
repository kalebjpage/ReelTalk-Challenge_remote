import SwiftUI

/// A custom tab indicator view. It is separated into 3 rectangles which change color when a new screen is presented.

struct TabIndicator: View {
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 1 ? Color.customTint : .gray)
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 2 ? Color.customTint : .gray)
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 3 ? Color.customTint : .gray)
        }
    }
}
