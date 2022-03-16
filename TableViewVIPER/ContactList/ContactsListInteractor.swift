//
//  SongListInteractor.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

protocol ContactsListInteractorInputProtocol {
    func getSongs()
    init(presenter: ContactsListInteractorOutputProtocol)
}

protocol ContactsListInteractorOutputProtocol: AnyObject {
    func songsDidRecive(with dataStore: ContactsListDataStore)
}

class ContactsListInteractor: ContactsListInteractorInputProtocol {
    unowned let presenter: ContactsListInteractorOutputProtocol!
    
    required init(presenter: ContactsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func getSongs() {
        NetwokManager.shared.fetchContacts { contacts in
            let dataStore = ContactsListDataStore(contacts: contacts)
            self.presenter.songsDidRecive(with: dataStore)
        }
    }
}
