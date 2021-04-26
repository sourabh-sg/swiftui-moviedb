//
//  WatchListViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 26/04/21.
//

import Foundation

//Referred following link to save struct to UserDefaults
//https://www.hackingwithswift.com/example-code/system/how-to-load-and-save-a-struct-in-userdefaults-using-codable

class WatchListViewModel: Codable {
    
    var list = [String : String]()
    
    // For codable class we need to define enum listing all the properties as cases
    enum CodingKeys: String, CodingKey {
          case list
    }
    
    init() {
        list = getWatchList()
    }
    
    // Get watchlist
    func getWatchList() -> [String : String] {
        let defaults = UserDefaults.standard
        if let savedList = defaults.object(forKey: "WatchList") as? Data {
            let decoder = JSONDecoder()
            if let loadedList = try? decoder.decode([String : String].self, from: savedList) {
                print(loadedList)
                list = loadedList
            } else {
                print("Empty list")
            }
        }
        return [String: String]()
    }
    
    func setWatchList() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(list) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "WatchList")
            print("Saved list:\n\(list)")
        }
    }
    
    func addToWatchList(id: String, image: String) {
        // Add to list
        list[id] = image
        print("List on new addition:\n\(list)")
        setWatchList()
        
    }
    
    func removeFromWatchList(id: String) {
        // Remove from list
        if list[id] != nil {
            list[id] = nil
            print("List on new removal:\n\(list)")
            setWatchList()
        } else {
            print("List does not have id:\(id)\nList: \(list)")
        }
    }
    
    func isBookmarked(movie id: String) -> Bool {
        list = getWatchList()
        if list[id] != nil {
            return true
        } else {
            return false
        }
    }
    
    
}
