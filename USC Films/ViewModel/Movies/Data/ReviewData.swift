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
    
    init(id: String) {
        self.id = id
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieReviews(for: self.id, completion: { (reviewsArray) in
            self.reviews = reviewsArray
        })
    }
}
