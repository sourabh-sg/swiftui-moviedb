//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct ImageContentView: View {
    
    @State var movies: [MovieViewModel]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            // Populate image Array
            CarouselView(numberOfImages: movies.count) {
                ForEach(0..<movies.count) { row in
                    ZStack(alignment: .center) {
                        // KFImage is KingFisher library's Image view that loads and caches images from given url
                        KFImage(URL(string: movies[row].backdropImage))
                            .resizable()
                            .blur(radius: 5)
                            .frame(width: width, height: height)
                        
                        KFImage(URL(string: movies[row].image)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: height)
                    }
            
                }
            }
        }.frame(height: 200, alignment: .leading)
        
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView(movies: [MovieViewModel]())
    }
}
