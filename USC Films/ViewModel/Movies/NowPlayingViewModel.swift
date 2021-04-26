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
    @Published var didCompleteLoading = false
    private var apiService: APIService!
    
    init() {
        self.apiService = APIService()
    }
    
    func getData() {
        didCompleteLoading = false
        self.apiService.getNowPlayingMovies { (moviesData) in
            self.movies = moviesData
            self.didCompleteLoading = true
        }
    }
}
