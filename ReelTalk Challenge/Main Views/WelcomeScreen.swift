//
//  FirstView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var logInPressed = false
    let image: String
    
    var body: some View {
        if logInPressed == false {
            
            VStack(alignment: .center) {
                Spacer()
                Image(image)
                    .padding()
                Subtitle(text: "Welcome to Reel Talk, a community designed for true film and TV Show Fans")
                    .font(.custom("Avenir Next", size: 17))
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
                HStack(alignment: .center) {
                    Subtitle(text: "Already have an account?")
                        .bold()
                    Button(action: {
                        logInPressed = true
                    }, label: {
                        Text("Log in")
                            .foregroundColor(Color(red: 0.992, green: 0.656, blue: 0.142))
                    })
                }
                Spacer()
            }
        } else {
            LogInView()
        }
    }
}

#Preview {
    WelcomeScreen(image: "welcome1")
}
