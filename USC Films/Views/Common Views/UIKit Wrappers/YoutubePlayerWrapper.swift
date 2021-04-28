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
        // Show controls like play-pause, and add key for inline play (not adding this key plays video inn full screen mode by default)
        let playvarsDic = ["controls": 1, "playsinline": 1]
        player.load(withVideoId: text, playerVars: playvarsDic)
        return player
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        
    }
    
}
