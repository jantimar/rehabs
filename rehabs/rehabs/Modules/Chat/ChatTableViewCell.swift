//
//  ChatTableViewCell.swift
//  rehabs
//
//  Created by Jan Timar on 27/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class ChatTableViewCell: UITableViewCell {
	var messageLabel: UILabel?

	var rightConstraint: NSLayoutConstraint?
	var leftConstraint: NSLayoutConstraint?

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		backgroundColor = .white

		let bubbleView = UIView()
		bubbleView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(bubbleView)
		backgroundColor = .clear
		contentView.backgroundColor = .clear
		bubbleView.backgroundColor = .white
		bubbleView.layer.cornerRadius = 8

		let messageLabel = UILabel()
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		messageLabel.textColor = .mainRed
		messageLabel.numberOfLines = 0
		bubbleView.addSubview(messageLabel)
		self.messageLabel = messageLabel

		let rightConstraint = bubbleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
		let leftConstraint = bubbleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
		self.rightConstraint = rightConstraint
		self.leftConstraint = leftConstraint

		NSLayoutConstraint.activate([
			bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
			rightConstraint,
			leftConstraint,
			bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

			messageLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 4),
			messageLabel.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 4),
			messageLabel.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: -4),
			messageLabel.bottomAnchor.constraint(lessThanOrEqualTo: bubbleView.bottomAnchor, constant: -4),
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
