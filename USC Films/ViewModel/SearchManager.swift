//
//  SearchManager.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftUI

class SearchResultsData: ObservableObject {
    @Published var searchResults = [MovieViewModel]()
    var searchQuery : String
    private var apiService = APIService()
    
    init(search: String) {
        self.searchQuery = search
        self.apiService = APIService()
    }
    
    func getResults() {
        if searchQuery.isEmpty {
            return
        }
        self.apiService.getSearchResults(for: searchQuery) { (results) in
            self.searchResults = results
        }
    }
}

