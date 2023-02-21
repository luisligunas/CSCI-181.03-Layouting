//
//  RandomColorsTableViewCell.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

class RandomColorsTableViewCell: UITableViewCell {
	static let squares = 10

	var mySquares = [Square]()
	let stackView = UIStackView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
	}
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI()
	}

	func setupUI() {
		stackView.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(stackView)
		stackView.distribution = .fillEqually

		for _ in 0...RandomColorsTableViewCell.squares {
			let square = Square()
			mySquares.append(square)
			stackView.addArrangedSubview(square)
		}

		let constraints = [
			stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}

	func updateColors() {
		mySquares.forEach { square in
			square.updateColor()
		}
	}
}


