//
//  HomeView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct HomeView: View {
    
    // TV vs Movie
    @State var tvselected: Bool = false
    @State var carouselTitle = "Now Playing"
    @State var navBarTitle = "Movies"
    
    // Toast
    @State var showToast = false
    @State var toastMessage = ""
    
    // Movies
    @ObservedObject var nowPlayingMovies = NowPlayingMoviesData()
    @ObservedObject var topRatedMovies = TopRatedMoviesData()
    @ObservedObject var popularMovies = PopularMoviesData()
    // TVShows
    @ObservedObject var trendingShows = TrendingTVShowsData()
    @ObservedObject var topRatedShows = TopRatedTVShowsData()
    @ObservedObject var popularShows = PopularTVShowsData()
    
    var body: some View {
        NavigationView{
            
            if ((!tvselected && nowPlayingMovies.didCompleteLoading && topRatedMovies.didCompleteLoading && popularMovies.didCompleteLoading) || (tvselected && trendingShows.didCompleteLoading && topRatedShows.didCompleteLoading && popularShows.didCompleteLoading)) {
                
                // Check if failed to load any data
                if ((!tvselected && nowPlayingMovies.movies.count == 0 && topRatedMovies.movies.count == 0 && popularMovies.movies.count == 0) || (tvselected && trendingShows.shows.count == 0 && topRatedShows.shows.count == 0 && popularShows.shows.count == 0)) {
                    
                    // Show a message
                    HStack(alignment: .center) {
                        // Two spacers added either side to align text at the center
                        Spacer()
                        Text("Failed to load data")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        Spacer()
                    }.padding(30)
                    
                } else {
                    
                    // Show data
                    ScrollView(.vertical) {
                        VStack(spacing: 10) {
                            
                            if tvselected {
                                VStack(alignment: .leading, spacing: 10) {
                                    CarouselHeader(title: carouselTitle)
                                    ImageContentView(movies: trendingShows.shows, isMovie: false)
                                }
                                MovieCardContainerView(heading: "Top Rated", isMovie: !self.tvselected,movies: topRatedShows.shows, showToast: $showToast, toastMessage: $toastMessage)
                                MovieCardContainerView(heading: "Popular", isMovie: !self.tvselected, movies: popularShows.shows, showToast: $showToast, toastMessage: $toastMessage)
                            } else {
                                VStack(alignment: .leading, spacing: 10) {
                                    CarouselHeader(title: carouselTitle)
                                    ImageContentView(movies: nowPlayingMovies.movies, isMovie: true)
                                }
                                MovieCardContainerView(heading: "Top Rated", isMovie: !self.tvselected, movies: topRatedMovies.movies, showToast: $showToast, toastMessage: $toastMessage)
                                MovieCardContainerView(heading: "Popular", isMovie: !self.tvselected, movies: popularMovies.movies, showToast: $showToast, toastMessage: $toastMessage)
                            }
                              
                            VStack(alignment: .center, spacing: 0) {
                            // Should open link in the browser
                                Link("Powered by TMDB", destination: URL(string: "https://www.themoviedb.org/")!)
                                    .font(Font.system(size: 12, weight: .medium))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                
                                Text("Developed by Sourabh Shamrao Gapate")
                                    .font(Font.system(size: 12, weight: .medium))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    
                            }
                            .padding([.top, .bottom], 10)
                        }
                    }
                    .padding([.leading, .trailing], 20)
                    .navigationBarTitle(navBarTitle)
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                //Action
                                                tvselected.toggle()
                                                carouselTitle = (tvselected ? "Trending" : "Now Playing")
                                                navBarTitle = (tvselected ? "TV Shows" : "Movies")
                                                
                                            }, label: {
                                                
                                                Text((tvselected ? "Movies" : "TV Shows"))
                                                    .font(Font.system(size: 16))
                                                    .foregroundColor(.blue)
                                            }
                        )
                    
                    )
                    .overlay(overlayView: ToastView(dataModel: ToastDataModel(title: toastMessage), show: $showToast), show: $showToast)
                    
                }
                        
            } else {
                LoadingView()
                    .onAppear {
                        self.nowPlayingMovies.getData()
                        self.topRatedMovies.getData()
                        self.popularMovies.getData()
                        self.trendingShows.getData()
                        self.topRatedShows.getData()
                        self.popularShows.getData()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CarouselHeader: View {
    var title: String
    var body: some View {
        Text(title)
            .font(Font.system(size: 24))
            .fontWeight(.bold)
    }
}
