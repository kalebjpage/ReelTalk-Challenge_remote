//
//  ContentView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            if isActive == true {
                FirstView()
            } else {
                VStack {
                    VStack {
                        Image("Final Proposed Logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("REEL TALK")
                            .font(.custom("Avenir Next", size: 27))
                            .foregroundColor(Color.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    .frame(width: 200, height: 200)
                    .padding()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
