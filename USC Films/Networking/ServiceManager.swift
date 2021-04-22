//
//  ServiceManager.swift
//  USC Films
//
//  Created by Sourabh Gapate on 19/04/21.
//

import Foundation
import Alamofire
import SwiftyJSON

// HOME

class ServiceManager {
    
//    @Published var nowPlaying: [Movie]
    
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
    
    init() {
//        getNowPlayingList(isMovie: true)
    }
    
    func getNowPlayingList(isMovie: Bool) {
        let urlString = ServiceManager.BASE_URL + (isMovie ? "movie/" : "tv/") + "?api_key=" + ServiceManager.API_KEY + "&language=en-US&page=1"
        
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url).validate().response { (response) in
            print(response)
        }
    }

    
}

extension JSON {
    func to<T>(type: T?) -> Any? {
        if let baseObj = type as? JSONable.Type {
            if self.type == .array {
                var arrObject: [Any] = []
                for obj in self.arrayValue {
                    let object = baseObj.init(parameter: obj)
                    arrObject.append(object!)
                }
                return arrObject
            } else {
                let object = baseObj.init(parameter: self)
                return object!
            }
        }
        return nil
    }
}

