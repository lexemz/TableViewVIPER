//
//  SongListConfigurator.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

final class ContactsListConfigurator {
    static func configure(with viewController: ContactsListViewController) {
        let presenter = ContactsListPresenter(view: viewController)
        let interactor = ContactsListInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
