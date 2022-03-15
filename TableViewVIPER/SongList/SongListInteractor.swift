//
//  SongListInteractor.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

protocol SongListInteractorInputProtocol {
    func getSongs()
    init(presenter: SongListInteractorOutputProtocol)
}

protocol SongListInteractorOutputProtocol: AnyObject {
    func songsDidRecive(with dataStore: SongListDataStore)
}

class SongListInteractor: SongListInteractorInputProtocol {
    unowned let presenter: SongListInteractorOutputProtocol!
    
    required init(presenter: SongListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func getSongs() {
        let dataStore = SongListDataStore(songs: Song.getSongs())
        presenter.songsDidRecive(with: dataStore)
    }
}
