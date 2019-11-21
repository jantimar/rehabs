//
//  PhyscalExerciseViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class PhyscalExerciseViewModel {
	var delegate: PhyscalExerciseViewModelDelegate?
}

extension PhyscalExerciseViewModel: PhyscalExerciseViewModelProtocol {
	func skip() {
		delegate?.finishedPhyscalExercise()
	}

	func finish() {
		delegate?.finishedPhyscalExercise()
	}
}
