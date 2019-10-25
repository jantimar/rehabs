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
		let navigationController = UINavigationController()

		self.navigationController = navigationController
	}
}
