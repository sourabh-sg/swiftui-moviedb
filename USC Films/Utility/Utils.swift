//
//  Utils.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation

class Utils {
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let API_KEY = "6c0ffdf3b26f49c894810818be208c86"
  /*
    // MOVIES
    static let NOW_PLAYING_MOVIES_URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=6c0ffdf3b26f49c894810818be208c86&language=en-US&page=1"

    static let TOP_RATED_MOVIES_URL = "https://api.themoviedb.org/3/movie/top_rated?api_key=6c0ffdf3b26f49c894810818be208c86&language=en-US&page=1"

    static let POPULAR_MOVIES_URL = "https://api.themoviedb.org/3/movie/popular?api_key=6c0ffdf3b26f49c894810818be208c86&language=en-US&page=1"
    // TV
    "https://api.themoviedb.org/3/tv/airing_today?api_key=6c0ffdf3b26f49c894810818be208c86&language=en-US&page=1"

    "https://api.themoviedb.org/3/tv/top_rated?api_key=6c0ffdf3b26f49c894810818be208c86&language=en-US&page=1"

    "https://api.themoviedb.org/3/tv/popular?api_key=6c0ffdf3b26f49c8 94810818be208c86&language=en-US&page=1"
*/
    
    
    func getTwitterShareURL(with id: String) -> String {
        "https://twitter.com/intent/tweet?text=Check out this link" + "&url=https://www.themoviedb.org/movie/" + id + "&hashtags=#CSCI571USCFilms"
    }
    
}
