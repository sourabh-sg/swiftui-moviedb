//
//  CastViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation
import SwiftUI

class CastDetailsData: ObservableObject {
    @Published var cast: [ActorViewModel]?
    private var apiService = APIService()
    
    func getData(for id: String, isMovie: Bool) {
        self.apiService.getMovieCastDetails(for: id, isMovie: isMovie, completion: { (castArray) in
            self.cast = castArray
        })
    }
}
