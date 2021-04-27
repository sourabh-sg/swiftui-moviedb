//
//  SearchView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchString = ""
    @ObservedObject var searchManager = SearchResultsData()
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading) {
                SearchBar(text: $searchString, searchManager: searchManager)
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                
                if searchManager.searchResults.count > 0 {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                                ForEach(searchManager.searchResults, id: \.self) { searchResult in
                                    // Find media type
                                    let mediaType = searchResult.mediaType
                                    let isMovie = (mediaType == "movie") ? true : false
                                    NavigationLink(
                                        destination: MovieDetailsView(id: searchResult.id, isMovie: isMovie)) {
                                        SearchResultMovieCard(movieVM: searchResult)
                                            
                                }
                            }
                        }
                    }
                }
                // Show No results if no results are returned for entered text (>2 chars)
                else if searchString.count > 2 {
                    HStack(alignment: .center) {
                        // Two spacers added either side to align text at the center
                        Spacer()
                        Text("No Results")
                        .font(.title)
                        .foregroundColor(.gray)
                        Spacer()
                    }
                }
                
                
                Spacer()
            }
            .navigationBarTitle("Search")
        }.background(Color.white)
    }

}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

/*
struct SearchResultsView: View {
    @Binding var searchManager: SearchResultsData
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                let count = self.searchManager.searchResults.count
                ForEach (0..<count) { i in
                    NavigationLink(
                        destination: MovieDetailsView(id: searchResult.id, isMovie: true)) {
                        SearchResultMovieCard(movieVM: searchResult)
                    }
                }
            }
        }
    }
}
*/
