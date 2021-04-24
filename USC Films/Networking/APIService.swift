//
//  APIService.swift
//  USC Films
//
//  Created by Sourabh Gapate on 23/04/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService: NSObject {
    
    static private let BASE_URL = "https://api.themoviedb.org/3/"
    static private let API_KEY = "6c0ffdf3b26f49c894810818be208c86"
    static private let NOW_PLAYING = "now_playing"
    static private let TOP_RATED = "top_rated"
    static private let POPULAR = "popular"
    static private let TRENDING = "airing_today"
    
    // MARK: - MOVIE APIS
    // API Call to get now playing movies data
    func getNowPlayingMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "movie/" + APIService.NOW_PLAYING + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in moviesArray {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        print("Movie obj found!\n\(movie)")
                        // Convert movie model to movie view model
                        let movieVM = MovieViewModel(movieModel: movie as! Movie)
                        movies.append(movieVM)
                    }
                }
                print("Movies:\n\(movies)")
                if movies.count > 0 {
                    print("Movie obj at first index!\n\(movies.first!.title)")
                }
                // Return movies on completion
                completion(movies)
            }
    }
    
    // API Call to get top rated movies data
    func getTopRatedMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "movie/" + APIService.TOP_RATED + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        print("Top Rated URL: \(urlString)")
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in moviesArray {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        print("Movie obj found!\n\(movie)")
                        // Convert movie model to movie view model
                        let movieVM = MovieViewModel(movieModel: movie as! Movie)
                        movies.append(movieVM)
                    }
                }
                print("Movies:\n\(movies)")
                if movies.count > 0 {
                    print("Movie obj at first index!\n\(movies.first!.title)")
                }
                // Return movies on completion
                completion(movies)
            }
        
    }
    
    // API Call to get popular movies data
    func getPopularMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "movie/" + APIService.POPULAR + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        print("Top Rated URL: \(urlString)")
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in moviesArray {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        print("Movie obj found!\n\(movie)")
                        // Convert movie model to movie view model
                        let movieVM = MovieViewModel(movieModel: movie as! Movie)
                        movies.append(movieVM)
                    }
                }
                print("Movies:\n\(movies)")
                if movies.count > 0 {
                    print("Movie obj at first index!\n\(movies.first!.title)")
                }
                // Return movies on completion
                completion(movies)
            }
        
    }
    
    // MARK: - TV SHOW APIS
    // API Call to get trending tv shows data
    func getTrendingShows(completion: @escaping ([TVShowViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "tv/" + APIService.TRENDING + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let showsArray = responseJSON["results"]
                
                var shows = [TVShowViewModel]() // This will hold an array of returned tv show view models
                for showObj in showsArray {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: TVShow.self) {
                        print("Movie obj found!\n\(tvShow)")
                        // Convert tv show model to tv show view model
                        let tvShowVM = TVShowViewModel(tvShowModel: tvShow as! TVShow)
                        shows.append(tvShowVM)
                    }
                }
                print("Shows:\n\(shows)")
                if shows.count > 0 {
                    print("Movie obj at first index!\n\(shows.first!.title)")
                }
                // Return movies on completion
                completion(shows)
            }
    }
    
    // API Call to get top rated tv shows data
    func getTopRatedShows(completion: @escaping ([TVShowViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "tv/" + APIService.TOP_RATED + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let showsArray = responseJSON["results"]
                
                var shows = [TVShowViewModel]() // This will hold an array of returned tv show view models
                for showObj in showsArray {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: TVShow.self) {
                        print("Movie obj found!\n\(tvShow)")
                        // Convert tv show model to tv show view model
                        let tvShowVM = TVShowViewModel(tvShowModel: tvShow as! TVShow)
                        shows.append(tvShowVM)
                    }
                }
                print("Shows:\n\(shows)")
                if shows.count > 0 {
                    print("Movie obj at first index!\n\(shows.first!.title)")
                }
                // Return movies on completion
                completion(shows)
            }
    }
    
    // API Call to get popular tv shows data
    func getPopularShows(completion: @escaping ([TVShowViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "tv/" + APIService.POPULAR + "?api_key=" + APIService.API_KEY + "&language=en-US&page=1"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                let showsArray = responseJSON["results"]
                
                var shows = [TVShowViewModel]() // This will hold an array of returned tv show view models
                for showObj in showsArray {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: TVShow.self) {
                        print("Movie obj found!\n\(tvShow)")
                        // Convert tv show model to tv show view model
                        let tvShowVM = TVShowViewModel(tvShowModel: tvShow as! TVShow)
                        shows.append(tvShowVM)
                    }
                }
                print("Shows:\n\(shows)")
                if shows.count > 0 {
                    print("Movie obj at first index!\n\(shows.first!.title)")
                }
                // Return movies on completion
                completion(shows)
            }
    }
}