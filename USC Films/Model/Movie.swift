//
//  Movie.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation
import SwiftyJSON

protocol JSONable {
    init?(parameter: JSON)
}

//struct Movie: Decodable {
class Movie: JSONable, Identifiable {
    
    let id : Float //= 429617
    let title: String // = "Spider-Man: Far from Home"
    let rating: Float // = 7.5 // Out of 10
    let releaseDate: String // = "2019-06-28"
//    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    let image: String
    let backdropImage: String
    
    // Image URL
    // https://image.tmdb.org/t/p/w500/poster_path
    
    required init?(parameter: JSON) {
        id = parameter["id"].floatValue
        title = parameter["title"].stringValue
        rating = parameter["vote_average"].floatValue
        releaseDate = parameter["release_date"].stringValue
//        genre = parameter["genre_ids"]
        image = "http://image.tmdb.org/t/p/w500/" + parameter["poster_path"].stringValue
        if parameter["backdrop_path"].stringValue != "" {
            backdropImage = "http://image.tmdb.org/t/p/w500/" + parameter["backdrop_path"].stringValue
        } else {
            backdropImage = image
        }
    }
}

extension JSON {
    func toType<T>(type: T?) -> Any? {
        if let baseObj = type as? JSONable.Type {
            if self.type == .array {
                var arrObject: [Any] = []
                for obj in self.arrayValue {
                    let object = baseObj.init(parameter: obj)
                    arrObject.append(object!)
                }
                return arrObject
            } else {
                let object = baseObj.init(parameter: self)
                return object!
            }
        }
        return nil
    }
}
