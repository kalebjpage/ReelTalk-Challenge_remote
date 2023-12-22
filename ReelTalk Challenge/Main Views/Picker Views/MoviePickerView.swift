import SwiftUI

/// An enum used to differentiate between the two pickers.

enum PickerType {
    case movie
    case series
}

/// Depending on whether it is a series or a movie, the MoviePickerView takes charge of displaying the movies and their respective titles.

struct MoviePickerView: View {
    @State var moviesPicked: [Movie] = []
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var counter: Counter
    @EnvironmentObject var buttonController: ContinueButtonController
    var pickerType: PickerType
    
    let adaptiveColumns: [GridItem] = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
    ]
    
    var body: some View {
        VStack {
            Text("Select your top 5 \(pickerType == .movie ? "movies": "series")")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.bottom)
            CustomText(text: "\(pickerType == .movie ? counter.moviesSelected.count : counter.seriesSelected.count)/5 selected", color: .white)
            
            PickedMoviesView(pickerType: pickerType)
                .environmentObject(counter)
                .environmentObject(buttonController)
            
            CustomSearchBar(pickerType: self.pickerType)
                .environmentObject(viewModel)
                .clipShape(Capsule())
                .padding()
            
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        VStack(alignment: .center) {
                            if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
                                MovieImageView(url: url, movie: movie, smallImage: false, pickerType: pickerType)
                                    .padding(.horizontal)
                            }
                            CustomText(text: "\(movie.title) (\(movie.formatDate()))", color: .white)
                                .multilineTextAlignment(.center)
                                .frame(maxHeight: 50)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.buttonController.isDisabled = true
            if self.pickerType == .movie {
                self.viewModel.fetchMovies(search: nil)
            } else {
                self.viewModel.fetchSeries(search: nil)
            }
        }
    }
}
