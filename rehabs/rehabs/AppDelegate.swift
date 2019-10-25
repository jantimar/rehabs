//
//  AppDelegate.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
	// MARK: - Public properties
	var window: UIWindow?
	// MARK: - Private properties
	private var serviceFactory: ServiceFactoryProtocol?
	private var useCaseFactory: UseCaseFactoryProtocol?
	private var appFlow: AppFlow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		setupServices()
		setupUseCase()
		setupWidnow()
		return true
	}
}

	// MARK: - Setups
private extension AppDelegate {
	func setupServices() {
		serviceFactory = ServiceFactory()
	}

	func setupUseCase() {
		guard let serviceFactory = serviceFactory else { return }
		useCaseFactory = UseCaseFactory(serviceFactory: serviceFactory)
	}

	func setupAppFlow() {
		guard let serviceFactory = serviceFactory, let useCaseFactory = useCaseFactory else { return }
		appFlow = AppFlow(serviceFactory: serviceFactory,
						  useCaseFactory: useCaseFactory)
	}

	func setupWidnow() {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = appFlow?.navigationController
		window?.makeKeyAndVisible()
	}
}

