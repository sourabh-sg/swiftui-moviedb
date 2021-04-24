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
            
            if ((!tvselected && nowPlayingMovies.movies.count == 0 && topRatedMovies.movies.count == 0 && popularMovies.movies.count == 0) || (tvselected && trendingShows.shows.count == 0 && topRatedShows.shows.count == 0 && popularShows.shows.count == 0)) {
                Text("Loading...")
                    .font(.title2)
                    .foregroundColor(.gray)
            } else {
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(spacing: 20) {
                        
                        if tvselected {
                            VStack(alignment: .leading, spacing: 10) {
                                CarouselHeader(title: carouselTitle)
                                ImageContentView(shows: trendingShows.shows, isMovie: false)
                            }
                            MovieCardContainerView(heading: "Top Rated", movies: nil, shows: topRatedShows.shows, isMovie: false)
                            MovieCardContainerView(heading: "Popular", movies: nil, shows: popularShows.shows, isMovie: !tvselected)
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                CarouselHeader(title: carouselTitle)
                                ImageContentView(movies: nowPlayingMovies.movies, isMovie: true)
                            }
                            MovieCardContainerView(heading: "Top Rated", movies: topRatedMovies.movies, shows: nil, isMovie: !tvselected)
                            MovieCardContainerView(heading: "Popular", movies: popularMovies.movies, shows: nil, isMovie: true)
                        }
                            
                        Link("Powered by TMDB\nDeveloped by Sourabh Shamrao Gapate", destination: URL(string: "https://www.themoviedb.org/")!)
                            .font(.headline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                    }
                }
                .frame(width: 335)
                .navigationBarTitle("USC Films")
                .navigationBarItems(trailing:
                                        Button(action: {
                                            //Action
                                            tvselected.toggle()
                                            
                                            if tvselected {
                                                carouselTitle = "Trending"
                                            } else {
                                                carouselTitle = "Now Playing"
                                            }
                                            
                                        }, label: {
                                            if tvselected {
                                                Text("TV shows")
                                                    .foregroundColor(.blue)
                                            } else {
                                                Text("Movies")
                                                    .foregroundColor(.blue)
                                            }
                                        }
                    )
                )
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
            .font(.title2)
            .fontWeight(.bold)
            .padding(.bottom)
    }
}
