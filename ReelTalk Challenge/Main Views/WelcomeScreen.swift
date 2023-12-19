//
//  FirstView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var logInPressed = false
    
    var body: some View {
        if logInPressed == false {
            
            VStack(alignment: .center) {
                Image("welcome1")
                    .padding()
                Image("welcomeText1")
                Text("Welcome to Reel Talk, a community designed for true film and TV Show Fans")
                    .font(.custom("Avenir Next", size: 17))
                    .multilineTextAlignment(.center)
                    .padding()
                HStack {
                    Text("Already have an account?")
                    
                    Button(action: {
                        logInPressed = true
                    }, label: {
                        Text("Log in")
                            .foregroundColor(Color(red: 0.992, green: 0.656, blue: 0.142))
                            
                    })
                }
            }
        } else {
            
        }
    }
}

#Preview {
    WelcomeScreen()
}
