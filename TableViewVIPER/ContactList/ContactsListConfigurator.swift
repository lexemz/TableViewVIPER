//
//  SongListConfigurator.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

protocol ContactsListConfiguratorInputProtocol {
    func configure(with VC: ContactsListViewController)
}

class ContactsListConfigurator: ContactsListConfiguratorInputProtocol {
    func configure(with VC: ContactsListViewController) {
        let presenter = ContactsListPresenter(view: VC)
        let interactor = ContactsListInteractor(presenter: presenter)
        
        VC.presenter = presenter
        presenter.interactor = interactor
    }
}
