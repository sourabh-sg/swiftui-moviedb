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
    private var apiService: APIService!
    var id: String
    
    init(id: String) {
        self.id = id
        self.apiService = APIService()
        self.getData()
    }
    
    func getData() {
        self.apiService.getMovieCastDetails(for: self.id, completion: { (castArray) in
            self.cast = castArray
        })
    }
}
