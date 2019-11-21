//
//  AchievmentViewController.swift
//  rehabs
//
//  Created by Jan Timar on 27/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

protocol AchievmentDelegate {
	func closeAchievment()
}

final class AchievmentViewController: BaseViewController {

	var delegate: AchievmentDelegate?
	// MARK: - IBOutlets
	private var titleLabel: UILabel?
	private var closeButton: BaseButton?

	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
	}

	// MARK: - Setups
	private func setupUI() {

		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.text = "Achievment unlocked!\n\nYour first run\nTake some time to relax."
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		self.titleLabel = titleLabel

		let closeButton = BaseButton()
		view.addSubview(closeButton)
		self.closeButton = closeButton
		closeButton.setTitle("Continue", for: .normal)
		closeButton.tap = delegate?.closeAchievment

		let imageView = UIImageView(image: .badge)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		view.addSubview(imageView)


		let offset: CGFloat = 16
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 120),
			imageView.widthAnchor.constraint(equalToConstant: 120),

			titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 16),
			titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),

			closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			closeButton.heightAnchor.constraint(equalToConstant: 40),
			closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
		])
	}
}
