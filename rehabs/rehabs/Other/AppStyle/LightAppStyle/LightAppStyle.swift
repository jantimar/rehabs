//
//  LightAppStyle.swift
//  rehabs
//
//  Created by Jan Timar on 25/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

struct LightAppStyle: AppStyleProtocol {
	let colors: ColorsProtocol = LightColors()
	let fonts: FontsProtocol = LightFonts()
}

struct LightColors: ColorsProtocol {
	let primaryColor: UIColor = .mainPurple
	let secondaryColor: UIColor = .mainBlue
}

struct LightFonts: FontsProtocol {

}
