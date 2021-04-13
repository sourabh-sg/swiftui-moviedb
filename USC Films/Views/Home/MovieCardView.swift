//
//  MovieCardView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            
            Image("tomandjerry")
                .resizable()
                .clipped()
                .frame(width: 120, height: 180, alignment: .center)
                .cornerRadius(10)
            
            Text("Tom and Jerry")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("(2021)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .fontWeight(.bold)
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView()
    }
}
