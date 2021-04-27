//
//  YoutubePlayerWrapper.swift
//  USC Films
//
//  Created by Sourabh Gapate on 13/04/21.
//

import SwiftUI
import UIKit
import youtube_ios_player_helper

struct YouTubePlayer: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> YTPlayerView {
        let player = YTPlayerView()
        player.load(withVideoId: text)
        return player
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        
    }
    
}
