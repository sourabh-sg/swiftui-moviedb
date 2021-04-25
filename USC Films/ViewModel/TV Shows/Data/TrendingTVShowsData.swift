//
//  TrendingTVShowsData.swift
//  USC Films
//
//  Created by Sourabh Gapate on 24/04/21.
//

import Foundation
import SwiftUI

class TrendingTVShowsData: ObservableObject {
    @Published var shows = [MovieViewModel]()
    private var apiService: APIService!
    
    init() {
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getTrendingShows { (showsData) in
            self.shows = showsData
        }
    }
}
