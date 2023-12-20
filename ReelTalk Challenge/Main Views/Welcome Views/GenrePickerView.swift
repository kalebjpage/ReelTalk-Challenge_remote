//
//  GenrePickerView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/19/23.
//

import SwiftUI

struct GenrePickerView: View {
    var body: some View {
        VStack {
            NavigationLink {
                Text("Movie Picker View")
            } label: {
                ContinueButton()
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        GenrePickerView()
    }
}
