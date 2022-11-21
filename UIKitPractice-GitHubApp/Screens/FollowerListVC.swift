//
//  FollowerListVC.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/18.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true

        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentAlertOnMainThread(title: "Bad Stuff Happened", message: errorMessage?.rawValue ?? "", buttonTitle: "Ok")
                return
            }
            print(followers.count)
            print(followers)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
