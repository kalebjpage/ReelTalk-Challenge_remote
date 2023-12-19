import SwiftUI

struct WelcomeView: View {
    @State private var logInPressed = false
    @State private var continuePressed = false
    @State private var currentTab = 0
    private let colors: [Color] = [.red, .green, .blue]
    private let welcomeScreenData = [
        ("welcome1", "Welcome to Reel Talk, a community designed for true film and TV Show Fans"),
        ("welcome2", "Discover and discuss your favorite films, movies, and shows"),
        ("welcome3", "Let's get started!")
    ]
    
    var body: some View {
        if logInPressed {
                LogInView()
                .transition(.slide)
        } else {
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
                            ContinueButton(action: {
                                self.continuePressed = true
                            })
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                            .opacity(self.continuePressed ? 0.5 : 1)
                            .animation(.easeOut(duration: 0.2), value: self.continuePressed)
                            .padding(.bottom)
                        }
                        HStack(alignment: .top) {
                            Subtitle(text: "Already have an account?", color: .white)
                                .bold()
                            Button(action: {
                                withAnimation(.easeIn(duration: 0.5)) {
                                    logInPressed = true
                                }
                            }, label: {
                                Subtitle(text: "Log in", color: .customTint)
                            })
                            
                        }
                        .padding(.bottom)
                    }
                .padding(.horizontal)
                Spacer()
            }
        }
        
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(red: 0.992, green: 0.656, blue: 0.142, alpha: 1)
    }
    
}

#Preview {
    WelcomeView()
}
