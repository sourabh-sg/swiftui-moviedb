//
//  MovieDetailsView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieDetailsView: View {
    
    var videoLink: String
//    var id: String
    
    @State var limit = 3
    @State var isBookmarked = false
    
    var body: some View {
        
//        var movieDetails = MoviesDetailsData(isMovie: true, id: id)
        
        
            ScrollView() {
                LazyVStack(alignment: .leading, spacing: 10) {
                    // Youtube player
                    YouTubePlayer(text: videoLink)
                        .frame(width: 335, height: 200)
                    // Movie/TV Show Title
                    Text("Kaho Naa...Pyaar Hai")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    // Year of release | Genres
                    Text("2000 | Drama, Romance")
                        .font(.callout)
                        .foregroundColor(.black)
                    // Average star rating
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            .font(.callout)
                        Text("4.9/5.0")
                            .font(.callout)
                            .foregroundColor(.black)
                    }
                    // Description
                    Text("Sonia and Rohit love each other but Rohit is mysteriously killed. To divert her upset mind, Sonia moves to New Zealand, where she meets Rohit's lookalike Raj who helps her trace Rohit's killer.")
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
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Cast & Crew")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        // Names
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(0..<10) {_ in
                                    VStack {
                                        Image("cast_placeholder")
                                            .resizable()
                                            .clipShape(Circle())
                                            .scaledToFill()
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                        
                                        Text("Tom the mad cat")
                                            .font(.subheadline)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                            }
                        }
                    }
                    
                    // Reviews
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Reviews")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        // Review views
                        ForEach(0..<3) {_ in
                            NavigationLink(
                                destination: FullReviewView(),
                                label: {
                                    ReviewCard()
                                })
                        }
                    }
                    
                    // Recommended Movies
                    RecommendationSectionView()
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
                                        
                                        Button(action: {
                                            // FB share
                                            
                                        }) {
                                            Image("facebook-app-symbol")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }.frame(width: 20, height: 20, alignment: .center)
                                        
                                        Button(action: {
//                                            let url = "https://www.themoviedb.org/movie/429617"
//                                            let text = "Check out this link : \(url) #CSCI571USCFilms"
                                           // Twitter share
//                                            Share().shareToTwitter(isMovie: true, id: "429617")
                                           
                                        }) {
                                            Image("twitter")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }.frame(width: 20, height: 20, alignment: .center)
                                        
                                    }
            )
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(videoLink: "bwOZrnZxIuQ")
    }
}
