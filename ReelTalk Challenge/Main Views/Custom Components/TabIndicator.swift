import SwiftUI

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
