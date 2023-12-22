import SwiftUI

/// A view that displays a movie image. Appearance changes on select, and can be configured to be changed to a smaller image once selected.

struct MovieImageView: View {
    @EnvironmentObject var counter: Counter
    @EnvironmentObject var buttonController: ContinueButtonController
    @State var isSelected: Bool = false
    @State var opacity: CGFloat = 1.0
    @State var size: CGFloat = 1.0
    let url: URL
    let movie: Movie
    let smallImage: Bool
    let pickerType: PickerType
                                
    var body: some View {
            ZStack {
                    Button(action: {
                        if pickerType == .movie && self.smallImage != true {
                            self.selectMovie()
                        } else {
                            self.selectSeries()
                        }
                    }, label: {
                        
                        AsyncImage(url: url) { movieImage in
                            if !smallImage {
                                    movieImage
                                        .resizable()
                                        .frame(maxHeight: 200)
                                        .onAppear {
                                            if self.pickerType == .movie {
                                                if self.counter.moviesSelected.firstIndex(of: self.movie) != nil {
                                                    self.isSelected = true
                                                }
                                            } else {
                                                if self.counter.seriesSelected.firstIndex(of: self.movie) != nil {
                                                    self.isSelected = true
                                                }
                                            }
                                        }
                            } else {
                                        movieImage
                                            .frame(width: 48, height: 72)
                                            .scaleEffect(0.5)
                                            .onAppear {
                                                withAnimation(.easeIn(duration: 0.1)) {
                                                    self.size = 1.0
                                                    self.opacity = 1.0
                                                }
                                            }
                            }
                            
                        } placeholder: {
                            if !smallImage {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ProgressView()
                                }
                                .frame(height: 200)
                            } else {
                                ZStack {
                                    Color.gray.opacity(0.5)
                                    ProgressView()
                                }
                                .frame(width: 48, height: 72)
                            }
                        }
                    })
                    .disabled(self.smallImage)
                    if self.isSelected {
                        GeometryReader { g in
                            Image(systemName: "checkmark.circle.fill")
                                .scaleEffect(2)
                                .foregroundStyle(Color.customTint)
                                .offset(x: g.size.width - 40, y: 20)
                        }
                    }
                }
            .border(self.isSelected ? Color.customTint : .clear, width: 5)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .scaleEffect(self.size)
            .opacity(self.opacity)
    }
    
    func removeItem() {
        self.isSelected = false
        if pickerType == .movie {
            if let index = self.counter.moviesSelected.firstIndex(of: self.movie) {
                self.counter.moviesSelected.remove(at: index)
            }
        } else {
            if let index = self.counter.moviesSelected.firstIndex(of: self.movie) {
                self.counter.seriesSelected.remove(at: index)
            }
        }
    }
    
    func selectMovie() {
        if self.isSelected {
            if let index = self.counter.moviesSelected.firstIndex(of: movie) {
                self.counter.moviesSelected.remove(at: index)
            }
                self.isSelected = false
            
        } else if self.counter.moviesSelected.count < 5 {
            counter.moviesSelected.append(self.movie)
                self.isSelected = true
        }
        
        if counter.moviesSelected.count == 5 {
            self.buttonController.isDisabled = false
        } else {
            self.buttonController.isDisabled = true
        }
    }
    
    func selectSeries() {
        if self.isSelected {
            if let index = self.counter.seriesSelected.firstIndex(of: movie) {
                self.counter.seriesSelected.remove(at: index)
            }
                self.isSelected = false
            
        } else if self.counter.seriesSelected.count < 5 {
            counter.seriesSelected.append(self.movie)
                self.isSelected = true
        }
        
        if counter.seriesSelected.count == 5 {
            self.buttonController.isDisabled = false
        } else {
            self.buttonController.isDisabled = true
        }
    }
}
