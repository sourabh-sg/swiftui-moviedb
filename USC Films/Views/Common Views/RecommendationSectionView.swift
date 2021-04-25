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
    @ObservedObject var recommendedMovies: RecommendedMoviesData
    
    init(id: String) {
        self.id = id
        self.recommendedMovies = RecommendedMoviesData(id: id)
        
    }
    
    var body: some View {
        
        if self.recommendedMovies.movies.count > 0 {
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Recommended Movies")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 30) {
                        ForEach(0..<self.recommendedMovies.movies.count) { i in
                            
                            let movie = self.recommendedMovies.movies[i]
                            
                            NavigationLink(
                                destination: MovieDetailsView(id: movie.id)) {
                                KFImage(URL(string: movie.image)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 180, alignment: .center)
                                    .cornerRadius(10)
                                }
                        }
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
            }
        }
    }
}

struct RecommendationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationSectionView(id: "429617")
    }
}
