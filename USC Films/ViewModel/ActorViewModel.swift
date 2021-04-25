//
//  ActorViewModel.swift
//  USC Films
//
//  Created by Sourabh Gapate on 25/04/21.
//

import Foundation

struct ActorViewModel {
    var name : String
    var image: String
    
    init(actorModel: Actor) {
        self.name = actorModel.name
        self.image = "http://image.tmdb.org/t/p/w500/" + actorModel.image
    }
    
}
