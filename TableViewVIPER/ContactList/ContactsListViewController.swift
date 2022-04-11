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
    func contact(adIndex indexPath: IndexPath) -> Contact?
}

class ContactsListViewController: UIViewController {
    var presenter: ContactsListViewControllerOutputProtocol!

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsListConfigurator.configure(with: self)
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contact", for: indexPath) as? ContactCellView,
              let contact = presenter.contact(adIndex: indexPath) else { return UITableViewCell() }
        
        ContactCellConfigurator.configure(with: cell, and: contact)
        
        return cell
    }
}

extension ContactsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
    }
}

extension ContactsListViewController: ContactsListViewControllerInputProtocol {
    func reloadData() {
        tableview.reloadData()
    }
}
