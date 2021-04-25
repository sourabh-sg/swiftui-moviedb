//
//  NowPlayingViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 22/04/21.
//

import Foundation
import SwiftUI

class NowPlayingMoviesData: ObservableObject {
    @Published var movies = [MovieViewModel]()
    private var apiService: APIService!
    
    init() {
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getNowPlayingMovies { (moviesData) in
            self.movies = moviesData
        }
    }
}
