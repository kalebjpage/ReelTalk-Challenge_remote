import SwiftUI

struct WelcomeView: View {
    @State private var continuePressed = false
    @State private var currentTab = 0
    private let colors: [Color] = [.red, .green, .blue]
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
                        setupAppearance()
                    }
                    Spacer()
                    VStack {
                        if self.currentTab == 2 {
                            NavigationLink {
                                SignUpView()
                                    .toolbarRole(.editor)
                            } label: {
                                CustomLabel(text: "Continue")
                                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                                    .padding(.bottom)
                            }
                        }
                        HStack(alignment: .top) {
                            Subtitle(text: "Already have an account?", color: .white)
                                .bold()
                            NavigationLink {
                                LogInView()
                                    .toolbarRole(.editor)
                            } label: {
                                Subtitle(text: "Log in", color: .customTint)
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
}
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.992, green: 0.656, blue: 0.142, alpha: 1)
    }

#Preview {
    WelcomeView()
}
