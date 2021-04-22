//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Kingfisher

struct ImageContentView: View {
    
    let imageArray = ["tomandjerry", "kahonaapyaarhai"]
//    let imageArray: [String]
    @State var movies: [Movie]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            // Populate image Array
            let count = movies.count
            CarouselView(numberOfImages: count) {
                ForEach(0..<count) { row in
                    ZStack(alignment: .center) {
                        let movie = movies[row]
                        KFImage(URL(string: movie.image)!)
                            .resizable()
                            .clipped()
                            .blur(radius: 5.0)
                        
                        KFImage(URL(string: movie.image)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: (height + 10))
                    }
            
                }
            }
        }.frame(height: 200, alignment: .leading)
        
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView(movies: [Movie]())
    }
}
