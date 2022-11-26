//
//  GFFollowerItemVC.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/26.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }

    override func didTapActionButton() {
        delegate.didTapGetFollowers(for: user)
    }

    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .following, with: user.following)
        itemInfoViewTwo.set(itemInfoType: .followers, with: user.followers)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
