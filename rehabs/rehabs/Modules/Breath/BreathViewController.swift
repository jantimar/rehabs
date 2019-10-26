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

	override func loadView() {
		super.loadView()
		title = "Breath VC"
	}
}
