//
//  WatchListViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 26/04/21.
//

import Foundation
import SwiftUI

//Referred following link to save struct to UserDefaults
//https://www.hackingwithswift.com/example-code/system/how-to-load-and-save-a-struct-in-userdefaults-using-codable

struct WatchListItem: Codable, Identifiable {
    var id: String
    var image: String
    var mediaType: String
    var title: String
    
    init(id: String, image: String, mediaType: String, title: String) {
        self.id = id
        self.image = image
        self.mediaType = mediaType
        self.title = title
    }
}

class WatchListViewModel: ObservableObject {
    
    @Published var list = [WatchListItem]()
    
    // Currently dragging movie
    @Published var currentItem: WatchListItem?
    
    let defaults = UserDefaults.standard
    
    // For codable class we need to define enum listing all the properties as cases
    enum CodingKeys: String, CodingKey {
          case list
    }
    
    init() {
        reloadWatchList()
    }
    
    func reloadWatchList() {
        list.removeAll()
        list = getWatchList()
    }
    
    // Saves list array to defaults
    func saveWatchList() {
        
        // We cannot directly store a struct to defaults
        // First need to encode struct, then add it to defaults.
        // Same applies to array of structs
        // First encode each struct, and add it to a new array
        // Once all the structs are encoded, array is stored to defaults
        let encoder = JSONEncoder()
        var array = Array<Any>()
        for item in list {
            if let encoded = try? encoder.encode(item) {
                array.append(encoded)
            }
        }
        if array.count > 0 {
            defaults.set(array, forKey: "WatchList")
        } else {
            defaults.removeObject(forKey: "WatchList")
        }
        
    }
    
    // Get watchlist
    // Logic is exact opposite to saveWatchList
    func getWatchList() -> [WatchListItem] {
        var array = [WatchListItem]()
        if let savedArr = defaults.object(forKey: "WatchList") as? Array<Any> {
            for element in savedArr {
                let decoder = JSONDecoder()
                if let loadedItem = try? decoder.decode(WatchListItem.self, from: element as! Data) {
                    array.append(loadedItem)
                }
            }
            
        }
        return array
    }
    
    // Add an item to watchlist
    func addToWatchList(id: String, image: String, mediaType: String, title: String) {
        // Add to list
        // Add only if not added previously
        if !isBookmarked(movie: id) {
            list.append(WatchListItem(id: id, image: image, mediaType: mediaType, title: title))
            saveWatchList()
        }
        
    }
    
    // Remove an item to watchlist
    func removeFromWatchList(id: String) {
        // Remove from list
        for (index, item) in list.enumerated() {
            if item.id == id {
                list.remove(at: index)
                saveWatchList()
                break
            }
        }
    }
    
    // Returns true if a movie with given id is already added to watchlist
    // false otherwise
    func isBookmarked(movie id: String) -> Bool {
        reloadWatchList()
        for item in list {
            if item.id == id {
                return true
            }
        }
        return false
    }
    
    func moveItem(atIndex: Int, toIndex: Int) {
        // Index should be less than the list count
        if (list.count <= atIndex) || (list.count <= toIndex)  {
            return
        }
        
        // Swapping items
        let fromItem = list[atIndex]
        list[atIndex] = list[toIndex]
        list[toIndex] = fromItem
        saveWatchList()        
    }
    
    
}
