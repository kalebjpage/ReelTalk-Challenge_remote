import SwiftUI

/// The second view in the application. The WelcomeView has 3 separate nested WelcomeScreens. Once a user swipes to the right, the screen changes according the the currentTab variable.

struct WelcomeView: View {
    @StateObject var buttonController: ContinueButtonController = ContinueButtonController()
    @State private var continuePressed = false
    @State private var currentTab = 0
    private let welcomeScreenData = [
        ("welcome1", "Welcome to Reel Talk, a community designed for true film and TV Show Fans"),
        ("welcome2", "Discover and discuss your favorite films, movies, and shows"),
        ("welcome3", "Let's get started!")
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("background")
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    TabView(selection: $currentTab) {
                        ForEach(0...2, id: \.self){ id in
                            WelcomeScreen(image: welcomeScreenData[id].0, text: welcomeScreenData[id].1)
                        }
                    }
                    .frame(height: 500)
                    .tabViewStyle(.page)
                    .onAppear {
                        self.setupAppearance()
                    }
                    Spacer()
                    VStack {
                        if self.currentTab == 2 {
                            NavigationLink {
                                GenrePickerView()
                                    .toolbarRole(.editor)
                            } label: {
                                ContinueButton(text: "Continue")
                                    .environmentObject(buttonController)
                                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                    .padding(.bottom)
                            }
                        }
                        HStack(alignment: .top) {
                            CustomText(text: "Already have an account?", color: .white)
                                .bold()
                            NavigationLink {
                                LogInView()
                                    .toolbarRole(.editor)
                            } label: {
                                CustomText(text: "Log in", color: .customTint)
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    Spacer()
                }
            }
        }
        .tint(.white)
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.992, green: 0.656, blue: 0.142, alpha: 1)
    }
}
    
#Preview {
    WelcomeView()
}
