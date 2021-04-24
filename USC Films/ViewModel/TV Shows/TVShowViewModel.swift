//
//  TVShowViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 24/04/21.
//

import Foundation

struct TVShowViewModel {
    var id : Float
    var title: String
    var rating: String
    var releaseYear: String
    var image: String
    var backdropImage: String
    
    init(tvShowModel: TVShow) {
        self.id = tvShowModel.id
        self.title = tvShowModel.title
        // Convert ratings to 5
        self.rating = "\(tvShowModel.rating * 0.5)"
        // Fetch year from release date - first 4 letters
        let str = tvShowModel.releaseDate
        let index = str.index(str.startIndex, offsetBy: 4)
        self.releaseYear = "(" + String(str[..<index]) + ")"
        // Image URL
        // https://image.tmdb.org/t/p/w500/poster_path
        self.image = "http://image.tmdb.org/t/p/w500/" + tvShowModel.image
        self.backdropImage = "http://image.tmdb.org/t/p/w500/" + tvShowModel.backdropImage
    }
}
