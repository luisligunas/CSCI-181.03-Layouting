//
//  ProgrammaticTwitterTableViewCell.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/8/23.
//

import UIKit

class ProgrammaticTwitterTableViewCell: UITableViewCell {
	let tweetLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let myImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	let stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .leading
		return stackView
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI()
	}

	func setupUI() {
		// Use V1 for a non-flexible layout that does not use a UIStackView
//		setupUIV1()
		// Use V2 for a flexible layout that uses a UIStackView
		setupUIV2()
	}

	func setupUIV1() {
		tweetLabel.translatesAutoresizingMaskIntoConstraints = false
		myImageView.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(tweetLabel)
		contentView.addSubview(myImageView)

		let constraints = [
			tweetLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor),
			tweetLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			tweetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			tweetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

			myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
		]
		NSLayoutConstraint.activate(constraints)
	}

	func setupUIV2() {
		contentView.addSubview(stackView)
		stackView.addArrangedSubview(myImageView)
		stackView.addArrangedSubview(tweetLabel)

		let constraints = [
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
		]
		NSLayoutConstraint.activate(constraints)
	}

	// MARK: Exhibiting lazy variables.
	lazy var string: String = {
		print("Creating string...")
		return "Test"
	}()

	func onTap() {
		print(string)
	}
}
