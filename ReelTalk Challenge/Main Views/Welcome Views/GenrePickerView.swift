//
//  GenrePickerView.swift
//  ReelTalk Challenge
//
//  Created by Kaleb Page on 12/19/23.
//

import SwiftUI

@MainActor class GenreCounter: ObservableObject {
    @Published var amountSelected = 0
}

struct TabIndicator: View {
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 1 ? Color.customTint : .gray)
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 2 ? Color.customTint : .gray)
            Rectangle()
                .frame(height: 4)
                .foregroundColor(currentPage == 3 ? Color.customTint : .gray)
        }
    }
}

struct GenrePickerView: View {
    @StateObject var genreCounter = GenreCounter()
    @State var movieCounter: Int = 0
    @State var currentPage = 1
    
    var body: some View {
        VStack {
            
            Spacer()
            TabIndicator(currentPage: $currentPage)
                .padding(.horizontal, 40.0)
            Spacer()
            
            if currentPage == 1 {
                VStack {
                    Text("Select your top 3 genres for movies and TV")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    Subtitle(text: "\(genreCounter.amountSelected)/3 selected", color: .white)
                }
                Spacer()
                HStack {
                    GenreList()
                        .frame(height: 300)
                        .environmentObject(genreCounter)
                    Spacer()
                }
                .padding()
            }
            Spacer()
            Button(action: {
                if self.currentPage < 3 {
                    self.currentPage += 1
                }
            }, label: {
                ContinueButton()
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    .padding(.horizontal, 35.0)
            })
            .disabled(genreCounter.amountSelected < 3)
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color("background")
            .ignoresSafeArea()
        GenrePickerView()
//        GenreBubble(genre: "Action")
//        GenreList()
    }
}

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
