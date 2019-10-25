//
//  AppStyle.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

protocol AppStyleProtocol {
	var colors: ColorsProtocol { get}
	var fonts: FontsProtocol { get }
}

protocol ColorsProtocol {
	var primary: UIColor { get }
	var secondary: UIColor { get }
	var title: UIColor { get }
}

protocol FontsProtocol {
	var bigButton: UIFont { get }
	var title: UIFont { get }
}
