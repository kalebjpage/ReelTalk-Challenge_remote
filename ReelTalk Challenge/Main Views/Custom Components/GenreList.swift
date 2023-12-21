//
//  GenreList.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/21/23.
//

import SwiftUI

struct GenreList: View {
    var body: some View {
        VStack(alignment: .leading, content: {
                HStack {
                    GenreBubble(genre: "Action")
                    GenreBubble(genre: "Adventure")
                }
                HStack {
                    GenreBubble(genre: "Animation")
                    GenreBubble(genre: "Biography")
                }
                HStack {
                    GenreBubble(genre: "Comedy")
                    GenreBubble(genre: "Crime")
                }
                HStack {
                    GenreBubble(genre: "Documentary")
                    GenreBubble(genre: "Drama")
                }
                HStack {
                    GenreBubble(genre: "Family")
                    GenreBubble(genre: "Fantasy")
                    GenreBubble(genre: "History")
                }
                HStack {
                    GenreBubble(genre: "Horror")
                    GenreBubble(genre: "Mystery")
                    GenreBubble(genre: "Reality")
                }
                HStack {
                    GenreBubble(genre: "Romance")
                    GenreBubble(genre: "Sci-Fi")
                    GenreBubble(genre: "Sport")
                }
                HStack {
                    GenreBubble(genre: "Thriller")
                    GenreBubble(genre: "War")
                    GenreBubble(genre: "Western")
                }
            })
    }
    
}

#Preview {
    GenreList()
}
