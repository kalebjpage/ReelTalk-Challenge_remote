import SwiftUI

struct MoviePickerView: View {
    @StateObject var viewModel = ViewModel()
    @Binding var movieCounter: Int
    
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
            Subtitle(text: "\(movieCounter)/5 selected", color: .white)
            HStack {
                ForEach(0...4, id: \.self) { _ in
                    Image("movie frame")
                }
            }
            
            CustomSearchBar()
                .environmentObject(viewModel)
                .clipShape(Capsule())
                .padding()
            
            ScrollView {
                LazyVGrid(columns: adaptiveColumns) {
                    ForEach(viewModel.movies, id: \.self) { movie in
                        VStack(alignment: .center) {
                            if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)") {
                                MovieImageView(url: url)
                                    .padding(.horizontal)
                            }
                            Subtitle(text: "\(movie.title) (\(movie.formatDate()))", color: .white)
                                .multilineTextAlignment(.center)
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
