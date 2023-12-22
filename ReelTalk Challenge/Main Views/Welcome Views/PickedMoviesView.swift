import SwiftUI

struct PickedMoviesView: View {
    @EnvironmentObject var counter: Counter
    
    var body: some View {
        HStack {
            ForEach(counter.moviesSelected, id: \.self) { movie in
                if let url = URL(string: "https://image.tmdb.org/t/p/w92/\(movie.poster_path)") {
                    MovieImageView(opacity: 0, size: 0, url: url, movie: movie, smallImage: true)
                }
            }
            if counter.moviesSelected.count < 5 {
                ForEach(0...4-counter.moviesSelected.count, id: \.self) { _ in
                    Image("movie frame")
                }
            }
        }
    }
}
