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
            VStack {
                SearchBar(text: $searchString, searchManager: searchManager)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                
                if searchManager.searchResults.count > 0 && searchString.count > 2 {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            // Show max 20 results
                            let count = min(20, searchManager.searchResults.count)
                            ForEach (0..<count) { i in
                                // Check for index out of bound
                                if i < searchManager.searchResults.count {
                                    let searchResult = searchManager.searchResults[i]
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
                } else {
                    HStack(alignment: .center) {
                        // Two spacers added either side to align text at the center
                        Spacer()
                        Text("No Results")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        Spacer()
                    }.padding(30)
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
