//
//  VictoryViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class VictoryViewController: BaseViewController {
	var viewModel: VictoryViewModelProtocol?

	// MARK: - IBOutlets
	private var titleLabel: UILabel?

 // MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
		setupViewModel()
	}

	// MARK: - Setups
	private func setupUI() {

		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16).isActive = true
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.text = "Good job"
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel
	}

	private func setupViewModel() {

	}
}
