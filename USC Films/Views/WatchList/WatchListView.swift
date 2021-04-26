//
//  WatchListView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct WatchListView: View {
    var watchList = WatchListViewModel()
    @State private var dragOffset = CGSize.zero
    
//    @AppStorage("watchList") var username: String = ""
    
    var body: some View {
        NavigationView{
            VStack() {
                if watchList.list.count == 0 {
                    Text("Watchlist is empty")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .onAppear {
                            watchList.getWatchList()
                        }
                } else {
                    // Show watchlist movie cards, three in a row
                    ScrollView() {
                        VStack(spacing: 0) {
                            // Here first calculate how many rows will be needed to display all the movies
                            // = (total / 3)
                            // (+ 1, if total % 3 is non-zero)
                            ForEach(0..<5) { i in
                                HStack(spacing: 3) {
                                    // 3 movies in a row
                                    ForEach(0..<3) { j in
                                        WatchListMovieCard(position: (i+j))
                                            
                                        }
                                }
                            }
                        }
                    }
                }
            }.navigationBarTitle("Watchlist")
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
