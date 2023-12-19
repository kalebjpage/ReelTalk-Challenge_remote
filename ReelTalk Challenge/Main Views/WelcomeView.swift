//
//  WelcomeView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

extension Color {
    public static let customTint = Color(red: 0.992, green: 0.656, blue: 0.142)
}

struct WelcomeView: View {
    @State private var logInPressed = false
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
                TabView {
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
                HStack(alignment: .top) {
                    Subtitle(text: "Already have an account?")
                        .bold()
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.5)) {
                            logInPressed = true
                        }
                    }, label: {
                        Text("Log in")
                            .foregroundColor(.customTint)
                    })
                    
                }
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
