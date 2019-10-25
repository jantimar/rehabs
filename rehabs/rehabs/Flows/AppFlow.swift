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
		let navigationController = UINavigationController(rootViewController: createHomeController())
		navigationController.setNavigationBarHidden(true, animated: false)
		self.navigationController = navigationController
	}

	func createHomeController() -> HomeViewController {
		let viewController = HomeViewController()
		let viewModel = HomeViewModel()
		viewModel.delegate = self
		viewController.viewModel = viewModel
		return viewController
	}
}

// MARK: - HomeViewModelDelegate
extension AppFlow: HomeViewModelDelegate {
	func startExercise() {
		// TODO: Start exercise
	}
}
