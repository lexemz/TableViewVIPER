//
//  ContactViewCell.swift
//  TableViewVIPER
//
//  Created by Igor on 16.03.2022.
//

import UIKit

class ContactViewCell: UITableViewCell {
    
    func configure(with contact: Contact) {
        var content = defaultContentConfiguration()
        
        content.text = contact.name.fullName
        content.secondaryText = contact.phone
        
        contentConfiguration = content
    }
}
