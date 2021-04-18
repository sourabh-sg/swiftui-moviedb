//
//  Movie.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation

// Codable protocol: By conforming your data models to Codable/Decodable, you get nearly automatic conversion from JSON to your data models and back.

struct Movie: Decodable {
    let id : Int //= 429617
    let title: String // = "Spider-Man: Far from Home"
    let rating: Int // = 7.5 // Out of 10
    let releaseDate: String // = "2019-06-28"
    let genre: [String] // = ["Action", "Adventure", "Science Fiction"]
    
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case rating
        case releaseDate = "release_date"
        case genre
      }
    
}


