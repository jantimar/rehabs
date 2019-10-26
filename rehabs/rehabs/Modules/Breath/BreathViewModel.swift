//
//  BreathViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class BreathViewModel {
	var delegate: BreathViewModelDelegate?
}

extension BreathViewModel: BreathViewModelProtocol {
	func complete() {
		delegate?.finishedBreathExercise()
	}
}
