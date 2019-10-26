//
//  SetupViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class SetupViewModel {
	// MARK: - Public properties
	var delegate: SetupViewModelDelegate?

	// MARK: - Private properties
	private var bodyType: BodyTypeUseCaseProtocol

	init(bodyType: BodyTypeUseCaseProtocol) {
		self.bodyType = bodyType
	}
}

extension SetupViewModel: SetupViewModelProtocol {
	func setupBody(types: [BodyType]) {
		// TODO: save body types
		delegate?.finished()
	}
}
