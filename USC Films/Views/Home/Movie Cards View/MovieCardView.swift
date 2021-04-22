//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
//    var imageName: String
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            KFImage(URL(string: movie.image)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text(movie.title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text(movie.releaseDate)
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
