//
//  ViewController.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import UIKit

protocol ContactsListViewControllerInputProtocol: AnyObject {
    func reloadData()
}

protocol ContactsListViewControllerOutputProtocol {
    var contactsCount: Int { get }
    
    init(view: ContactsListViewControllerInputProtocol)
    func viewDidLoad()
    func contact(adIndex indexPath: IndexPath) -> Contact
}

class ContactsListViewController: UIViewController {
    var presenter: ContactsListViewControllerOutputProtocol!
    
    private let configurator: ContactsListConfiguratorInputProtocol = ContactsListConfigurator()

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        title = "Contacts"
        
        tableview.dataSource = self
        tableview.delegate = self
        
        presenter.viewDidLoad()
    }
}

extension ContactsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.contactsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "song", for: indexPath)
        let contact = presenter.contact(adIndex: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = contact.name.fullName
        content.secondaryText = contact.phone
        
        cell.contentConfiguration = content
        return cell
    }
}

extension ContactsListViewController: UITableViewDelegate {
    
}

extension ContactsListViewController: ContactsListViewControllerInputProtocol {
    func reloadData() {
        tableview.reloadData()
    }
}
