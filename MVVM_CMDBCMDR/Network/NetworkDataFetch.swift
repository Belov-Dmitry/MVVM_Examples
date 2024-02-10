//
//  NetworkDataFetch.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 29.01.2024.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchUsers(responce: @escaping ([Character]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    print("data\(data)")
                    let users = try JSONDecoder().decode(CharactersResponse.self, from: data)
                    responce(users.results, nil)
                    print("users: \(users)")
                } catch let jsonError {
                    print("failed to decode JSON!", jsonError)
                }
            case .failure(_):
                responce(nil, .canNotParseData)
            }
        }
        
    }
    
    
    
}



//class NetworkDataFetch {
//    static let shared = NetworkDataFetch()
//    
//    private init() {}
//    
//    func fetchUsers(responce: @escaping ([User]?, NetworkError?) -> Void) {
//        NetworkRequest.shared.getData { result in
//            switch result {
//            case .success(let data):
//                do {
//                    let users = try JSONDecoder().decode([User].self, from: data)
//                    responce(users, nil)
//                } catch let jsonError {
//                    print("failed to decode JSON", jsonError)
//                }
//            case .failure(_):
//                responce(nil, .canNotParseData)
//            }
//        }
//        
//    }
//    
//    
//    
//}
