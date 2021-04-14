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
                List {

                }

                Spacer()
            }
            .navigationBarTitle("Search")
        }
            
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
