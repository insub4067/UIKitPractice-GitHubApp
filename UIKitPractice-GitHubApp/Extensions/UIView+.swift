//
//  UIView+.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/28.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view)}
    }
}
