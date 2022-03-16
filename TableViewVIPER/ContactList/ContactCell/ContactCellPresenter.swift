//
//  ContactCellPresenter.swift
//  TableViewVIPER
//
//  Created by Igor on 16.03.2022.
//

import Foundation

struct CellData {
    let name: String
    let number: String
}

class ContactCellPresenter: ContactCellViewOutputProtocol {
    unowned var view: ContactCellViewInputProtocol
    var interactor: ContactCellInteractorInputProtocol!
    
    required init(view: ContactCellViewInputProtocol) {
        self.view = view
    }
    
    func showCellInfo() {
        interactor.provideCellInfo()
    }
}

extension ContactCellPresenter: ContactCellInteractorOutputProtocol {
    func recevieCellInfo(with cellData: CellData) {
        view.displayCellInfo(name: cellData.name,
                             number: cellData.number)
    }
}
