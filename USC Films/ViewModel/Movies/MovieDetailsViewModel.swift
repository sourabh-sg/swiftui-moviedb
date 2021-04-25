//
//  MovieDetailsViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation

struct MovieDetailsViewModel {
    
    var id : String
    var title: String
    var rating: String
    var releaseYear: String
    var image: String
    var backdropImage: String
    var overview: String
    var genre: String
    var releaseYearAndGenreString: String
    
    init(movieDetailsModel: MovieDetails) {
        self.id = "\(movieDetailsModel.id)"
        self.title = movieDetailsModel.title
        // Convert ratings to 5
        self.rating = "\(movieDetailsModel.rating * 0.5)"
        // Fetch year from release date - first 4 letters
        let str = movieDetailsModel.releaseDate
        var releaseYearString = ""
        if str.count  > 0 {
            let index = str.index(str.startIndex, offsetBy: 4)
            releaseYearString = String(str[..<index])
        }
            
        self.releaseYear = releaseYearString
        
        self.overview = movieDetailsModel.overview
        // Image URL
        // https://image.tmdb.org/t/p/w500/poster_path
        self.image = "http://image.tmdb.org/t/p/w500/" + movieDetailsModel.image
        self.backdropImage = "http://image.tmdb.org/t/p/w500/" + movieDetailsModel.backdropImage
        
        // Convert string array to string
        self.genre  = movieDetailsModel.genres.joined(separator: ", ")
        
        if self.genre.count > 0 && releaseYearString.count > 0 {
            self.releaseYearAndGenreString  = releaseYearString + " | " + self.genre
        } else if releaseYearString.count > 0 {
            self.releaseYearAndGenreString = releaseYearString
        } else if self.genre.count > 0 {
            self.releaseYearAndGenreString = self.genre
        } else {
            self.releaseYearAndGenreString = ""
        }
        
    }
    
    
}

