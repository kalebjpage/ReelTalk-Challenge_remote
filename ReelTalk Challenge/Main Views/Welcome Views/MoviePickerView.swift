import SwiftUI

struct MoviePickerView: View {
    @State var moviesPicked: [Movie] = []
    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var counter: Counter
    
    let adaptiveColumns: [GridItem] = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200)),
    ]
    
    var body: some View {
        VStack {
            Text("Select your top 5 movies")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.bottom)
            Subtitle(text: "\(counter.moviesSelected.count)/5 selected", color: .white)
            
            PickedMoviesView()
                .environmentObject(counter)
            
            CustomSearchBar()
                .environmentObject(viewModel)
                .clipShape(Capsule())
                .padding()
            
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        VStack(alignment: .center) {
                            if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
                                MovieImageView(url: url, movie: movie, smallImage: false)
                                    .padding(.horizontal)
                            }
                            Subtitle(text: "\(movie.title) (\(movie.formatDate()))", color: .white)
                                .multilineTextAlignment(.center)
                                .frame(maxHeight: 50)
                        }
                    }
                }
            }
        }
        .onAppear {
            //Do something with the previously selected genres there
            viewModel.fetch(search: nil)
        }
    }
}
