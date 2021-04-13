//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct ImageContentView: View {
    
    let imageArray = ["tomandjerry", "kahonaapyaarhai"]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            CarouselView(numberOfImages: imageArray.count) {
                
                ForEach(imageArray, id: \.self) { imageName in
                    
                    ZStack() {
                        Image(imageName)
                            .resizable()
                            .blur(radius: 5.0)
                        
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: width, height: (height + 10))
                    }
                }
            }
        }.frame(width: 335, height: 200, alignment: .leading)
        
    }
}

struct ImageContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView()
    }
}
