//
//  UseCaseFactory.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class UseCaseFactory: UseCaseFactoryProtocol {
	private let serviceFactory: ServiceFactoryProtocol

	init(serviceFactory: ServiceFactoryProtocol) {
		self.serviceFactory = serviceFactory
	}

	// MARK: - UseCaseFactoryProtocol

	var bodyType: BodyTypeUseCaseProtocol {
		return BodyTypeUseCase(database: serviceFactory.database)
	}
}
