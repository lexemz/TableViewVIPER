//
//  Song.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

struct Results: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let gender: String
    let name: Name
    let email: String
    let phone: String
    let picture: Picture
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
    
    var fullName: String {
        "\(first) \(last)"
    }
}

struct Picture: Decodable {
    let large: String
}
