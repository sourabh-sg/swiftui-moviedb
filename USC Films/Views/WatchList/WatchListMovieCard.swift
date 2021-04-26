//
//  WatchListMovieCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct WatchListMovieCard: View {
    
    var watchListItem: WatchListItem
    
    var body: some View {
        KFImage(URL(string: watchListItem.image))
            .resizable()
            .placeholder {
                Image("movie_placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 109, height: 167)
            
    }
}

struct WatchListMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        let item = WatchListItem(id: "12345", image: "", mediaType: "movie")
        WatchListMovieCard(watchListItem: item)
    }
}
