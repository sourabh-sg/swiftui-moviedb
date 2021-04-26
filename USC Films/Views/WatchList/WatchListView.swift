//
//  WatchListView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct WatchListView: View {
        
//    Grid reordering: https://kavsoft.dev/SwiftUI_2.0/Grid_Reordering/
    @StateObject var watchList = WatchListViewModel()
    
    @Namespace var animation
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
    
    
    var body: some View {
        NavigationView{
            
            ScrollView {
                
                VStack() {
                    if watchList.list.count == 0 {
                        Text("Watchlist is empty")
                            .font(.title2)
                            .foregroundColor(.gray)
                    } else {
                        
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            
                            ForEach(watchList.list) { listItem in
                                
                                WatchListMovieCard(watchListItem: listItem)
                                    .frame(height: 200)
                                    .onDrag({
                                        
                                        // Setting ID for sample
                                        return NSItemProvider(contentsOf: URL(string: "\(listItem.id)")!)!
                                    })
                                    .onDrop(of: [.item], delegate: DropViewDelegate(item: listItem, watchListVM: watchList))
                            }
                            
                        }.padding()
                        
                    }
                }
                                
            }
            .navigationBarTitle("Watchlist")
            .onAppear {
                watchList.reloadWatchList()
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
