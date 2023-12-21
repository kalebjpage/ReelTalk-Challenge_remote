//
//  MovieImageView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/21/23.
//

import SwiftUI

struct MovieImageView: View {
    let url: URL
                                
    var body: some View {
        
        AsyncImage(url: url) { movieImage in
            movieImage
                .resizable()
                .frame(maxHeight: 200)
        } placeholder: {
            ZStack {
                Color.gray.opacity(0.5)
                ProgressView()
            }
            .frame(height: 200)
        }

    }
}

#Preview {
    MovieImageView(url: URL(string: "https://image.tmdb.org/t/p/w500//ocA0ECiFoB4d1HITyEDQlLk7x84.jpg")!)
}
