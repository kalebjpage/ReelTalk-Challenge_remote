//
//  GenreBubble.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/21/23.
//

import SwiftUI

struct GenreBubble: View {
    @State var isSelected: Bool = false
    @EnvironmentObject var amountSelected: GenreCounter
    let genre: String
    
    var body: some View {
        Button(action: {
            if self.isSelected {
                self.isSelected = false
                self.amountSelected.amountSelected -= 1
            } else if amountSelected.amountSelected < 3 {
                self.isSelected = true
                self.amountSelected.amountSelected += 1
            }
        }, label: {
            Subtitle(text: genre, color: self.isSelected ? .black : .white)
                .bold()
                .padding(.horizontal, 25.0)
                .padding(.vertical, 5.0)
                .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                .background(self.isSelected ? .white : Color.clear)
                .mask(Capsule())
            
        })
    }
}

#Preview {
    GenreBubble(genre: "Action")
}
