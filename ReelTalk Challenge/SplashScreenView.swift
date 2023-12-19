//
//  ContentView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack {
                Image("Final Proposed Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("REEL TALK")
                    .font(.title)
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 200)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
