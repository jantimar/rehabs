//
//  CognitiveExerciseViewModelProtocol.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

protocol CognitiveExerciseViewModelDelegate {
	func finishedCognitiveExercise()
}

protocol CognitiveExerciseViewModelProtocol {
	func finish()
}
