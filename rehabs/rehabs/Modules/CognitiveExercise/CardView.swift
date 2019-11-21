//
//  CardView.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

enum CardType: Int {
	case circle, square, triangle

	var color: UIColor {
		switch self {
		case .circle: return .red
		case .square: return .green
		case .triangle: return .blue
		}
	}
}

final class CardView: UIView {
	var type: CardType?
	var centerXConstrain: NSLayoutConstraint?

	convenience init(type: CardType) {
		self.init(frame: .zero)
		self.type = type
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .white
		layer.cornerRadius = 16
		clipsToBounds = true
	}

	private func drawCircle() {
		let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 200), cornerRadius: 75)

		path.close()
		type?.color.setFill()
		path.fill()
	}

	private func drawSqaure() {
		let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 200), cornerRadius: 8)

		path.close()
		type?.color.setFill()
		path.fill()
	}

	private func drawTriangle() {
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 150, y: 50))
		path.addLine(to: CGPoint(x: 50, y: 250))
		path.addLine(to: CGPoint(x: 250, y: 250))

		path.close()
		type?.color.setFill()
		path.fill()
	}

	override func draw(_ rect: CGRect) {
		super.draw(rect)

		switch type {
		case .circle?:
			drawCircle()
		case .square?:
			drawSqaure()
		case .triangle?:
			drawTriangle()
		default: break
		}
	}
}
