//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    var movieViewModel: MovieViewModel
    
    @State var isBookmarked = false
    @State var bookmarkImage = "bookmark"
    @State var bookmarkMenuText = "Add to WatchList"
    
    var watchList =  WatchListViewModel()
    
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            KFImage(URL(string: self.movieViewModel.image)!)
                .placeholder {
                    Image("movie_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text(self.movieViewModel.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text(self.movieViewModel.releaseYear)
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            Spacer()
            
        }
        .background(Color.white)
        .contextMenu {
            Button(action: {

                if isBookmarked {
                    watchList.removeFromWatchList(id: movieViewModel.id)
                } else {
                    watchList.addToWatchList(id:movieViewModel.id, image: movieViewModel.image, mediaType: movieViewModel.mediaType)
                }
                
                isBookmarked.toggle()
                
            }) {
                Label((isBookmarked ? "Remove from WatchList" : "Add to WatchList"), systemImage: (isBookmarked ? "bookmark.fill" : "bookmark"))
                    .foregroundColor((isBookmarked ? Color.blue : Color.black))
            }
                        
            let id = String(self.movieViewModel.id)
            
            // FB Share URL
            let fbUrlString = "https://www.facebook.com/sharer/sharer.php?u=https://www.themoviedb.org/movie/\(id)"
            // Twitter Share URL
            let twitUrlString = "https://twitter.com/intent/tweet?text=Check out this link&url=https://www.themoviedb.org/movie/\(id)&hashtags=CSCI571USCFilms"
            
            // Link view for FB Share
            Link(destination: URL(string: fbUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!) {
                Label("Share on Facebook", image: "facebook-app-symbol")
            }
            
            // Link view for Twitter Share
            Link(destination: URL(string: twitUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!) {
                Label("Share on Twitter", image: "twitter")
                    .foregroundColor(.black)
            }
        }.onAppear(perform: {
            isBookmarked = watchList.isBookmarked(movie: movieViewModel.id)
        })

    }
}

/*
struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(imageName: "tomandjerry", movie: Movie())
    }
}
*/
