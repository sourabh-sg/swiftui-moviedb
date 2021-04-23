//
//  MovieCardContainerView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardContainerView: View {
    var heading: String
    @State var movies: [MovieViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(heading)
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    // We need to show upto 20 movies here per the requirement
                    let count = min(20, movies.count)
                    ForEach(0..<count) { row in
                        if movies.count > row, let movie = movies[row] {
                            NavigationLink(
                                destination: MovieDetailsView(videoLink: "bwOZrnZxIuQ")) {
                                MovieCardView(movieViewModel: movie)
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
        MovieCardContainerView(heading: "Top Rated", movies: [MovieViewModel]())
    }
}
