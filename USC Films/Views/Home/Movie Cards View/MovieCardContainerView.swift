//
//  MovieCardContainerView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardContainerView: View {
    @State var heading: String
    @State var movies: [MovieViewModel]?
    @State var shows: [TVShowViewModel]?
    @State var isMovie: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(heading)
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: true) {
                LazyHStack(spacing: 20) {
                    // We need to show upto 20 movies here per the requirement
                    let count = min(20, (isMovie ? movies!.count : shows!.count))
                    ForEach(0..<count) { row in
                        if isMovie {
                            if movies!.count > row, let movie = movies![row] {
                                NavigationLink(
                                    destination: MovieDetailsView(id: movie.id)) {
                                    MovieCardView(movieViewModel: movie, isMovie: true)
                                }
                            }
                        } else {
                            if shows!.count > row, let show = shows![row] {
                                NavigationLink(
                                    destination: MovieDetailsView(id: show.id)) {
                                    MovieCardView(tvShowViewModel: show, isMovie: false)
                                }
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
