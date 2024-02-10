//
//  Users.swift
//  MVVM_CMDBCMDR
//
//  Created by Dmitry Belov on 29.01.2024.
//

import Foundation



struct CharactersResponse: Decodable {
    let results: [Character]?
}
struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}
//struct Gender: Codable {
//    let female: String
//    let male: String
//    let unknown: String
//}

// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}

//struct Species: Codable {
//    let alien: String
//    let human: String
//}

//struct Status: Codable {
//    let alive: String
//    let dead: String
//    let unknown: String
//}


//struct User: Codable {
//    let name: String
//    let username: String
//    let email: String
//    let address: Address
//    let phone: String
//}
//struct Address: Codable {
//    let street: String
//    let suite: String
//    let city: String
//}
