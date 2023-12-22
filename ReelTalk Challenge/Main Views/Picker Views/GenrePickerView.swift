import SwiftUI

/// This counter object keeps track of the amount of movies, series, and genres that a user has picked. It is shared between multiple views.

@MainActor class Counter: ObservableObject {
    @Published var genresSelected = 0
    @Published var moviesSelected: [Movie] = []
    @Published var seriesSelected: [Movie] = []
}

/// The main view in charge of selection. It nests the genre picker, movie picker, and series picker.

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
                        CustomText(text: "\(counter.genresSelected)/3 selected", color: .white)
                    }
                    Spacer()
                    HStack {
                        GenreList()
                            .frame(height: 300)
                            .environmentObject(counter)
                            .environmentObject(continueButtonController)
                    }
                } else if currentPage == 2 {
                    MoviePickerView(pickerType: .movie)
                        .transition(.backslide)
                        .environmentObject(counter)
                        .environmentObject(continueButtonController)
                } else if currentPage == 3 {
                    MoviePickerView(pickerType: .series)
                        .transition(.backslide)
                        .environmentObject(counter)
                        .environmentObject(continueButtonController)
                }
                Spacer()
                Button(action: {
                    if self.currentPage < 3 {
                        self.currentPage += 1
                    }
                }, label: {
                    if self.currentPage == 3 {
                        NavigationLink {
                            KeepItReelView()
                        } label: {
                            ContinueButton(text: "Continue")
                                .environmentObject(self.continueButtonController)
                                .background(Color.black)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                .padding(.horizontal, 35.0)
                        }
                        .disabled(self.continueButtonController.isDisabled)
                    } else {
                        ContinueButton(text: "Continue")
                            .environmentObject(self.continueButtonController)
                            .background(Color.black)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .padding(.horizontal, 35.0)
                    }
                })
                .disabled(counter.genresSelected < 3)
                .padding(.vertical)
                Button(action: {
                    if self.currentPage < 3 {
                        withAnimation {
                            self.currentPage += 1
                        }
                    }
                }, label: {
                    CustomText(text: "Skip", color: Color.customTint)
                })
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

