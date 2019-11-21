//
//  PhyscalExerciseViewModelProtocol.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

protocol PhyscalExerciseViewModelDelegate {
	func finishedPhyscalExercise()
	func showSkip()
}

protocol PhyscalExerciseViewModelProtocol {
	func skip()
	func finish()
}
