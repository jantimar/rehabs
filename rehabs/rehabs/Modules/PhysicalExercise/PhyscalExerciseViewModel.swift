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

//	init() {
//		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//			self.delegate?.finishedPhyscalExercise()
//		}
//	}
}

extension PhyscalExerciseViewModel: PhyscalExerciseViewModelProtocol {
	func skip() {
		delegate?.showSkip()
	}
}
