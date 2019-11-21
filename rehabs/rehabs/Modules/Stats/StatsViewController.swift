//
//  StatsViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class StatsViewController: BaseViewController {

	override func loadView() {
		super.loadView()

		let graph1 = UIImageView(image: .graph1)
		let graph2 = UIImageView(image: .graph2)
		let graph3 = UIImageView(image: .graph3)

		[graph1, graph2, graph3].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			view.addSubview($0)
		}

		NSLayoutConstraint.activate([
		])
	}
}
