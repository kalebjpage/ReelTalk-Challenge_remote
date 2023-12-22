import SwiftUI

/// A custom search bar according to the design in Figma. When the text is changed, the API network call is made and the desired movies or series are retrieved.

struct CustomSearchBar: View {
    @State var searchBarText: String = ""
    @EnvironmentObject var viewModel: ViewModel
    var pickerType: PickerType
    
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
                if self.pickerType == .movie {
                    viewModel.fetchMovies(search: searchBarText)
                } else {
                    viewModel.fetchSeries(search: searchBarText)
                }
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
        CustomSearchBar(pickerType: .movie)
            .clipShape(Capsule())
    }
}
