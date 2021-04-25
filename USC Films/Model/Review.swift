//
//  Review.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftyJSON

struct Review: JSONable {
    
    var author: String
    var reviewDate: String
    var reviewText: String
    var rating: Float = 0
    
    init(parameter: JSON) {
        self.author = parameter["author"].stringValue
        self.reviewDate = parameter["created_at"].stringValue
        self.reviewText = parameter["content"].stringValue
        
        for (key,subJson):(String, JSON) in parameter["author_details"] {
            if key == "rating" {
                self.rating = subJson.floatValue
            }
        }
    }
    
}
