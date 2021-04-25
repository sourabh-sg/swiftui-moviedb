//
//  ReviewData.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftUI

class ReviewData: ObservableObject {
    @Published var reviews: [ReviewViewModel]?
    private var apiService: APIService!
    var id: String
    var isMovie: Bool
    
    init(id: String, isMovie: Bool) {
        self.id = id
        self.isMovie = isMovie
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieReviews(for: self.id, isMovie: self.isMovie, completion: { (reviewsArray) in
            self.reviews = reviewsArray
        })
    }
}
