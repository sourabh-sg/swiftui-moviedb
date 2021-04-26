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
    @Published var didLoadMovieDetails = false
    private var apiService = APIService()
    
    func getData(for id: String, isMovie: Bool) {
        self.apiService.getMovieDetails(for: id, isMovie: isMovie, completion: { (details) in
            self.didLoadMovieDetails = true
            if details != nil {
                self.basicDetails = details!
            }
        })
    }
}
