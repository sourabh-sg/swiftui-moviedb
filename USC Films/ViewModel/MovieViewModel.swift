//
//  MovieViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation

class MovieViewModel: NSObject {
    
    var id : Float //= 429617
    var title: String // = "Spider-Man: Far from Home"
    var rating: String // = 7.5 // Out of 10
    var releaseYear: String // = "2019-06-28"
//    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    var image: String
    var backdropImage: String
    
    init(movieModel: Movie) {
        self.id = movieModel.id
        self.title = movieModel.title
        // Convert ratings to 5
        self.rating = "\(movieModel.rating * 0.5)"
        // Fetch year from release date - first 4 letters
        let str = movieModel.releaseDate
        let index = str.index(str.startIndex, offsetBy: 4)
        self.releaseYear = "(" + String(str[..<index]) + ")"
        // Image URL
        // https://image.tmdb.org/t/p/w500/poster_path
        self.image = "http://image.tmdb.org/t/p/w500/" + movieModel.image
        self.backdropImage = "http://image.tmdb.org/t/p/w500/" + movieModel.backdropImage
        
    }
    
    
}
