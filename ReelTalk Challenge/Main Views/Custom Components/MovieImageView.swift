import SwiftUI

struct MovieImageView: View {
    @EnvironmentObject var counter: Counter
    @State var isSelected: Bool = false
    @State var opacity: CGFloat = 1.0
    @State var size: CGFloat = 1.0
    let url: URL
    let movie: Movie
    let smallImage: Bool
    
                                
    var body: some View {
            ZStack {
                    Button(action: {
                        if self.isSelected {
                            if let index = self.counter.moviesSelected.firstIndex(of: movie) {
                                self.counter.moviesSelected.remove(at: index)
                            }
                                self.isSelected = false
                            
                        } else if self.counter.moviesSelected.count < 5 {
                            counter.moviesSelected.append(self.movie)
                                self.isSelected = true
                        }
                    }, label: {
                        
                        AsyncImage(url: url) { movieImage in
                            if !smallImage {
                                movieImage
                                    .resizable()
                                    .frame(maxHeight: 200)
                            } else {
                                movieImage
                                    .frame(width: 48, height: 72)
                                    .scaleEffect(0.5)
                                    .onAppear {
                                        withAnimation(.easeIn(duration: 0.1)) {
                                            self.size = 1.0
                                            self.opacity = 1.0
                                        }
                                    }
                            }
                            
                        } placeholder: {
                            if !smallImage {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ProgressView()
                                }
                                .frame(height: 200)
                            } else {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ProgressView()
                                }
                                .frame(width: 48, height: 72)
                            }
                        }
                    })
                    if self.isSelected {
                        GeometryReader { g in
                            Image(systemName: "checkmark.circle.fill")
                                .scaleEffect(2)
                                .foregroundStyle(Color.customTint)
                                .offset(x: g.size.width - 40, y: 20)
                        }
                    }
                }
            .border(self.isSelected ? Color.customTint : .clear, width: 5)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .scaleEffect(self.size)
            .opacity(self.opacity)
    }
}

#Preview {
    MovieImageView(url: URL(string: "https://image.tmdb.org/t/p/w92//ocA0ECiFoB4d1HITyEDQlLk7x84.jpg")!, movie: Movie(adult: false, backdrop_path: "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg", genre_ids: [28, 80, 53], id: 920081, original_language: "en", original_title: "Fast X", overview: "", popularity: 508.326, poster_path: "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg", release_date: "2023-05-17", title: "Fast X", video: false, vote_average: 7.2, vote_count: 4500), smallImage: true)
}
