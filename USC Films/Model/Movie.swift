//
//  Movie.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation

// Codable protocol: By conforming your data models to Codable/Decodable, you get nearly automatic conversion from JSON to your data models and back.
struct Movie: Decodable {
    
    let id : Float //= 429617
    let title: String // = "Spider-Man: Far from Home"
    let rating: Float // = 7.5 // Out of 10
    let releaseDate: String // = "2019-06-28"
    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    let image: String
    
    // Image URL
    // http://image.tmdb.org/t/p/w500/poster_path
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case rating = "vote_average"
        case releaseDate = "release_date"
        case genre = "genre_ids"
        case image = "poster_path"
      }
    
}
