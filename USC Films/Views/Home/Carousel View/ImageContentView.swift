//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct ImageContentView: View {
    
    @State var movies: [MovieViewModel]?
    @State var shows: [TVShowViewModel]?
    @State var isMovie: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            // Populate image Array
            let count = (isMovie ? movies!.count : shows!.count)
            CarouselView(numberOfImages: count) {
                ForEach(0..<count) { row in
                    ZStack(alignment: .center) {
                        // KFImage is KingFisher library's Image view that loads and caches images from given url
                        KFImage(URL(string: (isMovie ? movies![row].backdropImage : shows![row].backdropImage))!)
                            .resizable()
                            .blur(radius: 5)
                            .frame(width: width, height: height)
                        
                        KFImage(URL(string: (isMovie ? movies![row].image : shows![row].image))!)
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
