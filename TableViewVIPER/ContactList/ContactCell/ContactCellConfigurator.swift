//
//  ContactCellConfigurator.swift
//  TableViewVIPER
//
//  Created by Igor on 16.03.2022.
//

import Foundation

final class ContactCellConfigurator {
    static func configure(with view: ContactCellView, and contact: Contact) {
        let presenter = ContactCellPresenter(view: view)
        let interactor = ContactCellInteractor(presenter: presenter, contact: contact)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
