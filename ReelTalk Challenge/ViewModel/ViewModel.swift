import SwiftUI

class ViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func fetch(search: String?) {
        guard let search = search else {
            self.makeRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")!)
            return }
        let queryItems = [URLQueryItem(name: "query", value: search)]
        var urlComps = URLComponents(string: "https://api.themoviedb.org/3/search/movie")
        urlComps?.queryItems = queryItems
        guard let result = urlComps?.url else { return }
        self.makeRequest(url: result)
    }
    
    func makeRequest(url: URL) {
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
            do {
//                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
//                            print(jsonResult)
//                        }
                let decoder = JSONDecoder()
                let result = try decoder.decode(Result.self, from: data)
                DispatchQueue.main.async {
                    self?.movies = result.results
                }
            }
            catch {
               print(error)
            }
        }
        task.resume()
    }
}
