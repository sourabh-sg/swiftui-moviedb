//
//  WatchListView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI
import Kingfisher

struct WatchListView: View {
        
//    Grid reordering: https://kavsoft.dev/SwiftUI_2.0/Grid_Reordering/
//    Video: https://www.youtube.com/watch?v=h25rGhYrl5I
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
                                
                                // Find media type
                                let mediaType = listItem.mediaType
                                let isMovie = (mediaType == "movie") ? true : false
                                
                                NavigationLink(
                                    destination: MovieDetailsView(id: listItem.id, isMovie: isMovie)) {
                                    
                                    KFImage(URL(string: listItem.image)!)
                                        .resizable()
                                        .placeholder {
                                            Image("movie_placeholder")
                                            .resizable()
                                        }
                                        .frame(height: 200)
                                        .contextMenu(menuItems: {
                                            Button(action: {
                                                watchList.removeFromWatchList(id: listItem.id)
                                                
                                            }) {
                                                Label("Remove from WatchList", systemImage: "bookmark.fill")
                                                    .foregroundColor(Color.blue)
                                            }
                                        })
                                        .onDrag({
                                            
                                            // Setting ID for sample
                                            return NSItemProvider(contentsOf: URL(string: "\(listItem.id)")!)!
                                        })
                                        .onDrop(of: [.item], delegate: DropViewDelegate(item: listItem, watchListVM: watchList))
                                    
                                }.buttonStyle(PlainButtonStyle()) 
                               
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
