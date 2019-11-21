//
//  PhyscalExerciseViewController.swift
//  rehabs
//
//  Created by Jan Timar on 26/10/2019.
//  Copyright © 2019 Jan Timar. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

final class PhyscalExerciseViewController: BaseViewController {
	// MARK: - Public properties
	var viewModel: PhyscalExerciseViewModelProtocol?

	// MARK: - IBOutlets
	private var playerView: PlayerView?
	private var titleLabel: UILabel?
	private var skipButton: BaseButton?

	override func loadView() {
		super.loadView()

		// Title
		let titleLabel = UILabel()
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textColor = appStyle.colors.title
		titleLabel.font = appStyle.fonts.title
		titleLabel.numberOfLines = 2
		titleLabel.text = "Let's get play more,\nlittle bit move."
		titleLabel.textAlignment = .center
		self.titleLabel = titleLabel

		let playerView = PlayerView(video: "IMG_0115")
		playerView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(playerView)
		self.playerView = playerView

		if let playerViewController = playerView.playerViewController {
			addChild(playerViewController)
		}

		let skipButton = BaseButton()
		view.addSubview(skipButton)
		skipButton.setTitle("Skip", for: .normal)
		self.skipButton = skipButton
		skipButton.tap = viewModel?.skip

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
			titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),

			playerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			playerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			playerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
			playerView.heightAnchor.constraint(equalToConstant: 190),

			skipButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			skipButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
			skipButton.heightAnchor.constraint(equalToConstant: 50),
			skipButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
			skipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])

		NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
	}
}

// MARK: - Actions
private extension PhyscalExerciseViewController {
	@objc func skip() {
		viewModel?.skip()
	}

	@objc func playerDidFinishPlaying() {
		viewModel?.finish()
	}
}

final class PlayerView: UIView {
	var playerViewController: AVPlayerViewController?

	convenience init(video: String) {
		self.init(frame: .zero)

        guard let path = Bundle.main.path(forResource: video, ofType:"MOV") else {
            debugPrint("\(video).MOV not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))

		let viewController = AVPlayerViewController()
		viewController.showsPlaybackControls = true
		viewController.player = player
		guard let childView = viewController.view else { return }
		addSubview(childView)
		playerViewController = viewController

		childView.translatesAutoresizingMaskIntoConstraints = false
		childView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
		childView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		childView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		childView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
	}
}
