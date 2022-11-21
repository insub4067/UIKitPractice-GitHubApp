//
//  UIHelper.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/22.
//

import UIKit

struct UIHelper {
    static func createThreeColumnFlowLayout(in superView: UIView) -> UICollectionViewFlowLayout {
        let width = superView.frame.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)

        return flowLayout
    }
}
