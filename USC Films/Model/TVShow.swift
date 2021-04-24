//
//  TVShow.swift
//  USC Films
//
//  Created by Sourabh Gapate on 24/04/21.
//

import Foundation
import SwiftyJSON

struct TVShow: JSONable {
    var id : Int
    var title: String
    var rating: Float // Out of 10
    var releaseDate: String
    var image: String
    var backdropImage: String
    
    init(parameter: JSON) {
        id = parameter["id"].intValue
        title = parameter["name"].stringValue
        rating = parameter["vote_average"].floatValue
        releaseDate = parameter["first_air_date"].stringValue
//        genre = parameter["genre_ids"]
        image = parameter["poster_path"].stringValue
        if parameter["backdrop_path"].stringValue != "" {
            backdropImage = parameter["backdrop_path"].stringValue
        } else {
            backdropImage = image
        }
    }
    
    
}
