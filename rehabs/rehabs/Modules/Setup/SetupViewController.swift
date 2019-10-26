//
//  SetupViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class SetupViewController: BaseViewController {
	// MARK: - Private properties
	var viewModel: SetupViewModelProtocol?

	// MARK: - IBOutlets
	private var body: BodyView?
	private var saveButton: BaseButton?

	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
	}

	// MARK: - Setup
	private func setupUI() {
		let body = BodyView()
		view.addSubview(body)

		let saveButton = BaseButton()
		view.addSubview(saveButton)
		saveButton.tap = save
		self.saveButton = saveButton

		NSLayoutConstraint.activate([
			body.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			body.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
			saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
			saveButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}

// MARK: - Actions
private extension SetupViewController {
	@objc func save() {
		let bodyTypes = body?.selectedTypes ?? []
		viewModel?.setupBody(types: bodyTypes)
	}
}
