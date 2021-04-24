//
//  PopularTVShowsData.swift
//  USC Films
//
//  Created by Sourabh Gapate on 24/04/21.
//

import Foundation
import SwiftUI

class PopularTVShowsData: ObservableObject {
    @Published var shows = [TVShowViewModel]()
    private var apiService: APIService!
    
    init() {
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getPopularShows { (showsData) in
            self.shows = showsData
        }
    }
}
