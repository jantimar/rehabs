//
//  BaseButton.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class BaseButton: UIButton {
	// MARK: - Public properties
	var tap: (() -> Void)?

	convenience init() {
		self.init(frame: .zero)

		setupActions()
		setupUI()
	}

	// MARK: - Setups
	private func setupActions() {
		addTarget(self, action: #selector(pressButton), for: .touchUpInside)
	}

	private func setupUI() {
		layer.cornerRadius = 8
		clipsToBounds = true
		backgroundColor = .white
	}
}

// MARK: - Actions
private extension BaseButton {
	@objc func pressButton() {
		tap?()
	}
}