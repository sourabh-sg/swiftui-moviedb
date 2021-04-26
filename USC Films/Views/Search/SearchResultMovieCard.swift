//
//  SearchResultMovieCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 16/04/21.
//

import SwiftUI
import Kingfisher

struct SearchResultMovieCard: View {
    var movieViewModel: MovieViewModel
    
    init(movieVM: MovieViewModel) {
        self.movieViewModel = movieVM
    }
    
    var body: some View {
        ZStack() {
            KFImage(URL(string: movieViewModel.backdropImage)!)
                .placeholder {
                    Image("movie_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                HStack() {
                    Text("\(movieViewModel.mediaType.uppercased())\(movieViewModel.releaseYear)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        
                    Spacer()
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            

                        Text("\(movieViewModel.rating)")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                Text(movieViewModel.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }.padding(15)
            .font(.body)
        }.frame(width: 335, height: 180, alignment: .center)
        .cornerRadius(20)
    }
}

/*
struct SearchResultMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultMovieCard()
    }
}
 */
