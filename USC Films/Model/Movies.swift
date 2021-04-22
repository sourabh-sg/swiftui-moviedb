//
//  Movies.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation
import SwiftyJSON

class Movies: JSONable {
//    let count: Int
    let all: [Any]
    
    required init?(parameter: JSON) {
        all = parameter["results"].arrayValue
    }
    /*
    enum CodingKeys:  String, CodingKey {
//        case count
        case all = "results"
    }*/
}

