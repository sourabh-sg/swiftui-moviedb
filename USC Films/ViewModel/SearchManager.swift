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
    private var apiService = APIService()
    var debouncer = Debouncer(delay: 0.25)
    
    func getResults(for searchQuery: String) {
        if searchQuery.isEmpty {
            return
        }
        // Debouncer just delays the execution of the function called inside it
        debouncer.run {
            self.apiService.getSearchResults(for: searchQuery) { (results) in
                self.searchResults = results
            }
        }
    }
}

