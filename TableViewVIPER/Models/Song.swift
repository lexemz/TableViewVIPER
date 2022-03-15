//
//  Song.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

struct Song {
    let name: String
    let artist: String
    let year: Int
    
    static func getSongs() -> [Song] {
        [
            Song(name: "Wake Me Up", artist: "Avicii", year: 2013),
            Song(name: "Hello", artist: "Adele", year: 2017)
        ]
    }
}
