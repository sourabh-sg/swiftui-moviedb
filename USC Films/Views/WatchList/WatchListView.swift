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
    
    // Grid for watchlisted movies
    @Namespace var animation
    let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 3)
    
    // Toast
    @State var showToast = false
    @State var toastMessage = ""
    
    var body: some View {
        
        if watchList.list.count == 0 {
            Text("Watchlist is empty")
                .font(.title2)
                .foregroundColor(.gray)
                .onAppear {
                    watchList.reloadWatchList()
                }
        } else {
            
            GeometryReader { geometry in
                NavigationView {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 3) {
                            ForEach(watchList.list) { listItem in
                                // Find media type
                                let mediaType = listItem.mediaType
                                let isMovie = (mediaType == "movie") ? true : false
                                
                                NavigationLink(
                                    destination: MovieDetailsView(id: listItem.id, isMovie: isMovie)) {
                                    
                                    // Calculate height
                                    // 3 grid items in a row; spacings 2*3; padding 20
                                    let height = (geometry.size.width/3 - 6 - 20) * 1.5
                                    
                                    KFImage(URL(string: listItem.image)!)
                                        .resizable()
                                        .placeholder {
                                            Image("movie_placeholder")
                                            .resizable()
                                        }
                                        .frame(height: height)
                                        .onDrag({
                                            
                                            watchList.currentItem = listItem
                                            
                                            // Setting ID for sample
                                            return NSItemProvider(contentsOf: URL(string: "\(listItem.id)")!)!
                                        })
                                        .onDrop(of: [.item], delegate: DropViewDelegate(item: listItem, watchListVM: watchList))
                                        .contextMenu(menuItems: {
                                            Button(action: {
                                                watchList.removeFromWatchList(id: listItem.id)
                                                // Show toast
                                                toastMessage = "\(listItem.title) was removed from Watchlist"
                                                showToast = true
                                                
                                            }) {
                                                Label("Remove from WatchList", systemImage: "bookmark.fill")
                                                    .foregroundColor(Color.blue)
                                            }
                                        })
                                    
                                }//: Navigation Link
                                .buttonStyle(PlainButtonStyle())
                            }//: Loop
                        }//: Grid
                        .padding([.leading, .trailing])
                    }//: Scroll
                    .navigationBarTitle("Watchlist")
                    .onAppear {
                        watchList.reloadWatchList()
                    }
                    .overlay(overlayView: ToastView(dataModel: ToastDataModel(title: toastMessage), show: $showToast), show: $showToast)
                }//: Navigation View
                .navigationViewStyle(StackNavigationViewStyle())
            }//: GeometryReader
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
