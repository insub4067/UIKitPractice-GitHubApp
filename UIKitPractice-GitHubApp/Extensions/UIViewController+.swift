//
//  UIViewController+.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/19.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }

    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
