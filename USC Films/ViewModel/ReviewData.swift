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
    private var apiService = APIService()
    
    func getData(for id: String, isMovie: Bool) {
        self.apiService.getMovieReviews(for: id, isMovie: isMovie, completion: { (reviewsArray) in
            self.reviews = reviewsArray
        })
    }
}
