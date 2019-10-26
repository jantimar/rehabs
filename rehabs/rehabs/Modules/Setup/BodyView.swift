//
//  BodyView.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class BodyView: UIView {
	// MARK: - IBOutlets
	private var leftArmButton: BodyButton?
	private var rightArmButton: BodyButton?
	private var leftLegButton: BodyButton?
	private var rightLegButton: BodyButton?
	private var coreButton: BodyButton?

	// MARK: - Public properties
	var selectedTypes: [BodyType] {
		return [leftArmButton, rightArmButton, leftLegButton, rightLegButton, coreButton]
			.filter { $0?.isSelected ?? false }
			.compactMap { $0?.type }
	}

	// MARK: - Lifecycle

	convenience init() {
		self.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		setupBody()
	}

	private func setupBody() {
		let coreButton = BodyButton(type: .core)
		coreButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(coreButton)
		self.coreButton = coreButton
		coreButton.setTitle("core", for: .normal)
		coreButton.setTitleColor(.red, for: .normal)

		let leftArmButton = BodyButton(type: .leftArm)
		leftArmButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(leftArmButton)
		self.leftArmButton = leftArmButton
		leftArmButton.setTitle("leftArm", for: .normal)
		leftArmButton.setTitleColor(.red, for: .normal)

		let leftLegButton = BodyButton(type: .leftLeg)
		leftLegButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(leftLegButton)
		self.leftLegButton = leftLegButton
		leftLegButton.setTitle("leftLeg", for: .normal)
		leftLegButton.setTitleColor(.red, for: .normal)

		let rightArmButton = BodyButton(type: .rightArm)
		rightArmButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(rightArmButton)
		self.rightArmButton = rightArmButton
		rightArmButton.setTitle("rightArm", for: .normal)
		rightArmButton.setTitleColor(.red, for: .normal)

		let rightLegButton = BodyButton(type: .rightLeg)
		rightLegButton.translatesAutoresizingMaskIntoConstraints = false
		addSubview(rightLegButton)
		self.rightLegButton = rightLegButton
		rightLegButton.setTitle("rightLeg", for: .normal)
		rightLegButton.setTitleColor(.red, for: .normal)

		let headView = UIView()
		headView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(headView)
		headView.layer.cornerRadius = 25
		headView.backgroundColor = .white

		NSLayoutConstraint.activate([
			headView.widthAnchor.constraint(equalToConstant: 50),
			headView.heightAnchor.constraint(equalToConstant: 50),
			headView.topAnchor.constraint(equalTo: topAnchor),
			headView.centerXAnchor.constraint(equalTo: centerXAnchor),

			coreButton.widthAnchor.constraint(equalToConstant: 50),
			coreButton.heightAnchor.constraint(equalToConstant: 100),
			coreButton.topAnchor.constraint(equalTo: headView.bottomAnchor),
			coreButton.centerXAnchor.constraint(equalTo: centerXAnchor),

			leftArmButton.widthAnchor.constraint(equalToConstant: 100),
			leftArmButton.heightAnchor.constraint(equalToConstant: 20),
			leftArmButton.topAnchor.constraint(equalTo: coreButton.topAnchor),
			leftArmButton.rightAnchor.constraint(equalTo: coreButton.leftAnchor),
			leftArmButton.leftAnchor.constraint(equalTo: leftAnchor),

			rightArmButton.widthAnchor.constraint(equalToConstant: 100),
			rightArmButton.heightAnchor.constraint(equalToConstant: 20),
			rightArmButton.topAnchor.constraint(equalTo: coreButton.topAnchor),
			rightArmButton.leftAnchor.constraint(equalTo: coreButton.rightAnchor),
			rightArmButton.rightAnchor.constraint(equalTo: rightAnchor),

			leftLegButton.widthAnchor.constraint(equalToConstant: 20),
			leftLegButton.heightAnchor.constraint(equalToConstant: 100),
			leftLegButton.topAnchor.constraint(equalTo: coreButton.bottomAnchor),
			leftLegButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -10),

			rightLegButton.widthAnchor.constraint(equalToConstant: 20),
			rightLegButton.heightAnchor.constraint(equalToConstant: 100),
			rightLegButton.topAnchor.constraint(equalTo: coreButton.bottomAnchor),
			rightLegButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10),
			rightLegButton.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
