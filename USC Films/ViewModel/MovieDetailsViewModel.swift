//
//  MovieDetailsViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation

struct MovieDetailsViewModel: Identifiable {
    
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
        // And show only one decimal digit (https://www.hackingwithswift.com/example-code/strings/how-to-specify-floating-point-precision-in-a-string)
        self.rating = String(format: "%.1f", round(movieDetailsModel.rating * 0.5 * 10) / 10.0) // Show and round only the first decimal digit
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

struct VideoDetailsViewModel: Identifiable {
    
    var id : String
    var videoKey: String
    
    init(videoDetailsModel: VideoDetails) {
        self.id = "\(videoDetailsModel.id)"
        
        // Video key
        // First preference is to teaser, if not then trailer
        self.videoKey = (!videoDetailsModel.videoTrailerKey.isEmpty)  ? videoDetailsModel.videoTrailerKey : videoDetailsModel.videoTeaserKey
        
    }
}

