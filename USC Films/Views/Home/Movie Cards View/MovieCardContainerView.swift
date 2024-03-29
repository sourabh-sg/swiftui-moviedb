//
//  MovieCardContainerView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardContainerView: View {
    @State var heading: String
    @State var isMovie: Bool
    @State var movies: [MovieViewModel]
    
    // Toast
    @Binding var showToast : Bool
    @Binding var toastMessage : String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(heading)
//                .font(.title2)
                .font(Font.system(size: 24))
                .fontWeight(.bold)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 25) {
                    // We need to show upto 20 movies here per the requirement
                    let count = min(20, movies.count)
                    ForEach(0..<count) { row in
                        if movies.count > row, let movie = movies[row] {
                            NavigationLink(
                                destination: MovieDetailsView(id: movie.id, isMovie: isMovie)) {
                                MovieCardView(movieViewModel: movie, showToast: $showToast, toastMessage: $toastMessage)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
    }
}

struct MovieCardContainerView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MovieCardContainerView(heading: "Top Rated", isMovie: true, movies: MovieViewModel.movies, showToast: .constant(false), toastMessage: .constant(""))
    }
}
