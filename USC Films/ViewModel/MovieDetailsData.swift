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
    var isMovie: Bool
    
    init(id: String, isMovie: Bool) {
        self.id = id
        self.isMovie = isMovie
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieDetails(for: self.id, isMovie: self.isMovie, completion: { (details) in
            if details != nil {
                self.basicDetails = details!
            }
        })
    }
}
