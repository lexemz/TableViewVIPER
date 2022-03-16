//
//  ViewController.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import UIKit

protocol SongListViewControllerInputProtocol: AnyObject {
    func reloadData()
}

protocol SongListViewControllerOutputProtocol {
    var songsCount: Int { get }
    
    init(view: SongListViewControllerInputProtocol)
    func viewDidLoad()
    func song(adIndex indexPath: IndexPath) -> Song
}

class SongListViewController: UIViewController {
    var presenter: SongListViewControllerOutputProtocol!
    
    private let configurator: SongListConfiguratorInputProtocol = SongListConfigurator()

    @IBOutlet var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        
        tableview.dataSource = self
        tableview.delegate = self
        
        presenter.viewDidLoad()
    }
    
    
}

extension SongListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.songsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "song", for: indexPath)
        let song = presenter.song(adIndex: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = song.name
        content.secondaryText = song.artist
        
        cell.contentConfiguration = content
        return cell
    }
}

extension SongListViewController: UITableViewDelegate {
    
}

extension SongListViewController: SongListViewControllerInputProtocol {
    func reloadData() {
        tableview.reloadData()
    }
}
