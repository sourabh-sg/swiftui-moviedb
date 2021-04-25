//
//  SearchView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchString = ""
    @ObservedObject var searchManager = SearchResultsData(search: "")
    
    var body: some View {
        
        NavigationView{
            VStack {
                SearchBar(text: $searchString)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                
                if searchString.count > 2 {
                    
                    
                    
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
        SearchView(searchManager: SearchResultsData(search: ""))
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
