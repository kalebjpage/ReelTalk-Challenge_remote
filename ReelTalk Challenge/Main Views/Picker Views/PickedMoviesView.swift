import SwiftUI

/// A dynamic view which displays 5 empty movie frames if no movie is selected. As the movies are selected, the frames are filled in with the movies.

struct PickedMoviesView: View {
    @EnvironmentObject var counter: Counter
    var pickerType: PickerType
    
    var body: some View {
        HStack {
            ForEach(self.pickerType == .movie ? counter.moviesSelected : counter.seriesSelected, id: \.self) { item in
                if let url = URL(string: "https://image.tmdb.org/t/p/w92/\(item.poster_path)") {
                    MovieImageView(opacity: 0, size: 0, url: url, movie: item, smallImage: true, pickerType: pickerType)
                }
            }
            if pickerType == .movie {
                if counter.moviesSelected.count < 5 {
                    ForEach(0...4-counter.moviesSelected.count, id: \.self) { _ in
                        Image("movie frame")
                    }
                }
            } else {
                if counter.seriesSelected.count < 5 {
                    ForEach(0...4-counter.seriesSelected.count, id: \.self) { _ in
                        Image("movie frame")
                    }
                }
            }
        }
    }
}
