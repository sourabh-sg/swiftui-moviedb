//
//  NowPlayingViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 22/04/21.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class NowPlayingMoviesData: ObservableObject {
    @Published var nowPlaying = [Movie]()
    @State var isMovie = true
    
    init() {
        getData()
    }
    
    func getData() {
        let urlString = ServiceManager.BASE_URL + (isMovie ? "movie/" : "tv/") + "now_playing" + "?api_key=" + ServiceManager.API_KEY + "&language=en-US&page=1"
        print("URL: \(urlString)")
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                var movies: [Movie] = []
                let moviesArray = responseJSON["results"]
                for movieObj in moviesArray {
                    let movieJson = JSON(movieObj.1)
                    if let movie = movieJson.toType(type: Movie.self) {
                        print("Movie obj found!\n\(movie)")
                        movies.append(movie as! Movie)
                    }
                }
                print("Movies:\n\(movies)")
                if movies.count > 0 {
                    print("Movie obj at first index!\n\(movies.first!.title)")
                }
            }
    }
}
