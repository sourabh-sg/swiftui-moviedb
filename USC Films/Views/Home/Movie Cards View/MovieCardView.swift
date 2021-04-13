//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardView: View {
    var imageName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text("Tom and Jerry Adventures")
                .font(.headline)
                .fontWeight(.bold)
                .frame(width: 120)
                .multilineTextAlignment(.center)
            
            Text("(2021)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(imageName: "tomandjerry")
    }
}
