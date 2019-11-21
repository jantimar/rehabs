//
//  ChatViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit

final class ChatViewController: BaseViewController {
	var texts: [String] = ["Hello, I would like to book an appointment with Karla.",
						   "Hello Elton, I would love to assist your with your appointment.",
						   "How is Wednesday 14:00 or Friday 13:00?",
						   "None of those days work for me. Anything available for next week?",
						   "We have Tuesday and Thursday available at 9:00. Would that work?",
						   "Yes put me down for Tuesday 9:00 please. Thank you!"]

	// MARK: - Lifecycle
	override func loadView() {
		super.loadView()

		setupUI()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: false)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(true, animated: false)
	}

	// MARK: - Setups
	private func setupUI() {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "ChatTableViewCell")
		tableView.dataSource = self
		tableView.delegate = self
		tableView.backgroundColor = .clear
		tableView.separatorColor = .clear
		view.addSubview(tableView)

		let inputField = UITextField()
		inputField.backgroundColor = .white
		inputField.translatesAutoresizingMaskIntoConstraints = false
		inputField.attributedPlaceholder = NSAttributedString(string: " Message...", attributes: [.foregroundColor: UIColor.gray])

//		if ([self.textField respondsToSelector:@selector(setAttributedPlaceholder:)]) {
//			self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.textField.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//		}
		view.addSubview(inputField)
		inputField.isUserInteractionEnabled = false

		NSLayoutConstraint.activate([
		tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
		tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
		tableView.topAnchor.constraint(equalTo: view.topAnchor),
		tableView.bottomAnchor.constraint(equalTo: inputField.topAnchor),

		inputField.leftAnchor.constraint(equalTo: view.leftAnchor),
		inputField.rightAnchor.constraint(equalTo: view.rightAnchor),
//		tableView.topAnchor.constraint(equalTo: view.topAnchor),
			inputField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		inputField.heightAnchor.constraint(equalToConstant: 50)
		])

		tableView.reloadData()
	}
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return texts.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
		cell.messageLabel?.text = texts[indexPath.row]

		if indexPath.row % 2 == 0 {
			cell.rightConstraint?.constant = -40
			cell.leftConstraint?.constant = 16
		} else {
			cell.rightConstraint?.constant = -16
			cell.leftConstraint?.constant = 40
		}
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}
}
