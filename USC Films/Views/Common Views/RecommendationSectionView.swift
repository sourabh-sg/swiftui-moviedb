//
//  RecommendationSectionView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct RecommendationSectionView: View {
    let imageArray = ["tomandjerry", "kahonaapyaarhai", "tomandjerry", "kahonaapyaarhai"]
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Recommended Movies")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 30) {
                    ForEach(imageArray, id: \.self) { item in
                        NavigationLink(
                            destination: MovieDetailsView(videoLink: "bwOZrnZxIuQ")) {
                            Image(item)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 180, alignment: .center)
                                .cornerRadius(10)
                            }
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
        }
    }
}

struct RecommendationSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationSectionView()
    }
}
