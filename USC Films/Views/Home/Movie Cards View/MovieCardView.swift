//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct MovieCardView: View {
    @State var movieViewModel: MovieViewModel?
    @State var tvShowViewModel: TVShowViewModel?
    @State var isMovie: Bool = false
    
    @State var title: String = ""
    @State var releaseYear: String = ""
    @State var image: String = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5) {
            
            KFImage(URL(string: (isMovie ? self.movieViewModel!.image : self.tvShowViewModel!.image))!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text((isMovie ? self.movieViewModel!.title : self.tvShowViewModel!.title))
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text((isMovie ? self.movieViewModel!.releaseYear : self.tvShowViewModel!.releaseYear))
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
