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
            ProgressView()
        }

    }
}

#Preview {
    MovieImageView(url: URL(string: "https://image.tmdb.org/t/p/w500//ocA0ECiFoB4d1HITyEDQlLk7x84.jpg")!)
}
