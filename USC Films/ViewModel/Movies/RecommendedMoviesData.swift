//
//  RecommendedMoviesData.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftUI

class RecommendedMoviesData: ObservableObject {
    @Published var movies = [MovieViewModel]()
    private var apiService: APIService!
    var id: String
    
    init(id: String) {
        self.id = id
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieRecommendations(for: self.id) { (moviesData) in
            self.movies = moviesData
        }
    }
}

