//
//  ContactViewCell.swift
//  TableViewVIPER
//
//  Created by Igor on 16.03.2022.
//

import UIKit

protocol ContactCellViewInputProtocol: AnyObject {
    func displayCellInfo(name: String, number: String)
}

protocol ContactCellViewOutputProtocol {
    init(view: ContactCellViewInputProtocol)
    func showCellInfo()
}

class ContactCellView: UITableViewCell {
    var presenter: ContactCellViewOutputProtocol!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        presenter.showCellInfo()
    }
}

extension ContactCellView: ContactCellViewInputProtocol {
    func displayCellInfo(name title: String, number: String) {
        var content = defaultContentConfiguration()
        
        content.text = title
        content.secondaryText = number
        
        contentConfiguration = content
    }
}
