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
    @Published var movies = [Movie]()
    @State var isTV: Bool
    
    init(isMovie: Bool) {
        self.isTV = isMovie
        getData()
    }
    
    func getData() {
        let urlString = ServiceManager.BASE_URL + (isTV ? "tv/" : "movie/") + "now_playing" + "?api_key=" + ServiceManager.API_KEY + "&language=en-US&page=1"
        print("URL: \(urlString)")
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let moviesArray = responseJSON["results"]
                for movieObj in moviesArray {
                    let movieJson = JSON(movieObj.1)
                    if let movie = movieJson.toType(type: Movie.self) {
                        print("Movie obj found!\n\(movie)")
                        self.movies.append(movie as! Movie)
                    }
                }
                print("Movies:\n\(self.movies)")
                if self.movies.count > 0 {
                    print("Movie obj at first index!\n\(self.movies.first!.title)")
                }
            }
    }
}
