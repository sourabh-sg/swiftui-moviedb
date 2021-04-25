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
    @ObservedObject var movieDetails: MovieDetailsData
    @ObservedObject var movieCast: CastDetailsData
    @ObservedObject var reviewsData: ReviewData
    
    @State var limit = 3
    @State var isBookmarked = false
        
    init(id: String) {
        self.id = id
        self.movieDetails = MovieDetailsData(id: id)
        self.movieCast = CastDetailsData(id: id)
        self.reviewsData = ReviewData(id: id)
    }
    
    var body: some View {
        
        if self.movieDetails.basicDetails != nil {
            ScrollView() {
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    if self.movieDetails.basicDetails!.videoKey.count > 0 {
                        // Youtube player
                        YouTubePlayer(text: self.movieDetails.basicDetails!.videoKey)
                            .frame(width: 335, height: 200)
                    }
                    // Movie/TV Show Title
                    Text(self.movieDetails.basicDetails!.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    // Year of release | Genres
                    
                    if self.movieDetails.basicDetails!.releaseYearAndGenreString.count > 0 {
                        Text(self.movieDetails.basicDetails!.releaseYearAndGenreString)
                            .font(.callout)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                    }
                    
                    // Average star rating
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            .font(.callout)
                        Text("\(self.movieDetails.basicDetails!.rating)/5.0")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                    // Description
                    Text(self.movieDetails.basicDetails!.overview)
                        .lineLimit(limit)
                    // Show more/less button
                    HStack {
                        Spacer()
                        Button(action: {
                            if limit == 3 {
                                limit = 9999
                            } else {
                                limit = 3
                            }
                        }, label: {
                            if limit == 3 {
                                Text("Show more..")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            } else {
                                Text("Show less")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        })
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
                    RecommendationSectionView(id: self.id)
                        .padding(.top, 15)
                    
                    Spacer()
                
                }.padding(.leading, 20)
                .padding(.trailing, 20)
                
            }.navigationBarItems(trailing:
                                    HStack {
                                        
                                        Button(action: {
                                            isBookmarked.toggle()
                                        }) {
                                            if isBookmarked {
                                                Image(systemName: "bookmark.fill")
                                            } else {
                                                Image(systemName: "bookmark")
                                            }
                                        }
                                        .foregroundColor(.black)
                                                                                
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
        }
    }
    
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(id: "429617")
    }
}

// Cast View
struct CastView: View {

    var cast: [ActorViewModel]
    init(cast: [ActorViewModel]) {
        self.cast = cast
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Cast & Crew")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // Names
            ScrollView(.horizontal) {
                LazyHStack {
                    let count = min(10, self.cast.count)
                    ForEach(0..<count) { i in
                        
                        if let actorVM = self.cast[i] {
                            VStack {
                                KFImage(URL(string: actorVM.image))
                                    .resizable()
                                    .clipShape(Circle())
                                    .scaledToFill()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                
                                Text(actorVM.name)
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            Image("cast_placeholder")
                                .resizable()
                                .clipShape(Circle())
                                .scaledToFill()
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            
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
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // Review views
            let count = min(3, self.reviews.count)
            ForEach(0..<count) { i in
                if let reviewVM = self.reviews[i] {
                NavigationLink(
                    destination: FullReviewView(review: reviewVM, movie: movieTitle),
                    label: {
                        ReviewCard(review: reviewVM)
                    })
                }
            }
        }
    }
}

