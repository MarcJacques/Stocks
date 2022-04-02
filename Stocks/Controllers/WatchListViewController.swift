//
//  WatchListViewController.swift
//  Stocks
//
//  Created by Marc Jacques on 4/1/22.
//

import UIKit

class WatchListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setSeacrhController()
    }
    
    private func setSeacrhController() {
        let resultVC = SearchResultsViewController()
        let searchVC = UISearchController(searchResultsController: resultVC)
        navigationItem.searchController = searchVC
    }


}

