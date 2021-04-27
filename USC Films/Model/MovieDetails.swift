//
//  MovieDetails.swift
//  USC Films
//
//  Created by Sourabh Gapate on 22/04/21.
//

import Foundation
import SwiftyJSON

struct MovieDetails: JSONable, Identifiable {
    
    var id: Int
    var title: String
    var rating: Float // Out of 10
    var releaseDate: String
    var image: String
    var backdropImage: String
    var overview: String
    var genres = [String]()
    var videoTrailerKey: String = ""
    var videoTeaserKey: String = ""
    
    init?(parameter: JSON) {
        id = parameter["id"].intValue
        if !parameter["title"].stringValue.isEmpty {
            title = parameter["title"].stringValue
        } else {
            title = parameter["name"].stringValue
        }
        rating = parameter["vote_average"].floatValue
        if !parameter["release_date"].stringValue.isEmpty {
            releaseDate = parameter["release_date"].stringValue
        } else {
            releaseDate = parameter["first_air_date"].stringValue
        }
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
        
        // Get video trailer and teaser ids
        let videoResultJson = parameter["videos"]["results"]
        let videoJson = videoResultJson.arrayValue
        for element in videoJson {
            if element["type"].stringValue == "Trailer " {
                self.videoTrailerKey = element["key"].stringValue
            }
            if element["type"].stringValue == "Teaser" {
                self.videoTeaserKey = element["key"].stringValue
            }
        }
    }
}

