//
//  Movies.swift
//  USC Films
//
//  Created by Sourabh Gapate on 17/04/21.
//

import Foundation

//struct Movies: Decodable {
struct Movies {
    let count: Int
    let all: [Movie]
    
    enum CodingKeys:  String, CodingKey {
        case Count
        case all = "results"
    }
}
