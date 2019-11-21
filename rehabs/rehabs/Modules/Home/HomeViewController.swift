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

	private var exercisesTime: Timer?

	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
		setupViewModel()
	}

	// MARK: - Setups
	private func setupUI() {
		// Save button
		let startButton = BaseButton()
		view.addSubview(startButton)
		startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		startButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
		startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
		startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
		startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		startButton.setTitle("Let's go", for: .normal)
		startButton.setTitleColor(appStyle.colors.primary, for: .normal)
		self.startButton = startButton

		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
//		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.text = "Your upcoming session\nwill start at 1:25 pm:\n(12 enrolled)"
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel

		let exercisesView = UIImageView(image: .slide1)
		view.addSubview(exercisesView)
		exercisesView.translatesAutoresizingMaskIntoConstraints = false
		exercisesView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32).isActive = true
		exercisesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		exercisesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
		exercisesView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		exercisesView.contentMode = .scaleAspectFill
		exercisesView.clipsToBounds = true
		exercisesView.layer.cornerRadius = 8

		// Badge title
		let badgeLabel = UILabel()
		badgeLabel.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(badgeLabel)
		badgeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
		badgeLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -32).isActive = true
		badgeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
//		badgeLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
		badgeLabel.textColor = appStyle.colors.title
		badgeLabel.font = appStyle.fonts.title
		badgeLabel.text = "You are doing fantastic"

		// Badge
		let badgeView = UIImageView(image: .hand)
		badgeView.translatesAutoresizingMaskIntoConstraints = false
		badgeView.contentMode = .scaleAspectFit
		view.addSubview(badgeView)
		badgeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
		badgeView.widthAnchor.constraint(equalToConstant: 40).isActive = true
		badgeView.leftAnchor.constraint(equalTo: badgeLabel.rightAnchor, constant: 16).isActive = true
		badgeView.centerYAnchor.constraint(equalTo: badgeLabel.centerYAnchor).isActive = true

		var imageIndex = 0
		let images: [UIImage?] = [ .slide2, .slide3, .slide1]
		exercisesTime = Timer.scheduledTimer(withTimeInterval: 3, repeats: true, block: { _ in
			if imageIndex + 1 < images.count {
				imageIndex = imageIndex + 1
			} else {
				imageIndex = 0
			}

			UIView.transition(with: exercisesView,
							  duration: 0.75,
							  options: .transitionCrossDissolve,
							  animations: {
								exercisesView.image = images[imageIndex]
			},completion: nil)
		})

		// Subtitle
		let subtitleLabel = UILabel()
		view.addSubview(subtitleLabel)
		subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
		subtitleLabel.topAnchor.constraint(equalTo: exercisesView.bottomAnchor, constant: 16).isActive = true
		subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
		subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
		subtitleLabel.textColor = appStyle.colors.title
		subtitleLabel.font = appStyle.fonts.title
		subtitleLabel.text = "Your current plan:\n- breathing\n- cognitive\n- stretching\n- posture"
		subtitleLabel.numberOfLines = 0
//		subtitleLabel.textAlignment = .left
	}

	private func setupViewModel() {
		startButton?.tap = viewModel?.start
	}
}
