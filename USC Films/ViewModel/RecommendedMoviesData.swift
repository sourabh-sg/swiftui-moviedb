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
    var isMovie: Bool
    
    init(id: String, isMovie: Bool) {
        self.id = id
        self.isMovie = isMovie
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieRecommendations(for: self.id, isMovie: self.isMovie) { (moviesData) in
            self.movies = moviesData
        }
    }
}

