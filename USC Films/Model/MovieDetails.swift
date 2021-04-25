//
//  MovieDetails.swift
//  USC Films
//
//  Created by Sourabh Gapate on 22/04/21.
//

import Foundation
import SwiftyJSON

struct MovieDetails: JSONable {
    
    var id: Int
    var title: String
    var rating: Float // Out of 10
    var releaseDate: String
    var image: String
    var backdropImage: String
    var overview: String
    var genres = [String]()
    
    init?(parameter: JSON) {
        id = parameter["id"].intValue
        title = parameter["title"].stringValue
        rating = parameter["vote_average"].floatValue
        releaseDate = parameter["release_date"].stringValue
        image = parameter["poster_path"].stringValue
        if parameter["backdrop_path"].stringValue != "" {
            backdropImage = parameter["backdrop_path"].stringValue
        } else {
            backdropImage = image
        }
        overview = parameter["overview"].stringValue
        // Get genres
        
        let genreJson = parameter["genres"]
        let reviewJson = genreJson.arrayValue
        for element in reviewJson {
            for (key,value):(String, JSON) in element {
                if key == "name" {
                    self.genres.append(value.stringValue)
                }
            }
        }
    }
}

