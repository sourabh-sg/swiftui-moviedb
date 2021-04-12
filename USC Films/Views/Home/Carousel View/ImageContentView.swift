//
//  ImageContentView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct ImageContentView: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            CarouselView(numberOfImages: 2) {
                ZStack() {
                    Image("tomandjerry")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 200)
                        .blur(radius: 25)
                    
                    Image("tomandjerry")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: 200)
                }
                
                ZStack() {
                    Image("kahonaapyaarhai")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 200)
                        .blur(radius: 25)
                    
                    Image("kahonaapyaarhai")
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: width, height: 200)
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
