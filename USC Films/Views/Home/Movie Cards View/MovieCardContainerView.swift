//
//  MovieCardContainerView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct MovieCardContainerView: View {
    let imageArray = ["tomandjerry", "kahonaapyaarhai", "tomandjerry", "kahonaapyaarhai"]
    var heading: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(heading)
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 20) {
                    ForEach(imageArray, id: \.self) { item in
                        NavigationLink(
                            destination: MovieDetailsView(videoLink: "bwOZrnZxIuQ")) {
                            MovieCardView(imageName: item)
                            }
                    }
                }
            }
        }
    }
}

struct MovieCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardContainerView(heading: "Top Rated")
    }
}
