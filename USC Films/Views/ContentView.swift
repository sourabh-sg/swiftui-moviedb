//
//  ContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(2)
            
            WatchListView(watchListArray: [])
                .tabItem {
                    Image(systemName: "heart")
                    Text("WatchList")
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
