//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    var movieViewModel: MovieViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            KFImage(URL(string: movieViewModel.image)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text(movieViewModel.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text(movieViewModel.releaseYear)
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
            Spacer()
            
        }
    }
}

/*
struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(imageName: "tomandjerry", movie: Movie())
    }
}
*/
