//
//  GFTabBarController.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/26.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchVC(), createFavouriteVC()]
    }
    
    func createSearchVC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        return UINavigationController(rootViewController: searchVC)
    }

    func createFavouriteVC() -> UINavigationController {
        let favouriteVC = FavoriteListVC()
        favouriteVC.title = "Favourites"
        favouriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favouriteVC)
    }
}
