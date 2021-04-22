//
//  MovieCardContainerView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardContainerView: View {
    let imageArray = ["tomandjerry", "kahonaapyaarhai", "tomandjerry", "kahonaapyaarhai"]
    var heading: String
    @State var movies: [Movie]
//    @ObservedObject var topRatedMovies = TopRatedMoviesData(isMovie: false)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(heading)
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    let count = 10//topRatedMovies.movies.count
                    ForEach(0..<count) { row in
                        if movies.count > row, let movie = movies[row] as? Movie {
                            NavigationLink(
                                destination: MovieDetailsView(videoLink: "bwOZrnZxIuQ")) {
                                MovieCardView(movie: movie)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MovieCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardContainerView(heading: "Top Rated", movies: [Movie]())
    }
}
