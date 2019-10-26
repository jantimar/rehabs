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
	private var counterLabel: UILabel?
	private var circleView: UIView?

	override func loadView() {
		super.loadView()

		setupUI()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		startAnimation(count: 3)
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
		titleLabel.text = "Let's breathing exercise"
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel

		let counterLabel = UILabel()
		view.addSubview(counterLabel)
		counterLabel.translatesAutoresizingMaskIntoConstraints = false
		counterLabel.textColor = appStyle.colors.title
		counterLabel.font = UIFont.systemFont(ofSize: 90, weight: .bold).italic()
		counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		counterLabel.alpha = 0
		self.counterLabel = counterLabel

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
	}

	private func startAnimation(count: Int) {
		guard count > 0 else {
			circleView?.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
			UIView.animate(withDuration: 0.3, animations: {
				self.circleView?.alpha = 0.3
			}, completion: { _ in
				self.breathAnimation(count: 3)
			})
			return
		}

		counterLabel?.text = "\(count)"
		counterLabel?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
		counterLabel?.alpha = 1
		UIView.animate(withDuration: 1, animations: {
			self.counterLabel?.transform = .identity
			self.counterLabel?.alpha = 0
		}, completion: { _ in
			self.startAnimation(count: count - 1)
		})
	}

	private func breathAnimation(count: Int) {
		guard count >= 0 else {
			viewModel?.complete()
			return
		}

		UIView.animate(withDuration: 3, delay: 0.7, options: .curveEaseInOut, animations: { // In
			self.circleView?.transform = .identity
			self.circleView?.alpha = 0.9
		}) { _ in
			UIView.animate(withDuration: 3, delay: 0.7, options: .curveEaseInOut, animations: { // Out
				self.circleView?.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
				self.circleView?.alpha = 0.3
			}) { complete in
				self.breathAnimation(count: count - 1)
			}
		}
	}
}
