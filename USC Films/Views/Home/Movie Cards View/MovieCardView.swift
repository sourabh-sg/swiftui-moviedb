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
    
    // Toast
    @Binding var showToast : Bool
    @Binding var toastMessage : String
    
    var watchList =  WatchListViewModel()
    
    /*
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
    }
 */
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            KFImage(URL(string: self.movieViewModel.image)!)
                .placeholder {
                    Image("movie_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
                .resizable()
                .frame(width: 94, height: 140, alignment: .center)
                .cornerRadius(10)
            
            VStack(alignment: .center) {
                Text(self.movieViewModel.title)
                    .font(Font.system(size: 12))
                    .fontWeight(.heavy)
//                    .foregroundColor(.black)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Text(self.movieViewModel.releaseYear)
                    .font(Font.system(size: 12))
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
            }.frame(width: 94)
            
            Spacer()
                        
        }
        .background(Color.white)
        .contentShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .contextMenu {
            Button(action: {

                if isBookmarked {
                    watchList.removeFromWatchList(id: movieViewModel.id)
                    // Show toast
                    toastMessage = "\(movieViewModel.title) was removed from Watchlist"
                    showToast = true
                } else {
                    watchList.addToWatchList(id:movieViewModel.id, image: movieViewModel.image, mediaType: movieViewModel.mediaType, title: movieViewModel.title)
                    // Show toast
                    toastMessage = "\(movieViewModel.title) was added to Watchlist"
                    showToast = true
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
//                    .foregroundColor(.black)
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
