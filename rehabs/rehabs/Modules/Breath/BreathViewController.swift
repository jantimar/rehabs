//
//  BreathViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class BreathViewController: BaseViewController {
	var viewModel: BreathViewModelProtocol?
	// MARK: - IBOutlets
	private var titleLabel: UILabel?
	private var startLabel: StartLabel?
	private var circleView: UIView?

	override func loadView() {
		super.loadView()

		setupUI()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		startLabel?.startAnimation(count: 3)
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
		titleLabel.numberOfLines = 2
		titleLabel.text = "Let's start with\nbreathing exercise"
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel

		let startLabel = StartLabel(count: 3)
		view.addSubview(startLabel)
		startLabel.textColor = appStyle.colors.title
		startLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		startLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		self.startLabel = startLabel

		let circleView = UIView(frame: .zero)
		circleView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(circleView)
		circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		circleView.widthAnchor.constraint(equalToConstant: 220).isActive = true
		circleView.heightAnchor.constraint(equalToConstant: 220).isActive = true
		circleView.alpha = 0
		circleView.backgroundColor = .white
		circleView.layer.cornerRadius = 110
		self.circleView = circleView

		startLabel.done = {
			circleView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
			UIView.animate(withDuration: 0.3, animations: {
				self.circleView?.alpha = 0.3
			}, completion: { _ in
				self.breathAnimation(count: 2)
			})
		}
	}

	private func breathAnimation(count: Int) {
		guard count > 0 else {
			viewModel?.complete()
			return
		}

		UIView.animate(withDuration: 2, delay: 0.4, options: .curveEaseInOut, animations: { // In
			self.circleView?.transform = .identity
			self.circleView?.alpha = 0.9
		}) { _ in
			UIView.animate(withDuration: 2, delay: 0.4, options: .curveEaseInOut, animations: { // Out
				self.circleView?.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
				self.circleView?.alpha = 0.3
			}) { complete in
				self.breathAnimation(count: count - 1)
			}
		}
	}
}
