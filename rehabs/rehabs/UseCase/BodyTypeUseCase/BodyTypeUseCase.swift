//
//  BodyTypeUseCase.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class BodyTypeUseCase {
	// MARK: - Private property
	private let database: DatabaseProtocol

	init(database: DatabaseProtocol) {
		self.database = database
	}
}

// MARK: - BodyTypeUseCaseProtocol
extension BodyTypeUseCase: BodyTypeUseCaseProtocol {
	func save(types: [BodyType]) {
		database.save(bodyTypes: types)
	}

	func load(types: @escaping (Result<[BodyType], DatabaseError>) -> Void) {
		database.fetch(bodyTypes: types)
	}
}
