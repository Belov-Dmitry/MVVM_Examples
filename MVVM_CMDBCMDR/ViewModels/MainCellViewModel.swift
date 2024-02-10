//
//  MainCellViewModel.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 31.01.2024.
//

import Foundation

class MainCellViewModel {
    var name: String
    var image: String
    
    init(_ user: Character) {
        self.name = user.name
        self.image = user.image
    }
}
