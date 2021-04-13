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
        YTPlayerView()
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
//        uiView.loadVideo(byURL: text, startSeconds: 0)
        uiView.load(withVideoId: text)
    }
    
}
