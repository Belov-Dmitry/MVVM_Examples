//
//  ViewData.swift
//  MVVM_theSwiftDev
//
//  Created by Dmitry Belov on 24.01.2024.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
    
    
    
}

