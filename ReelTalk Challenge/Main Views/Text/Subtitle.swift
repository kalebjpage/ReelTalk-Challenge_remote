//
//  SystemText.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/18/23.
//

import SwiftUI

struct Subtitle: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Avenir Next", size: 17))
            .foregroundColor(Color.white)
    }
}

#Preview {
    Subtitle(text: "Hello World!")
}
