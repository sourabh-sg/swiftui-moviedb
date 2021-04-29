//
//  RecommendationSectionView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct RecommendationSectionView: View {

    var id: String
    var isMovie: Bool
    @ObservedObject var recommendedMovies: RecommendedMoviesData
    
    init(id: String, isMovie: Bool) {
        self.id = id
        self.isMovie = isMovie
        self.recommendedMovies = RecommendedMoviesData(id: id, isMovie: isMovie)
        
    }
    
    var body: some View {
        
        if self.recommendedMovies.movies.count > 0 {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(isMovie ? "Recommended Movies" : "Recommended TV shows")
                    .font(Font.system(size: 26, weight: .bold))
                
                ScrollView(.horizontal) {
                    HStack(spacing: 40) {
                        ForEach(0..<self.recommendedMovies.movies.count) { i in
                            
                            let movie = self.recommendedMovies.movies[i]
                            
                            NavigationLink(
                                destination: MovieDetailsView(id: movie.id, isMovie: isMovie)) {
                                KFImage(URL(string: movie.image)!)
                                    .loadImmediately()
                                    .placeholder {
                                        Image("movie_placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    }
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 105, height: 160, alignment: .center)
                                    .cornerRadius(10)
                                }
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}

struct RecommendationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationSectionView(id: "429617", isMovie: true)
    }
}
