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
	var primaryColor: UIColor { get }
	var secondaryColor: UIColor { get }
}

protocol FontsProtocol {

}
