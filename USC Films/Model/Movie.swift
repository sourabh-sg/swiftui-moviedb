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

struct Movie: JSONable, Identifiable {
    
    var id : Int
    var title: String
    var rating: Float // Out of 10
    var releaseDate: String
    var image: String
    var backdropImage: String
    var mediaType: String // "movie" or "tv"
    
    init(parameter: JSON) {
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
        mediaType = parameter["media_type"].stringValue
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
