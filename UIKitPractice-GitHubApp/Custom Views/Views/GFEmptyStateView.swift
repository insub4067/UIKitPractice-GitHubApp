//
//  GFEmptyStateView.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/22.
//

import UIKit

class GFEmptyStateView: UIView {
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
        configure()
    }

    private func configure() {
        configureMessageLabel()
        configureLogoImageView()
    }

    private func configureLogoImageView() {
        addSubview(logoImageView)
        logoImageView.image = Images.emptyStateLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhoneSE ? 80 : 40
        let logoImageViewBottomConstraint = logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
        logoImageViewBottomConstraint.isActive = true

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170)
        ])
    }

    private func configureMessageLabel() {
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel

        let messageCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
        let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: messageCenterYConstant)
        messageLabelCenterYConstraint.isActive = true

        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
}
