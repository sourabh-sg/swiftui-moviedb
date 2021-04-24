//
//  CarouselView.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import Combine

struct CarouselView<Content: View> : View {
    
    var numberOfImages: Int
    var content: Content
    @State private var currentIndex: Int = 1
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    init(numberOfImages: Int, @ViewBuilder content: () -> Content) {
        self.numberOfImages = numberOfImages
        self.content = content()
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            HStack(spacing: 0) {
                self.content
            }
            .frame(width: width, height: height, alignment: .leading)
            .offset(x: CGFloat(self.currentIndex) * -geometry.size.width, y: 0)
            .animation(.spring())
            .onReceive(self.timer, perform: { _ in
                if numberOfImages > 0 {
                    self.currentIndex = (self.currentIndex + 1) % numberOfImages
                }
            })
        }
    }
    
}
