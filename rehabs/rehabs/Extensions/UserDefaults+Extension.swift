//
//  UserDefaults+Extension.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

enum UserDefaultKeys: String {
	case bodyTypes
}

extension UserDefaults {
	func save(_ value: Any?, for key: UserDefaultKeys) {
		setValue(value, forKey: key.rawValue)
	}

	func value<T>(for key: UserDefaultKeys) -> T? {
		return value(forKey: key.rawValue) as? T
	}
}
