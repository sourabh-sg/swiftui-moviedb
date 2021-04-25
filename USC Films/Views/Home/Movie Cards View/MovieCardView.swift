//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    @State var movieViewModel: MovieViewModel
    
    @State var title: String = ""
    @State var releaseYear: String = ""
    @State var image: String = ""
    
    @State var isBookmarked = false
    @State var bookmarkImage = "bookmark"
    @State var bookmarkMenuText = "Add to WatchList"
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            KFImage(URL(string: self.movieViewModel.image)!)
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
                isBookmarked.toggle()
                bookmarkImage = (isBookmarked ? "bookmark.fill" : "bookmark")
                bookmarkMenuText = (isBookmarked ? "Remove from WatchList" : "Add to WatchList")
            }) {
                Label(bookmarkMenuText, systemImage: bookmarkImage)
            }
            .foregroundColor(.black)
                        
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
        }

    }
}

/*
struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(imageName: "tomandjerry", movie: Movie())
    }
}
*/
