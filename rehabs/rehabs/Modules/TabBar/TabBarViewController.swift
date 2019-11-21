//
//  TabBarViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {

	var appStyle: AppStyleProtocol = LightAppStyle()

	override func viewDidLoad() {
		super.viewDidLoad()
		tabBar.tintColor = appStyle.colors.primary
		delegate = self
		title = "Klara"
	}
}

extension TabBarViewController: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		return viewController is ChatViewController
			|| viewController is HomeViewController
//			|| viewController is StatsViewController
	}
}
