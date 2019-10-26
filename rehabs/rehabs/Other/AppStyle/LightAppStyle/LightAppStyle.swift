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
	let primary: UIColor = .mainRed
	let secondary: UIColor = .mainYellow
	let title: UIColor = .white
}

struct LightFonts: FontsProtocol {
	let bigButton: UIFont = UIFont.systemFont(ofSize: 42, weight: .bold).italic()
	let title: UIFont = UIFont.systemFont(ofSize: 24, weight: .semibold).italic()
}
