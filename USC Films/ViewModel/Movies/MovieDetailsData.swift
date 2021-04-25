//
//  MovieDetailsData.swift
//  USC Films
//
//  Created by Sourabh Gapate on 24/04/21.
//

import Foundation
import SwiftUI

class MovieDetailsData: ObservableObject {
    @Published var basicDetails: MovieDetailsViewModel?
    private var apiService: APIService!
    var id: String
    
    init(id: String) {
        self.id = id
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieDetails(for: self.id, completion: { (details) in
            if details != nil {
                self.basicDetails = details!
            }
        })
    }
}
