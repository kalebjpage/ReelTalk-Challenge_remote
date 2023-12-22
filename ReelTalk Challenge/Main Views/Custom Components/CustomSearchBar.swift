import SwiftUI

struct CustomSearchBar: View {
    @State var searchBarText: String = ""
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .background(Color.white)
                .foregroundColor(.gray)
            TextField("Search to add more", text: $searchBarText) {
                    UIApplication.shared.endEditing()
            }
            .tint(.black)
            .padding(.horizontal)
            .onChange(of: searchBarText) {
                viewModel.fetch(search: searchBarText)
            }
        }
        .frame(maxWidth: .infinity)
        .font(.custom("Avenir Next", size: 17))
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        CustomSearchBar()
            .clipShape(Capsule())
    }
}
