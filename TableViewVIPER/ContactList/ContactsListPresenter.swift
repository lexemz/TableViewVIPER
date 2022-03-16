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
    
    private var dataStore: ContactsListDataStore?
    
    var contactsCount: Int {
        guard let dataStore = dataStore else { return 0 }
        return dataStore.contacts.count
    }
    
    required init(view: ContactsListViewControllerInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.getSongs()
    }
    
    func contact(adIndex indexPath: IndexPath) -> Contact? {
        dataStore?.contacts[indexPath.row]
    }
}

extension ContactsListPresenter: ContactsListInteractorOutputProtocol {
    func songsDidRecive(with dataStore: ContactsListDataStore) {
        self.dataStore = dataStore
        view.reloadData()
    }
}
