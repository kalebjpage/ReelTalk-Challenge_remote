import SwiftUI

/// This ViewModel class is what does the heavy lifting. It makes the API calls and returns the lists of movies or series, depending on the request. The data is stored in the movies variable.

class ViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    /// Fetches one page of movie items.
    
    func fetchMovies(search: String?) {
        guard let search = search else {
            self.makeRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")!, type: .movie)
            return }
        let queryItems = [URLQueryItem(name: "query", value: search)]
        var urlComps = URLComponents(string: "https://api.themoviedb.org/3/search/movie")
        urlComps?.queryItems = queryItems
        guard let result = urlComps?.url else { return }
        self.makeRequest(url: result, type: .movie)
    }
    
    /// Fetches a page of series items.
    
    func fetchSeries(search: String?) {
        guard let search = search else {
            self.makeRequest(url: URL(string: "https://api.themoviedb.org/3/tv/popular?language=en-US&page=1")!, type: .series)
            return }
        let queryItems = [URLQueryItem(name: "query", value: search)]
        var urlComps = URLComponents(string: "https://api.themoviedb.org/3/search/tv")
        urlComps?.queryItems = queryItems
        guard let result = urlComps?.url else { return }
        self.makeRequest(url: result, type: .series)
    }
    
    /// Makes the request to the API. Takes in a URL, and the type of item. (Movie, or series.)
    
    func makeRequest(url: URL, type: PickerType) {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2ZDcwZTRjYWQzMTcwN2IxZmRjYmQ1NTc2MThiNWI1NiIsInN1YiI6IjY1ODNlNmIyZmJlMzZmNGFkYzdmNjAyOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HYT0086y3sTAwgk5fkhkWJ_1WJD3l5dQ2TrcErJKjl8"
        ]
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            if type == .movie {
                self?.decodeMovies(data: data)
            } else {
                self?.decodeSeries(data: data)
            }
        }
        task.resume()
    }
    
    /// A function in charge of decoding data into movie objects.
    
    func decodeMovies(data: Data) {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(MovieResult.self, from: data)
            DispatchQueue.main.async {
                self.movies = result.results
            }
        }
        catch {
           print(error)
        }
    }
    
    /// A function which takes data and converts it into series objects, which are slightly different than movie objects. They are then parsed as movie objects and added to the movies array.
    
    func decodeSeries(data: Data) {
        do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            print(jsonResult)
                        }
            let decoder = JSONDecoder()
            let result = try decoder.decode(SeriesResult.self, from: data)
            DispatchQueue.main.async {
                let series = result.results
                self.movies = []
                for index in series {
                    self.movies.append(Movie(adult: index.adult, backdrop_path: index.backdrop_path, genre_ids: index.genre_ids, id: index.id, original_language: index.original_language, original_title: index.original_name, overview: index.overview, popularity: index.popularity, poster_path: index.poster_path, release_date: index.first_air_date, title: index.name, video: false, vote_average: index.vote_average, vote_count: index.vote_count))
                }
            }
        }
        catch {
           print(error)
        }
    }
    
    
}
