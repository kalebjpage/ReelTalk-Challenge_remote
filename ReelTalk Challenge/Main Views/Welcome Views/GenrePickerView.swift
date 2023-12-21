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
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                            print(jsonResult)
                        }
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


@MainActor class GenreCounter: ObservableObject {
    @Published var amountSelected = 0
}

struct GenrePickerView: View {
    @StateObject var genreCounter = GenreCounter()
    @State var movieCounter: Int = 0
    @State var currentPage = 1
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                TabIndicator(currentPage: $currentPage)
                    .padding(.horizontal, 40.0)
                    .padding()
                Spacer()
                
                if currentPage == 1 {
                    VStack {
                        Text("Select your top 3 genres for movies and TV")
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.bottom)
                        Subtitle(text: "\(genreCounter.amountSelected)/3 selected", color: .white)
                    }
                    Spacer()
                    HStack {
                        GenreList()
                            .frame(height: 300)
                            .environmentObject(genreCounter)
                        Spacer()
                    }
                    .padding()
                } else if currentPage == 2 {
                    MoviePickerView(movieCounter: $movieCounter)
                }
                Spacer()
                Button(action: {
                    if self.currentPage < 3 {
                        self.currentPage += 1
                    }
                }, label: {
                    ContinueButton()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .padding(.horizontal, 35.0)
                })
                .disabled(genreCounter.amountSelected < 3)
                Spacer()
            }
        }
    }
}

#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        GenrePickerView()
    }
}

