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
        
    static private let BASE_URL = "https://ios-app-usc-films-hw9.uc.r.appspot.com/" //"https://api.themoviedb.org/3/"
    
    // MARK: - MOVIE APIS
    // API Call to get now playing movies data
    func getNowPlayingMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "carousel_movie"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in responseJSON {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                                                
                        // Convert movie model to movie view model
                        var movieVM = MovieViewModel(movieModel: movie as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if movieVM.mediaType == "" {
                            movieVM.mediaType = "movie"
                        }
                        
                        movies.append(movieVM)
                    }
                }
                // Return movies on completion
                completion(movies)
        }
    }
    
    // API Call to get top rated movies data
    func getTopRatedMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "top_rated_movies"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in responseJSON {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        // Convert movie model to movie view model
                        var movieVM = MovieViewModel(movieModel: movie as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if movieVM.mediaType == "" {
                            movieVM.mediaType = "movie"
                        }
                        
                        movies.append(movieVM)
                    }
                }
                // Return movies on completion
                completion(movies)
        }
    }
    
    // API Call to get popular movies data
    func getPopularMovies(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "popular_movies"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let moviesArray = responseJSON["results"]
                
                var movies = [MovieViewModel]() // This will hold an array of returned movie view models
                for movieObj in responseJSON {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        // Convert movie model to movie view model
                        var movieVM = MovieViewModel(movieModel: movie as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if movieVM.mediaType == "" {
                            movieVM.mediaType = "movie"
                        }
                        
                        movies.append(movieVM)
                    }
                }
                // Return movies on completion
                completion(movies)
        }
        
    }
    
    // MARK: - TV SHOW APIS
    // API Call to get trending tv shows data
    func getTrendingShows(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "carousel_tv"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let showsArray = responseJSON["results"]
                
                var shows = [MovieViewModel]() // This will hold an array of returned tv show view models
                for showObj in responseJSON {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: Movie.self) {
                        // Convert tv show model to tv show view model
                        var tvShowVM = MovieViewModel(movieModel: tvShow as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if tvShowVM.mediaType == "" {
                            tvShowVM.mediaType = "tv"
                        }
                        
                        shows.append(tvShowVM)
                    }
                }
                // Return movies on completion
                completion(shows)
        }
    }
    
    // API Call to get top rated tv shows data
    func getTopRatedShows(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "top_rated_tv"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let showsArray = responseJSON["results"]
                
                var shows = [MovieViewModel]() // This will hold an array of returned tv show view models
                for showObj in responseJSON {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: Movie.self) {
                        // Convert tv show model to tv show view model
                        var tvShowVM = MovieViewModel(movieModel: tvShow as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if tvShowVM.mediaType == "" {
                            tvShowVM.mediaType = "tv"
                        }
                        
                        shows.append(tvShowVM)
                    }
                }
                // Return movies on completion
                completion(shows)
        }
    }
    
    // API Call to get popular tv shows data
    func getPopularShows(completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + "popular_tv"
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
//                let showsArray = responseJSON["results"]
                
                var shows = [MovieViewModel]() // This will hold an array of returned tv show view models
                for showObj in responseJSON {
                    let showJson = JSON(showObj.1)
                    // Get each movie model data
                    if let tvShow = showJson.toType(type: Movie.self) {
                        // Convert tv show model to tv show view model
                        var tvShowVM = MovieViewModel(movieModel: tvShow as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if tvShowVM.mediaType == "" {
                            tvShowVM.mediaType = "tv"
                        }
                        
                        shows.append(tvShowVM)
                    }
                }
                // Return movies on completion
                completion(shows)
        }
    }
    
    // MARK: - Common APIs
    // API Call to get movie/tv show details data
    func getMovieDetails(for id: String, isMovie: Bool, completion: @escaping (MovieDetailsViewModel?) -> ()) {
        let urlString = APIService.BASE_URL + (isMovie ? "movie/watch/" : "tv/watch/") + id
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                
                guard let movie = responseJSON.toType(type: MovieDetails.self) else {
                    completion(nil)
                    return
                }
                let movieDetails = MovieDetailsViewModel(movieDetailsModel: movie as! MovieDetails)
                // Return movies on completion
                completion(movieDetails)
        }
    }
    
    // API Call to get video id for given movie
    func getVideo(for id: String, isMovie: Bool, completion: @escaping (VideoDetailsViewModel?) -> ()) {
    let urlString = APIService.BASE_URL + (isMovie ? "movie/video/" : "tv/video/") + id
    
    AF.request(urlString)
      .validate()
        .responseJSON { response in
            let responseJSON = JSON(response.value as Any)
            
            guard let video = responseJSON.toType(type: VideoDetails.self) else {
                completion(nil)
                return
            }
            let videoDetails = VideoDetailsViewModel(videoDetailsModel: video as! VideoDetails)
            // Return movies on completion
            completion(videoDetails)
        }
    }
    
    // API Call to get movie/tv show cast data
    func getMovieCastDetails(for id: String, isMovie: Bool, completion: @escaping ([ActorViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + (isMovie ? "casts/movie/" : "casts/tv/")  + id
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                
                var castArray = [ActorViewModel]()
//                let castJson = responseJSON["cast"]
                for actObj in responseJSON {
                    let actorJson = JSON(actObj.1)
                    // Get each movie model data
                    if let actor = actorJson.toType(type: Actor.self) {
                        // Convert movie model to movie view model
                        let actorVM = ActorViewModel(actorModel: actor as! Actor)
                        castArray.append(actorVM)
                    }
                }
                
                // Return movies on completion
                completion(castArray)
        }
    }
    
    // API Call to get movie/tv show reviews
    func getMovieReviews(for id: String, isMovie: Bool, completion: @escaping ([ReviewViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + (isMovie ? "review/movie/" : "review/tv/") + id
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                
                var reviewArray = [ReviewViewModel]()
//                let resultJson = responseJSON["results"]
                for reviewObj in responseJSON {
                    let reviewJson = JSON(reviewObj.1)
                    // Get each movie model data
                    if let review = reviewJson.toType(type: Review.self) {
                        // Convert movie model to movie view model
                        let reviewVM = ReviewViewModel(review: review as! Review)
                        reviewArray.append(reviewVM)
                    }
                }
                
                // Return movies on completion
                completion(reviewArray)
        }
    }
    
    // API Call to get movie/tv show recommendations
    func getMovieRecommendations(for id: String, isMovie: Bool, completion: @escaping ([MovieViewModel]) -> ()) {
        let urlString = APIService.BASE_URL + (isMovie ? "recommended_movies/" : "recommended_tv/") + id
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                
                var movies = [MovieViewModel]()
//                let resultJson = responseJSON["results"]
                for movieObj in responseJSON {
                    let movieJson = JSON(movieObj.1)
                    // Get each movie model data
                    if let movie = movieJson.toType(type: Movie.self) {
                        // Convert movie model to movie view model
                        var movieVM = MovieViewModel(movieModel: movie as! Movie)
                        
                        // Make sure mediaType is correctly maped
                        // Needed for watchlist to details navigation
                        if movieVM.mediaType == "" {
                            movieVM.mediaType = (isMovie ? "movie" : "tv")
                        }
                        
                        movies.append(movieVM)
                    }
                }
                
                // Return movies on completion
                completion(movies)
        }
    }
    
    // API Call to get search results
    func getSearchResults(for queryString: String, completion: @escaping ([MovieViewModel]) -> ()) {
        
        // Allow spaces and other characters
        let queryStr = String(queryString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? queryString)
        
        let urlString = APIService.BASE_URL + "/search/multi/" + queryStr
        
        AF.request(urlString)
          .validate()
            .responseJSON { response in
                let responseJSON = JSON(response.value as Any)
                
                var movies = [MovieViewModel]()
//                let resultJson = responseJSON["results"]
                for movieObj in responseJSON {
                    let movieJson = JSON(movieObj.1)
                    // Only add results that satisfy following conditions:
                    // 1. Ones that have media_type as “movie” or “tv” (HW9 doc in see search result API note)
                    // 2. Skip results that don't have backdrop image (As per Piazza q.no. 2313)
                    if (movieJson["media_type"].stringValue == "movie" || movieJson["media_type"].stringValue == "tv") && (movieJson["backdrop_path"].stringValue != "") {
                        // Get each movie model data
                        if let movie = movieJson.toType(type: Movie.self) {
                            // Convert movie model to movie view model
                            let movieVM = MovieViewModel(movieModel: movie as! Movie)
                            movies.append(movieVM)
                        }
                    }
                }
                
                // Return movies on completion
                completion(movies)
        }
    }
    
    // VIDEO
    // /movie/video/
    // /tv/video/
    
}
