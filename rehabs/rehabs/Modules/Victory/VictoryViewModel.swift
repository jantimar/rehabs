//
//  VictoryViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class VictoryViewModel {
	var delegate: VictoryViewModelDelegate?
}

// MARK: - VictoryViewModelProtocol
extension VictoryViewModel: VictoryViewModelProtocol {
	func close() {
		delegate?.closeWorkout()
	}

	func nextCognitive() {
		delegate?.nextCognitive()
	}

	func nextPhysical() {
		delegate?.nextPhysical()
	}
}
