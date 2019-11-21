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
	private var taskButton: BaseButton?
	private var workoutButton: BaseButton?
	private var closeButton: BaseButton?

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
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.text = "Good job\n\nYou finished it!\n\nHow do you feel?"
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		self.titleLabel = titleLabel

		let taskButton = BaseButton()
		taskButton.setTitle("Next task", for: .normal)
		view.addSubview(taskButton)
		self.taskButton = taskButton

		let workoutButton = BaseButton()
		workoutButton.setTitle("Next workout", for: .normal)
		view.addSubview(workoutButton)
		self.workoutButton = workoutButton

		let closeButton = BaseButton()
		view.addSubview(closeButton)
		self.closeButton = closeButton
		closeButton.setTitle("I'm done", for: .normal)

		let imageView = UIImageView(image: .victory)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		view.addSubview(imageView)

		let slider = UISlider()
		slider.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(slider)
		slider.tintColor = .white
		slider.setValue(0.5, animated: false)

		let thumbsUp = UIImageView(image: .thumbsUp)
		thumbsUp.translatesAutoresizingMaskIntoConstraints = false
		thumbsUp.contentMode = .scaleAspectFit
		thumbsUp.tintColor = .white
		view.addSubview(thumbsUp)
		let thumbsDown = UIImageView(image: .thumbsDown)
		thumbsDown.translatesAutoresizingMaskIntoConstraints = false
		thumbsDown.contentMode = .scaleAspectFit
		thumbsDown.tintColor = .white
		view.addSubview(thumbsDown)

		let offset: CGFloat = 16
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 120),
			imageView.widthAnchor.constraint(equalToConstant: 120),

			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
			titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),

			taskButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			taskButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			taskButton.heightAnchor.constraint(equalToConstant: 40),

			workoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			workoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			workoutButton.topAnchor.constraint(equalTo: taskButton.bottomAnchor, constant: offset),
			workoutButton.heightAnchor.constraint(equalToConstant: 40),
//			workoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

			closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			closeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			closeButton.topAnchor.constraint(equalTo: workoutButton.bottomAnchor, constant: offset),
			closeButton.heightAnchor.constraint(equalToConstant: 40),
			closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),

			slider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
			slider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			slider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),

			thumbsDown.heightAnchor.constraint(equalToConstant: 20),
			thumbsDown.widthAnchor.constraint(equalToConstant: 20),
			thumbsDown.leftAnchor.constraint(equalTo: view.leftAnchor, constant: offset),
			thumbsDown.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 4),

			thumbsUp.heightAnchor.constraint(equalToConstant: 20),
			thumbsUp.widthAnchor.constraint(equalToConstant: 20),
			thumbsUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -offset),
			thumbsUp.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 4),
		])
	}

	private func setupViewModel() {
		closeButton?.tap = viewModel?.close
		taskButton?.tap = viewModel?.nextCognitive
		workoutButton?.tap = viewModel?.nextPhysical
	}
}
