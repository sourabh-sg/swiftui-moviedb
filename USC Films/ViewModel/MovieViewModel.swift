//
//  MovieViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation

struct MovieViewModel {
    
    var id : String
    var title: String
    var rating: String
    var releaseYear: String
//    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    var image: String
    var backdropImage: String
    
    init(movieModel: Movie) {
        self.id = "\(movieModel.id)"
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
