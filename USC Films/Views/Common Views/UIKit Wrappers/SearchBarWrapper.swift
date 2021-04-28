//
//  SearchBarWrapper.swift
//  USC Films
//
//  Created by Sourabh Gapate on 28/04/21.
//

import Foundation
import SwiftUI

struct SearchBarWrapper: UIViewRepresentable {

    @Binding var text: String
    var searchManager: SearchResultsData

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String
        var searchManager: SearchResultsData

        init(text: Binding<String>, searchManager: SearchResultsData) {
            _text = text
            self.searchManager = searchManager
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
            // Only call search query when text has 3 or more characters
            if text.count > 2 {
                searchManager.getResults(for: text)
            }
        }
        
        // To show cancel button
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(true, animated: true)
        }
        // To hide cancel button
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.setShowsCancelButton(false, animated: true)
        }
        
        // Action for search bar cancel button
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // Disable search bar
            searchBar.resignFirstResponder()
            // Empty the text
            text = ""
            // Remove the searchResults VM
            searchManager.searchResults = [MovieViewModel]()
        }
        
        // Actionn for search bar search button
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            // Only call search query when text has 3 or more characters
            if text.count > 2 {
                searchManager.getResults(for: text)
            }
        }
    }

    func makeCoordinator() -> SearchBarWrapper.Coordinator {
        return Coordinator(text: $text, searchManager: searchManager)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBarWrapper>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.placeholder = "Search Movies, TVs..."
        // Show clear button when searchbar is in edit mode
        searchBar.searchTextField.clearButtonMode = .whileEditing
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBarWrapper>) {
        uiView.text = text
    }
}
