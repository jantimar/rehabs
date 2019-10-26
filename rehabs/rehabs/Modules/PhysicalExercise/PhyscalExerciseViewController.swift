//
//  PhyscalExerciseViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class PhyscalExerciseViewController: BaseViewController {
	// MArK: - Public properties
	var viewModel: PhyscalExerciseViewModelProtocol?

	override func loadView() {
		super.loadView()
		title = "PhyscalExercise VC"

		let skipButton = UIBarButtonItem(title: "Skip", style: .done, target: self, action: #selector(skip))
		navigationItem.rightBarButtonItem = skipButton
	}
}

// MARK: - Actions
private extension PhyscalExerciseViewController {
	@objc func skip() {
		viewModel?.skip()
	}
}
