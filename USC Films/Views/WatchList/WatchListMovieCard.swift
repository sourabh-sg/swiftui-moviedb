//
//  WatchListMovieCard.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI

struct WatchListMovieCard: View {
    @State var dragOffset = CGSize.zero
    @State var position: Int
    var body: some View {
        Image("tomandjerry")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 109, height: 167)
            .offset(dragOffset)
            .gesture(
                DragGesture().onChanged{ gesture in
                    dragOffset = gesture.translation
                }
                .onEnded{ gesture in
                    print("Gesture ended")
                }
            )
            
    }
}

struct WatchListMovieCard_Previews: PreviewProvider {
    static var previews: some View {
        WatchListMovieCard(position: 0)
    }
}
