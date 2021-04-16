//
//  SearchResultMovieCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 16/04/21.
//

import SwiftUI

struct SearchResultMovieCard: View {
    var body: some View {
        ZStack() {
            Image("kahonaapyaarhai")
                .resizable()
            
            VStack(alignment: .leading) {
                HStack() {
                    Text("MOVIE(2000)")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        
                    Spacer()
                    HStack(spacing: 5) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.red)
                            

                        Text("4.9")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                Text("Kaho Naa...Pyaar Hai")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }.padding(15)
            .font(.body)
        }.frame(width: 335, height: 180, alignment: .center)
        .cornerRadius(20)
    }
}

struct SearchResultMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultMovieCard()
    }
}
