//
//  ContactCellInteractor.swift
//  TableViewVIPER
//
//  Created by Igor on 16.03.2022.
//

import Foundation

protocol ContactCellInteractorInputProtocol {
     init(presenter: ContactCellInteractorOutputProtocol, contact: Contact)
     func provideCellInfo()
}

protocol ContactCellInteractorOutputProtocol: AnyObject {
    func recevieCellInfo(with cellData: CellData)
}

class ContactCellInteractor: ContactCellInteractorInputProtocol {
     unowned let presenter: ContactCellInteractorOutputProtocol
     private let contact: Contact
     
     required init(presenter: ContactCellInteractorOutputProtocol, contact: Contact) {
          self.presenter = presenter
          self.contact = contact
     }
     
     func provideCellInfo() {
          let cellData = CellData(name: contact.name.fullName, number: contact.phone)
          presenter.recevieCellInfo(with: cellData)
     }
}
