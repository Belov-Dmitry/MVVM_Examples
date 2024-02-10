//
//  EndPoint.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 29.01.2024.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/" + path
        guard let url = components.url else {
            preconditionFailure("Invalid URL Components \(components)")
        }
        print("url\(url)")
        return url
    }
}

extension EndPoint {
    static var users: Self {
        EndPoint(path: "character")
    }
}
//https://rickandmortyapi.com/api/character
//extension EndPoint {
//    var url: URL {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "jsonplaceholder.typicode.com"
//        components.path = "/" + path
//        guard let url = components.url else {
//            preconditionFailure("Invalid URL Components \(components)")
//        }
//        return url
//    }
//}
//
//extension EndPoint {
//    static var users: Self {
//        EndPoint(path: "users")
//    }
//}
