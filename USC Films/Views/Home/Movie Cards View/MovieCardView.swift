//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    @State var movieViewModel: MovieViewModel?
    @State var tvShowViewModel: TVShowViewModel?
    @State var isMovie: Bool = false
    
    @State var title: String = ""
    @State var releaseYear: String = ""
    @State var image: String = ""
    
    @State var isBookmarked = false
    @State var bookmarkImage = "bookmark"
    @State var bookmarkMenuText = "Add to WatchList"
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            KFImage(URL(string: (isMovie ? self.movieViewModel!.image : self.tvShowViewModel!.image))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text((isMovie ? self.movieViewModel!.title : self.tvShowViewModel!.title))
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text((isMovie ? self.movieViewModel!.releaseYear : self.tvShowViewModel!.releaseYear))
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            Spacer()
            
        }.contextMenu {
           
            Button(action: {
                isBookmarked.toggle()
                bookmarkImage = (isBookmarked ? "bookmark.fill" : "bookmark")
                bookmarkMenuText = (isBookmarked ? "Remove from WatchList" : "Add to WatchList")
            }) {
                Label(bookmarkMenuText, systemImage: bookmarkImage)
            }
            .foregroundColor(.black)
                        
            Button(action: {
                // Share on Twitter
            }) {
                Label("Share on Facebook", image: "facebook-app-symbol")
            }
            
            Button(action: {
                // Share on Twitter
            }) {
                Label("Share on Twitter", image: "twitter")
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
