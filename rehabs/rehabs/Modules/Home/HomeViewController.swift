//
//  HomeViewController.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
	var viewModel: HomeViewModelProtocol?

	// MARK: - IBOutlets
	private var startButton: BaseButton?
	private var titleLabel: UILabel?

	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
		setupViewModel()
	}

	// MARK: - Setups
	private func setupUI() {
		tabBarItem.title = "Home"

		// Save button
		let startButton = BaseButton()
		view.addSubview(startButton)
		startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
		startButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
		startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
		startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		startButton.layer.cornerRadius = 100
		startButton.setTitle("Start", for: .normal)
		startButton.setTitleColor(appStyle.colors.primary, for: .normal)
		startButton.titleLabel?.font = appStyle.fonts.bigButton
		self.startButton = startButton

		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.text = "Ready to some exercise?"
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel
	}

	private func setupViewModel() {
		startButton?.tap = viewModel?.start
	}
}
