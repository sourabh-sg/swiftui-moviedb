//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct ImageContentView: View {
    
    let imageArray = ["tomandjerry", "kahonaapyaarhai"]
    
//    @State var movies: [Movie]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            CarouselView(numberOfImages: imageArray.count) {
                
                ForEach(imageArray, id: \.self) { imageName in
//                ForEach(movies, id: \.self) { movie in
                    
                    ZStack(alignment: .center) {
                        Image(imageName)
                            .resizable()
                            .clipped()
                            .blur(radius: 5.0)
                        
                        Image(imageName)
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
        ImageContentView()
    }
}
