//
//  Actor.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftyJSON

struct Actor: JSONable {
    
    var name: String
    var image: String
    
    init(parameter: JSON) {
        self.name = parameter["name"].stringValue
        self.image = parameter["profile_path"].stringValue
    }
    
}
