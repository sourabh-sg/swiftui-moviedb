//
//  Movie.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation
import SwiftyJSON

// Codable protocol: By conforming your data models to Codable/Decodable, you get nearly automatic conversion from JSON to your data models and back.

protocol JSONable {
    init?(parameter: JSON)
}

//struct Movie: Decodable {
class Movie: JSONable {
    
    let id : Float //= 429617
    let title: String // = "Spider-Man: Far from Home"
    let rating: Float // = 7.5 // Out of 10
    let releaseDate: String // = "2019-06-28"
//    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    let image: String
    
    // Image URL
    // http://image.tmdb.org/t/p/w500/poster_path
    
    required init?(parameter: JSON) {
        id = parameter["id"].floatValue
        title = parameter["title"].stringValue
        rating = parameter["vote_average"].floatValue
        releaseDate = parameter["release_date"].stringValue
//        genre = parameter["genre_ids"]
        image = parameter["poster_path"].stringValue
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
