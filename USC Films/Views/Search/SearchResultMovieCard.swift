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
                    .frame(height: 180)
                    .cornerRadius(20)
                }
                .resizable()
                .frame(height: 180)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                HStack() {
                    Text("\(movieViewModel.mediaType.uppercased())\(movieViewModel.releaseYear)")
                        .font(Font.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                        
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.red)
                            .shadow(radius: 2)
                            

                        Text("\(movieViewModel.rating)")
                            .font(Font.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                    }
                }
                
                Spacer()
                
                Text(movieViewModel.title)
                    .font(Font.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                
            }.padding(20)
            
        }.padding(.leading, 20)
        .padding(.trailing, 20)
    }
}


struct SearchResultMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultMovieCard(movieVM: MovieViewModel.twostatesVM)
    }
}
 
