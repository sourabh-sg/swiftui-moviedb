//
//  Share.swift
//  USC Films
//
//  Created by Sourabh Gapate on 18/04/21.
//

import Foundation
import UIKit
import Alamofire

class Share {
    
    func shareToTwitter(isMovie: Bool, id:String) {
        print("Share to Twitter")
        /*
        let twitterURL = "https://twitter.com/intent/tweet"
        let attachmentURL = "https://www.themoviedb.org/" + (isMovie ? "movie/" : "tv/") + id
        
        let parameters = ["text":"Check out this link:", "url":attachmentURL, "hashtags":["CSCI571USCFilms"]] as [String : Any]
        */
        let text = "Check out this link:"
        let attachmentURL = "https://www.themoviedb.org/" + (isMovie ? "movie/" : "tv/") + id
        print(attachmentURL)
        let hashtags = "CSCI571USCFilms"
        let twitterURL = "https://twitter.com/intent/tweet?text=\(text)&url=\(attachmentURL)&hashtags=\(hashtags)"
        print(twitterURL)
//        "https://twitter.com/intent/tweet?text=Check out this link:&url=\(attachmentURL)&hashtags=CSCI571USCFilms"
        
        if let url = URL(string: twitterURL) {
            UIApplication.shared.openURL(url)
        }
        
    }
}
