//
//  AppFlow.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class AppFlow {
	// MARK: - Public properties
	private(set) var navigationController: UINavigationController?
	// MARK: - Private properties
	private let serviceFactory: ServiceFactoryProtocol
	private let useCaseFactory: UseCaseFactoryProtocol

	private var workoutFlow: WorkoutFlow?

	init(serviceFactory: ServiceFactoryProtocol,
		 useCaseFactory: UseCaseFactoryProtocol) {
		self.serviceFactory = serviceFactory
		self.useCaseFactory = useCaseFactory

		createNavigationController()
	}
}

// MARK: - Setups
private extension AppFlow {
	func createNavigationController() {
		let navigationController = UINavigationController(rootViewController: createTabBarController())
		navigationController.navigationBar.tintColor = .white
		self.navigationController = navigationController
	}

	func createHomeController() -> HomeViewController {
		let viewController = HomeViewController()
		let viewModel = HomeViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}

	func createTabBarController() -> TabBarViewController {
		let tabBarController = TabBarViewController()
		tabBarController.viewControllers = [createHomeController()]
		return tabBarController
	}
}

// MARK: - HomeViewModelDelegate
extension AppFlow: HomeViewModelDelegate {
	func startExercise() {
		let workoutFlow = WorkoutFlow(navigationController: navigationController,
									  serviceFactory: serviceFactory,
									  useCaseFactory: useCaseFactory)
		workoutFlow.start()
		workoutFlow.delegate = self
		self.workoutFlow = workoutFlow
	}
}

// MARK: - WorkoutFlowDelegate
extension AppFlow: WorkoutFlowDelegate {
	func closeWorkoutFlow() {
		guard let homeViewController = navigationController?.viewControllers.first else { return }
		workoutFlow = nil
		navigationController?.setViewControllers([homeViewController], animated: true)
	}
}
