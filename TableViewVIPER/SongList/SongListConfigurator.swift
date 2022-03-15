//
//  SongListConfigurator.swift
//  TableViewVIPER
//
//  Created by Igor on 15.03.2022.
//

import Foundation

protocol SongListConfiguratorInputProtocol {
    func configure(with VC: SongListViewController)
}

class SongListConfigurator: SongListConfiguratorInputProtocol {
    func configure(with VC: SongListViewController) {
        let presenter = SongListPresenter(view: VC)
        let interactor = SongListInteractor(presenter: presenter)
        
        VC.presenter = presenter
        presenter.interactor = interactor
    }
}
