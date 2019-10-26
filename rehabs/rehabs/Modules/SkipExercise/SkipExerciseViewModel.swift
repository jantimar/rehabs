//
//  SkipExerciseViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class SkipExerciseViewModel {
	var delegate: SkipExerciseViewModelDelegate?
}

extension SkipExerciseViewModel: SkipExerciseViewModelProtocol {
	func nextCognitive() { }

	func nextPhysical() { }

	func finishExercise() { }
}
