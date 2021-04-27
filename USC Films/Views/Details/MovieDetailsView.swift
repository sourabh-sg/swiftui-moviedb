//
//  MovieDetailsView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    var id: String
    var isMovie: Bool
    @ObservedObject var movieDetails = MovieDetailsData()
    @ObservedObject var movieCast = CastDetailsData()
    @ObservedObject var reviewsData = ReviewData()
    
    @State var limit : Int? = 3
    @State var isBookmarked = false
    
    // Toast
    @State var showToast = false
    @State var toastMessage = ""
    
    var watchList =  WatchListViewModel()
        
    init(id: String, isMovie: Bool) {
        self.id = id
        self.isMovie = isMovie
    }
    
    var body: some View {
        
        Group {
            
            // Show loading view on load
            if !self.movieDetails.didLoadMovieDetails {
            LoadingView()
                .onAppear(perform: {
                    // Call fetch to load details data
                    movieDetails.getData(for: self.id, isMovie: self.isMovie)
                    movieCast.getData(for: self.id, isMovie: self.isMovie)
                    reviewsData.getData(for: self.id, isMovie: self.isMovie)
                })
            } else {
                
                if self.movieDetails.basicDetails != nil {
                    
                    ScrollView() {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            
                            if self.movieDetails.basicDetails!.videoKey.count > 0 {
                                // Youtube player
                                YouTubePlayer(text: self.movieDetails.basicDetails!.videoKey)
                                    .frame(height: 208)
                            }
                            // Movie/TV Show Title
                            Text(self.movieDetails.basicDetails!.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            
                            // Year of release | Genres
                            if self.movieDetails.basicDetails!.releaseYearAndGenreString.count > 0 {
                                Text(self.movieDetails.basicDetails!.releaseYearAndGenreString)
                                    .font(Font.system(size: 18))
                                    .multilineTextAlignment(.leading)
                            }
                            
                            // Average star rating
                            HStack(spacing: 5) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.red)
                                    .font(Font.system(size: 18))
                                Text("\(self.movieDetails.basicDetails!.rating)/5.0")
                                    .font(Font.system(size: 18))
                            }
                            // Description
                            if self.movieDetails.basicDetails!.overview.count > 0 {
                                Text(self.movieDetails.basicDetails!.overview)
                                    .font(Font.system(size: 16))
                                    .lineLimit(limit)
                                // Show more/less button
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        if limit == 3 {
                                            limit = nil
                                        } else {
                                            limit = 3
                                        }
                                    }, label: {
                                        if limit == 3 {
                                            Text("Show more..")
                                                .font(Font.system(size: 16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                        } else {
                                            Text("Show less")
                                                .font(Font.system(size: 16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.gray)
                                        }
                                    })
                                }
                            }
                            
                            // Cast & Crew
                            if self.movieCast.cast != nil && self.movieCast.cast!.count > 0 {
                                CastView(cast: self.movieCast.cast!)
                            }
                            
                            // Review List
                            if self.reviewsData.reviews != nil && self.reviewsData.reviews!.count > 0 {
                                ReviewListView(reviews: self.reviewsData.reviews!, movieTitle: self.movieDetails.basicDetails!.title)
                            }
                                                
                            // Recommended Movies
                            RecommendationSectionView(id: self.id, isMovie: self.isMovie)
                                .padding(.top, 15)
                            
                            Spacer()
                        
                        }.padding(.leading, 15)
                        .padding(.trailing, 15)
                        
                    }
                    .navigationBarItems(trailing:
                                            HStack {
                                                
                                                // Bookmark
                                                Button(action: {
                                                    if isBookmarked {
                                                        watchList.removeFromWatchList(id: self.movieDetails.basicDetails!.id)
                                                        // Show toast
                                                        toastMessage = "\(self.movieDetails.basicDetails!.title) was removed from Watchlist"
                                                        showToast = true
                                                    } else {
                                                        watchList.addToWatchList(id:self.movieDetails.basicDetails!.id, image: self.movieDetails.basicDetails!.image, mediaType: (isMovie ? "movie" : "tv"))
                                                        // Show toast
                                                        toastMessage = "\(self.movieDetails.basicDetails!.title) was added to Watchlist"
                                                        showToast = true
                                                    }
                                                    
                                                    isBookmarked.toggle()
                                                }) {
                                                    
                                                    Image(systemName: (isBookmarked ? "bookmark.fill": "bookmark"))
                                                        .font(Font.system(size: 18, weight: .bold))
                                                        .foregroundColor((isBookmarked ? .blue: .black))
                                                }
                                                                                        
                                                // FB Share
                                                let fbUrlString = "https://www.facebook.com/sharer/sharer.php?u=https://www.themoviedb.org/movie/\(id)"
                                                Link(destination: URL(string: fbUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!) {
                                                    Image("facebook-app-symbol")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                }.frame(width: 20, height: 20, alignment: .center)
                                                
                                                // Twitter Share
                                                let twitUrlString = "https://twitter.com/intent/tweet?text=Check out this link&url=https://www.themoviedb.org/movie/\(id)&hashtags=CSCI571USCFilms"
                                                Link(destination: URL(string: twitUrlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!) {
                                                    Image("twitter")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                }.frame(width: 20, height: 20, alignment: .center)
                                                
                                            }
                    )
                    .onAppear(perform: {
                        isBookmarked = watchList.isBookmarked(movie: id)
                    })
                }
            }
        }.overlay(overlayView: ToastView(dataModel: ToastDataModel(title: toastMessage), show: $showToast), show: $showToast)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(id: "429617", isMovie: true)
    }
}

// Cast View
struct CastView: View {

    var cast: [ActorViewModel]
    init(cast: [ActorViewModel]) {
        self.cast = cast
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Cast & Crew")
                .font(Font.system(size: 26, weight: .bold))
            
            // Names
            ScrollView(.horizontal) {
                LazyHStack {
                    let count = min(10, self.cast.count)
                    ForEach(0..<count) { i in
                        
                        if let actorVM = self.cast[i] {
                            VStack(alignment: .center, spacing: 15) {
                                if !actorVM.image.isEmpty {
                                    KFImage(URL(string: actorVM.image))
                                        .placeholder {
                                            Image("cast_placeholder")
                                            .resizable()
                                            .clipShape(Circle())
                                                .scaledToFill()
                                            .frame(width: 90, height: 90)
                                        }
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFill()
                                        .frame(width: 90, height: 90)
                                } else {
                                    Image("cast_placeholder")
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFill()
                                        .frame(width: 90, height: 90)
                                }
                                
                                if !actorVM.name.isEmpty {
                                    Text(actorVM.name)
                                        .font(Font.system(size: 12))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        } else {
                            Image("cast_placeholder")
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFill()
                                .frame(width: 90, height: 90)
                            
                        }
                    }
                }
            }
            
        }
    }
}


// Reviews List View
struct ReviewListView: View {

    var reviews: [ReviewViewModel]
    var movieTitle: String
    
    init(reviews: [ReviewViewModel], movieTitle: String) {
        self.reviews = reviews
        self.movieTitle = movieTitle
    }
    
    var body: some View {
        // Reviews
        VStack(alignment: .leading, spacing: 20) {
            Text("Reviews")
                .font(Font.system(size: 26, weight: .bold))
                .padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 27) {
                // Review views
                let count = min(3, self.reviews.count)
                ForEach(0..<count) { i in
                    if let reviewVM = self.reviews[i] {
                    NavigationLink(
                        destination: FullReviewView(review: reviewVM, movie: movieTitle),
                        label: {
                            ReviewCard(review: reviewVM)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                        })
                    }
                }
            }
            
        }
    }
}

