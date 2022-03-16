//
//  SongListPresenter.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

struct ContactsListDataStore {
    let contacts: [Contact]
}

class ContactsListPresenter: ContactsListViewControllerOutputProtocol {
    unowned let view: ContactsListViewControllerInputProtocol
    var interactor: ContactsListInteractorInputProtocol!
    
    var songs: [Contact] = []
    var contactsCount: Int {
        songs.count
    }
    
    required init(view: ContactsListViewControllerInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.getSongs()
    }
    
    func contact(adIndex indexPath: IndexPath) -> Contact {
        songs[indexPath.row]
    }
}

extension ContactsListPresenter: ContactsListInteractorOutputProtocol {
    func songsDidRecive(with dataStore: ContactsListDataStore) {
        self.songs = dataStore.contacts
        view.reloadData()
    }
}
