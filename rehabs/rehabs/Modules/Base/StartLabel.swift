//
//  StartLabel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class StartLabel: UILabel {
	var done: (() -> Void)?

	convenience init(count: Int, start: Bool = false) {
		self.init()
		font = UIFont.systemFont(ofSize: 90, weight: .bold).italic()
		translatesAutoresizingMaskIntoConstraints = false
		alpha = 0

		if start {
			startAnimation(count: count)
		}
	}

	func startAnimation(count: Int) {
		guard count > 0 else {
			done?()
			return
		}

		text = "\(count)"
		transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
		alpha = 1
		UIView.animate(withDuration: 1, animations: {
			self.transform = .identity
			self.alpha = 0
		}, completion: { _ in
			self.startAnimation(count: count - 1)
		})
	}
}
