//
//  SongListPresenter.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

struct SongListDataStore {
    let songs: [Song]
}

class SongListPresenter: SongListViewControllerOutputProtocol {
    unowned let view: SongListViewControllerInputProtocol
    var interactor: SongListInteractorInputProtocol!
    
    var songs: [Song] = []
    var songsCount: Int {
        songs.count
    }
    
    required init(view: SongListViewControllerInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.getSongs()
    }
}

extension SongListPresenter: SongListInteractorOutputProtocol {
    func songsDidRecive(with dataStore: SongListDataStore) {
        self.songs = dataStore.songs
    }
}
