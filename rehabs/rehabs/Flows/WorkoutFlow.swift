//
//  WorkoutFlow.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

protocol WorkoutFlowDelegate {
	func closeWorkoutFlow()
}

final class WorkoutFlow {
	// MARK: - Public properties
	var delegate: WorkoutFlowDelegate?
	// MARK: - Private properties
	private var navigationController: UINavigationController?
	private let serviceFactory: ServiceFactoryProtocol
	private let useCaseFactory: UseCaseFactoryProtocol

	init(navigationController: UINavigationController?,
		 serviceFactory: ServiceFactoryProtocol,
		 useCaseFactory: UseCaseFactoryProtocol) {
		self.navigationController = navigationController
		self.serviceFactory = serviceFactory
		self.useCaseFactory = useCaseFactory
	}

	func start() {
		navigationController?.pushViewController(createBreathController(), animated: true)
	}
}

private extension WorkoutFlow {
	func createBreathController() -> BreathViewController {
		let viewController = BreathViewController()
		let viewModel = BreathViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}

	func createPhysicalExerciseController() -> PhyscalExerciseViewController {
		let viewController = PhyscalExerciseViewController()
		let viewModel = PhyscalExerciseViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}

	func createCognitiveExerciseController() -> CognitiveExerciseViewController {
		let viewController = CognitiveExerciseViewController()
		let viewModel = CognitiveExerciseViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}

	func createSkipExerciseController() -> SkipExerciseViewController {
		let viewController = SkipExerciseViewController()
		let viewModel = SkipExerciseViewModel()
		//		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}

	func createVictoryController() -> VictoryViewController {
		let viewController = VictoryViewController()
		let viewModel = VictoryViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}
}

// MARK: - BreathViewModelDelegate
extension WorkoutFlow: BreathViewModelDelegate {
	func finishedBreathExercise() {
		navigationController?.pushViewController(createCognitiveExerciseController(), animated: true)
	}
}

// MARK: - PhyscalExerciseViewModelDelegate
extension WorkoutFlow: PhyscalExerciseViewModelDelegate {
	func finishedPhyscalExercise() {
		navigationController?.pushViewController(createVictoryController(), animated: true)
	}

	func showSkip() {
		navigationController?.present(createSkipExerciseController(), animated: true, completion: nil)
	}
}

// MARK: - CognitiveExerciseViewModelDelegate
extension WorkoutFlow: CognitiveExerciseViewModelDelegate {
	func finishedCognitiveExercise() {
		navigationController?.pushViewController(createPhysicalExerciseController(), animated: true)
	}
}

// MARK: - SkipExerciseViewModelDelegate
extension WorkoutFlow: SkipExerciseViewModelDelegate {
	func nextCognitive() { }

	func nextPhysical() { }

	func finishExercise() {

	}
}

// MARK: - VictoryViewModelDelegate
extension WorkoutFlow: VictoryViewModelDelegate {
	func closeWorkout() {
		delegate?.closeWorkoutFlow()
	}
}
