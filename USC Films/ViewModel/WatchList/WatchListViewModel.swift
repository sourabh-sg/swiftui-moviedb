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
        print("Inside SAVE list:\n\(list)")
        let encoder = JSONEncoder()
        var array = Array<Any>()
        for item in list {
            if let encoded = try? encoder.encode(item) {
                array.append(encoded)
                print("Encoded item:\n\(encoded)")
            }
        }
        print("Encoded array:\n\(array)")
        if array.count > 0 {
            defaults.set(array, forKey: "WatchList")
            print("Saved list:\n\(list)")
        } else {
            print("Empty list:\n\(list)")
            defaults.removeObject(forKey: "WatchList")
        }
        
    }
    
    // Get watchlist
    // Logic is exact opposite to saveWatchList
    func getWatchList() -> [WatchListItem] {
        print("Inside GET list:\n\(list)")
        var array = [WatchListItem]()
        if let savedArr = defaults.object(forKey: "WatchList") as? Array<Any> {
            print("Array fetched from defaults:\n\(savedArr)")
            for element in savedArr {
                print("Element:\n\(element)")
                let decoder = JSONDecoder()
                if let loadedItem = try? decoder.decode(WatchListItem.self, from: element as! Data) {
                    print("Decoded item: \(loadedItem)")
                    array.append(loadedItem)
                    print("List on appending decoded item:\n\(array)")
                }
            }
            
        }
        return array
    }
    
    // Add an item to watchlist
    func addToWatchList(id: String, image: String, mediaType: String, title: String) {
        // Add to list
        print("List before new addition:\n\(list)")
        // Add only if not added previously
        if !isBookmarked(movie: id) {
            list.append(WatchListItem(id: id, image: image, mediaType: mediaType, title: title))
            print("List after new addition:\n\(list)")
            saveWatchList()
        }
        
    }
    
    // Remove an item to watchlist
    func removeFromWatchList(id: String) {
        // Remove from list
        print("List before new removal:\n\(list)")
        for (index, item) in list.enumerated() {
            if item.id == id {
                list.remove(at: index)
                print("List on new removal:\n\(list)")
                saveWatchList()
                break
            }
        }
        print("Could not find added item with id: \(id)\nList:\n\(list)")
        
    }
    
    // Returns true if a movie with given id is already added to watchlist
    // false otherwise
    func isBookmarked(movie id: String) -> Bool {
        
        reloadWatchList()
        
        print("Inside isBookmarked method")
        print("Id: \(id) & list: \(list)")
        
        for item in list {
            if item.id == id {
                print("This movie is Bookmarked")
                return true
            }
        }
        print("This movie is not Bookmarked")
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
