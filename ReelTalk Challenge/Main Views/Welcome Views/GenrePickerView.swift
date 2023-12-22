import SwiftUI

@MainActor class Counter: ObservableObject {
    @Published var genresSelected = 0
    @Published var moviesSelected: [Movie] = []
    @Published var seriesSelected: [Movie] = []
}

@MainActor class ContinueButtonController: ObservableObject {
    @Published var isDisabled: Bool = false
}

struct GenrePickerView: View {
    @StateObject var counter = Counter()
    @StateObject var continueButtonController = ContinueButtonController()
    @State var currentPage = 1
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
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
                        Subtitle(text: "\(counter.genresSelected)/3 selected", color: .white)
                    }
                    Spacer()
                    HStack {
                        GenreList()
                            .frame(height: 300)
                            .environmentObject(counter)
                            .environmentObject(continueButtonController)
//                        Spacer()
                    }
//                    .padding()
                } else if currentPage == 2 {
                    MoviePickerView()
                        .environmentObject(counter)
                        .environmentObject(continueButtonController)
                }
                Spacer()
                Button(action: {
                    if self.currentPage < 3 {
                        self.currentPage += 1
                    }
                }, label: {
                    ContinueButton()
                        .environmentObject(self.continueButtonController)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .padding(.horizontal, 35.0)
                })
                .disabled(counter.genresSelected < 3)
                Spacer()
            }
        }
        .onAppear {
            self.continueButtonController.isDisabled = true
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

