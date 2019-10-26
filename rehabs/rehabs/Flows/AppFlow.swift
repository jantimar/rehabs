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
//		let navigationController = UINavigationController(rootViewController: createSetupController())
		let navigationController = UINavigationController(rootViewController: createTabBarController())
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

	func createVictoryController() -> VictoryViewController {
		let viewController = VictoryViewController()
		let viewModel = VictoryViewModel()
		viewController.viewModel = viewModel
		return viewController
	}

	func createSetupController() -> SetupViewController {
		let viewController = SetupViewController()
		let viewModel = SetupViewModel(bodyType: useCaseFactory.bodyType)
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}
}

// MARK: - HomeViewModelDelegate
extension AppFlow: HomeViewModelDelegate {
	func startExercise() {
		// TODO: Start exercise
		navigationController?.pushViewController(createVictoryController(), animated: true)
	}
}

// MARK: - SetupViewModelDelegate
extension AppFlow: SetupViewModelDelegate {
	func finished() {
		navigationController?.setViewControllers([createTabBarController()], animated: true)
	}
}
