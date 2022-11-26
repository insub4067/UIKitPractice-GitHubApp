//
//  FavouriteListVC.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/18.
//

import UIKit

class FavouriteListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                print(error)
            }
        }
    }
}
