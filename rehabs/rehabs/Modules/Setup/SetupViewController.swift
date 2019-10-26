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

		setupBodyUI()
	}

	// MARK: - Setup
	private func setupBodyUI() {
		let body = BodyView()
		view.addSubview(body)
		body.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		body.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

		let saveButton = BaseButton()
		view.addSubview(saveButton)
		saveButton.tap = save
	}
}

// MARK: - Actions
private extension SetupViewController {
	@objc func save() {
		let bodyTypes = body?.selectedTypes ?? []
		viewModel?.setupBody(types: bodyTypes)
	}
}
