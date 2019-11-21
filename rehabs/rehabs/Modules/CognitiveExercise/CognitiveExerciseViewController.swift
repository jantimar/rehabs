//
//  CognitiveExerciseViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class CognitiveExerciseViewController: BaseViewController {
	var viewModel: CognitiveExerciseViewModelProtocol?

	// MARK: - IBOutlets
	private var titleLabel: UILabel?
	private var startLabel: StartLabel?
	private var currentCard: CardView?
	private var previousCardType: CardType?

	private var yesButton: BaseButton?
	private var noButton: BaseButton?
	private var pointsLabel: UILabel?

	private var timer: Timer?

	private var points = 0 {
		didSet {
			pointsLabel?.text = "Points: \(points)"
		}
	}

	override func loadView() {
		super.loadView()

		setupUI()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		startLabel?.startAnimation(count: 3)
	}

	private func setupUI() {
		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.numberOfLines = 2
		titleLabel.text = "Let's get play\nIt's same shape as previous?"
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel

		let yesButton = BaseButton()
		yesButton.alpha = 0
		yesButton.tap = tapYes
		yesButton.setTitle("Yes", for: .normal)
		view.addSubview(yesButton)
		self.yesButton = yesButton

		let noButton = BaseButton()
		noButton.alpha = 0
		noButton.tap = tapNo
		noButton.setTitle("No", for: .normal)
		view.addSubview(noButton)
		self.noButton = noButton

		let pointsLabel = UILabel()
		view.addSubview(pointsLabel)
		pointsLabel.translatesAutoresizingMaskIntoConstraints = false
		pointsLabel.textColor = appStyle.colors.title
		pointsLabel.font = appStyle.fonts.title
		pointsLabel.textAlignment = .center
		self.pointsLabel = pointsLabel

		let startLabel = StartLabel(count: 3)
		view.addSubview(startLabel)
		startLabel.textColor = appStyle.colors.title
		self.startLabel = startLabel

		startLabel.done = {
			self.startGame()
		}

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
			titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),

			startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

			yesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			yesButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -24),
			yesButton.heightAnchor.constraint(equalToConstant: 50),
			yesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),

			noButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
			noButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5, constant: -24),
			noButton.heightAnchor.constraint(equalToConstant: 50),
			noButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),

			pointsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pointsLabel.bottomAnchor.constraint(equalTo: yesButton.topAnchor, constant: -16)
		])
	}

	private func pushNextCard() {

		let card = CardView(type: CardType(rawValue: Int.random(in: 0 ..< 3)) ?? .circle)
		view.addSubview(card)
		let centerXConstrain = card.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 400)
		centerXConstrain.isActive = true
		card.centerXConstrain = centerXConstrain
		card.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		card.widthAnchor.constraint(equalToConstant: 300).isActive = true
		card.heightAnchor.constraint(equalToConstant: 300).isActive = true
		view.layoutIfNeeded()

		UIView.animate(withDuration: 0.3, animations: {
			centerXConstrain.constant = 0
			self.currentCard?.centerXConstrain?.constant = -400
			self.view.layoutIfNeeded()
		}) { _ in
			self.previousCardType = self.currentCard?.type ?? .circle
			self.currentCard?.removeFromSuperview()
			self.currentCard = card
		}
	}

	private func startGame() {
		pushNextCard()
		timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { _ in
			self.yesButton?.alpha = 0
			self.noButton?.alpha = 0

			UIView.animate(withDuration: 0.3, animations: {
				self.currentCard?.alpha = 0
			}, completion: { _ in
				self.viewModel?.finish()
			})
		})

		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			self.points = 0
			self.yesButton?.alpha = 1
			self.noButton?.alpha = 1
			self.pushNextCard()
		}
	}

}

// MARK: - Actions
private extension CognitiveExerciseViewController {
	func tapYes() {
		if previousCardType == currentCard?.type {
			points = points + 1
		} else if points > 0 {
			points = points - 1
		}

		pushNextCard()
	}

	func tapNo() {
		if previousCardType != currentCard?.type {
			points = points + 1
		} else if points > 0 {
			points = points - 1
		}

		pushNextCard()
	}
}
