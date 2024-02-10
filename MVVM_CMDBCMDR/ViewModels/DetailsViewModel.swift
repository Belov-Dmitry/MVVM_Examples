//
//  DetailsViewModel.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import Foundation

class DetailsViewModel {
    
        let name: String
        let image: String
//        let email: String
//        let phone: String
//        let street: String
//        let suite: String
//        let city: String


    
    init(user: Character) {
        self.name = user.name
        self.image = user.image
//        self.email = user.email
//        self.phone = user.phone
//        self.street = user.address.street
//        self.suite = user.address.suite
//        self.city = user.address.city
    }
}
