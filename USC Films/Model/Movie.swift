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
struct Movie: JSONable {
    
    var id : Float
    var title: String
    var rating: Float // Out of 10
    var releaseDate: String
//    let genre: [Float] // = ["Action", "Adventure", "Science Fiction"]
    var image: String
    var backdropImage: String
    
    init(parameter: JSON) {
        id = parameter["id"].floatValue
        title = parameter["title"].stringValue
        rating = parameter["vote_average"].floatValue
        releaseDate = parameter["release_date"].stringValue
//        genre = parameter["genre_ids"]
        image = parameter["poster_path"].stringValue
        if parameter["backdrop_path"].stringValue != "" {
            backdropImage = parameter["backdrop_path"].stringValue
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
