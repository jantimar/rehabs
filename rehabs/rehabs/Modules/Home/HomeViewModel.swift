//
//  HomeViewModel.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import Foundation

final class HomeViewModel {
	var delegate: HomeViewModelDelegate?
}

extension HomeViewModel: HomeViewModelProtocol {
	func start() {
		delegate?.startExercise()
	}
}
