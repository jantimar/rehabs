//
//  SkipExerciseViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class SkipExerciseViewController: BaseViewController {
	var viewModel: SkipExerciseViewModelProtocol?
	// MARK: - IBOutlets
	private var taskButton: BaseButton?
	private var workoutButton: BaseButton?
	private var closeButton: BaseButton?

	override func loadView() {
		super.loadView()
		title = "Skip"

		setupUI()
	}

	private func setupUI() {
		let taskButton = BaseButton()
		taskButton.setTitle("Next task", for: .normal)
		view.addSubview(taskButton)
		self.taskButton = taskButton

		let workoutButton = BaseButton()
		workoutButton.setTitle("Next workout", for: .normal)
		view.addSubview(workoutButton)
		self.workoutButton = workoutButton

		let closeButton = BaseButton()
		closeButton.setTitle("I'm done", for: .normal)
		view.addSubview(closeButton)
		self.workoutButton = closeButton

		let offset: CGFloat = 16
		NSLayoutConstraint.activate([
			taskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			taskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			taskButton.heightAnchor.constraint(equalToConstant: 40),

			workoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			workoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			workoutButton.topAnchor.constraint(equalTo: taskButton.bottomAnchor, constant: offset),
			workoutButton.heightAnchor.constraint(equalToConstant: 40),
			workoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			closeButton.topAnchor.constraint(equalTo: workoutButton.bottomAnchor, constant: offset),
			closeButton.heightAnchor.constraint(equalToConstant: 40)
		])
	}

	private func setupViewModel() {
		taskButton?.tap = viewModel?.nextCognitive
		workoutButton?.tap = viewModel?.nextPhysical
		closeButton?.tap = viewModel?.finishExercise
	}
}
