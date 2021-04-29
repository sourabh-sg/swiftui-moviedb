//
//  MovieViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation
import SwiftyJSON

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
        self.rating = String(format: "%.1f", round(movieModel.rating * 0.5 * 10)/10)
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
//        self.image = "http://image.tmdb.org/t/p/w500/" + movieModel.image
//        self.backdropImage = "http://image.tmdb.org/t/p/w500/" + movieModel.backdropImage
        self.image = movieModel.image
        self.backdropImage = movieModel.backdropImage
        // Media type: "movie" or "tv"
        self.mediaType = movieModel.mediaType
    }
}


// Sample data - Add few sample movie view model data for use in view previews
//  This post suggests to create extension for preview data: https://useyourloaf.com/blog/swiftui-preview-data/
extension MovieViewModel {
    // Kaho na pyaar hai VM
    static let knphVM = MovieViewModel(movieModel: Movie(parameter: JSON(["id": "16987", "poster_path": "http://image.tmdb.org/t/p/w500//alALytPcaZyQkzOjnRgHMSRv8fq.jpg", "media_type": "movie", "name": "Kaho Naa... Pyaar Hai", "vote_average": 6.6, "date": "2000-14-01", "backdrop_path": "http://image.tmdb.org/t/p/w500/https://image.tmdb.org/t/p/original/cdhSX4PHnE3WEQsqlOt7qciaApV.jpg"])))
    
    // Two states VM
    static let twostatesVM = MovieViewModel(movieModel: Movie(parameter: JSON(["id": "259720", "poster_path": "http://image.tmdb.org/t/p/w500//oiVcEZmvXMbDzpYTSzXKi03N9sl.jpg", "media_type": "movie", "name": "2 States", "vote_average": 6.6, "date": "2014-18-04", "backdrop_path": "https://image.tmdb.org/t/p/original/ko21gTfAYegiLXKAZ9K5JGRJtWz.jpg"])))
    
    // Array of two movie VMs
    static let movies = [knphVM, twostatesVM]
    
}
