//
//  Database.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

enum DatabaseError: Error {
	case notFound
}

// TODO: In future use CoreData, userDefaults is just for hackethon
final class Database: DatabaseProtocol {

	// MARK: - DatabaseProtocol
	func save(bodyTypes: [BodyType]) {
		save { userDefaults in
			userDefaults.save(bodyTypes, for: .bodyTypes)
		}
	}

	func fetch(bodyTypes: @escaping (Result<[BodyType], DatabaseError>) -> Void) {
		fetch(.bodyTypes, closure: bodyTypes)
	}

	// MARK: - Helpers

	private func save(closure: (UserDefaults) -> Void) {
		let defaults = UserDefaults.standard
		closure(defaults)
		defaults.synchronize()
	}

	private func fetch<T>(_ key: UserDefaultKeys, closure: @escaping (Result<T, DatabaseError>) -> Void) {
		DispatchQueue.global().async {
			guard let value: T = UserDefaults.standard.value(for: key) else {
				DispatchQueue.main.async {
					closure(.failure(.notFound))
				}
				return
			}
			DispatchQueue.main.async {
				closure(.success(value))
			}
		}
	}
}
