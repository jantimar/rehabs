//
//  BodyButton.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

enum BodyType {
	case rightArm, rightLeg, leftArm, leftLeg, core

	fileprivate var image: UIImage? {
		switch self {
		case .leftArm: return .leftArm
		case .leftLeg: return .leftLeg
		case .rightArm: return .rightArm
		case .rightLeg: return .rightLeg
		case .core: return .core
		}
	}
}

final class BodyButton: BaseButton {
	private(set) var type: BodyType?

	override var isSelected: Bool {
		didSet {
			UIView.animate(withDuration: 0.3) {
				self.backgroundColor = self.isSelected ? .blue : .white
			}
		}
	}

	convenience init(type: BodyType) {
		self.init(frame: .zero)
		self.type = type

		setupActions()
		setupUI(type: type)

		tap = {
			self.isSelected = !self.isSelected
		}
	}

	// MARK: - Setups
	private func setupUI(type: BodyType) {
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .white
		setBackgroundImage(type.image, for: .normal)
	}
}
