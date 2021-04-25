//
//  SearchView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct SearchView: View {
    @State var searchString = ""
    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $searchString)
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                
                if searchString.count > 2 {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach (0..<5) { _ in
                                NavigationLink(
                                    destination: MovieDetailsView(id: "12345")) {
                                    SearchResultMovieCard()
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
