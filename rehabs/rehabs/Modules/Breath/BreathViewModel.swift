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

	init() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			self.delegate?.finishedBreathExercise()
		}
	}
}

extension BreathViewModel: BreathViewModelProtocol {

}
