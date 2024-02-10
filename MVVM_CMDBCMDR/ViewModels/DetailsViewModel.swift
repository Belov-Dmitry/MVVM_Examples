//
//  DetailsViewModel.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import Foundation

class DetailsViewModel {
    
    let id: Int
    let name: String
    let image: String
    let type: String
    let locationName: String
    let created: String
    let episode: [String]
    
    
    
    init(user: Character) {
        self.id = user.id
        self.name = user.name
        self.image = user.image
        self.type = user.type
        self.locationName = user.location.name
        self.created = user.created
        self.episode = user.episode
    }
}
