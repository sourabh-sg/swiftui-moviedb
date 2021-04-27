//
//  HomeView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 12/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var tvselected: Bool = false
    @State var carouselTitle = "Now Playing"
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
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(spacing: 10) {
                            
                            if tvselected {
                                VStack(alignment: .leading, spacing: 10) {
                                    CarouselHeader(title: carouselTitle)
                                    ImageContentView(movies: trendingShows.shows, isMovie: false)
                                }
                                MovieCardContainerView(heading: "Top Rated", isMovie: !self.tvselected,movies: topRatedShows.shows)
                                MovieCardContainerView(heading: "Popular", isMovie: !self.tvselected, movies: popularShows.shows)
                            } else {
                                VStack(alignment: .leading, spacing: 10) {
                                    CarouselHeader(title: carouselTitle)
                                    ImageContentView(movies: nowPlayingMovies.movies, isMovie: true)
                                }
                                MovieCardContainerView(heading: "Top Rated", isMovie: !self.tvselected, movies: topRatedMovies.movies)
                                MovieCardContainerView(heading: "Popular", isMovie: !self.tvselected, movies: popularMovies.movies)
                            }
                                
                            Link("Powered by TMDB\nDeveloped by Sourabh Shamrao Gapate", destination: URL(string: "https://www.themoviedb.org/")!)
                                .font(Font.system(size: 12, weight: .medium))
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 10)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .navigationBarTitle("USC Films")
                    .navigationBarItems(trailing:
                                            Button(action: {
                                                //Action
                                                tvselected.toggle()
                                                carouselTitle = (tvselected ? "Trending" : "Now Playing")
                                                
                                            }, label: {
                                                
                                                Text((tvselected ? "Movies" : "TV shows"))
                                                    .font(Font.system(size: 16))
                                                    .foregroundColor(.blue)
                                            }
                        )
                    )
                    
                    
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
