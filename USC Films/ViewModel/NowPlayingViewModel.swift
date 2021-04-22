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

class NowPlayingViewData: ObservableObject {
    @Published var nowPlaying = [Movie]()
    @State var isMovie = true
    
    init() {
        getData()
    }
    
    func getData() {
        let urlString = ServiceManager.BASE_URL + (isMovie ? "movie/" : "tv/") + "now_playing" + "?api_key=" + ServiceManager.API_KEY + "&language=en-US&page=1"
        print("URL: \(urlString)")
        /*
        AF.request(urlString).validate().responseJSON { (responseData) in
            print("Now Playing Response Data:\n\(responseData)")
            if responseData.result != nil {
                let swiftjson = JSON(responseData.result)
                print("Now Playing Response:\n\(swiftjson)")
//                self.nowPlaying = [Movie]()
            }
        }*/
        AF.request(urlString)
          .validate()
          .responseDecodable(of: Movies.self) { (response) in
            print("Now Playing Response Data:\n\(response)")
            let movies = response
            print("Movies:\n\(movies)")
            
//            self.items = films.all
//            self.tableView.reloadData()

          }
    }
}
