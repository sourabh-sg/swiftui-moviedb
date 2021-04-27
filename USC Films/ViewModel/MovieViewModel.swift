//
//  MovieViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation

struct MovieViewModel: Identifiable, Hashable {
    
    var id : String
    var title: String
    var rating: String
    var releaseYear: String
    var image: String
    var backdropImage: String
    var mediaType: String
    
    init(movieModel: Movie) {
        self.id = "\(movieModel.id)"
        self.title = movieModel.title
        // Convert ratings to 5
        // And show only one decimal digit (https://www.hackingwithswift.com/example-code/strings/how-to-specify-floating-point-precision-in-a-string)
        self.rating = String(format: "%.1f", (movieModel.rating * 0.5))
        // Fetch year from release date - first 4 letters
        let str = movieModel.releaseDate
        if str.count > 3 {
        let index = str.index(str.startIndex, offsetBy: 4)
        self.releaseYear = "(" + String(str[..<index]) + ")"
        } else {
            self.releaseYear = ""
        }
        // Image URL
        // https://image.tmdb.org/t/p/w500/poster_path
        self.image = "http://image.tmdb.org/t/p/w500/" + movieModel.image
        self.backdropImage = "http://image.tmdb.org/t/p/w500/" + movieModel.backdropImage
        // Media type: "movie" or "tv"
        self.mediaType = movieModel.mediaType
    }
}
