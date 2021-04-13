//
//  WatchListMovieCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct WatchListMovieCard: View {
    var body: some View {
        Image("tomandjerry")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 109, height: 167, alignment: .center)
    }
}

struct WatchListMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        WatchListMovieCard()
    }
}
