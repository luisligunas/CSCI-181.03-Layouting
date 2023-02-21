//
//  Square.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

class Square: UIView {
	init() {
		super.init(frame: .zero)
		translatesAutoresizingMaskIntoConstraints = false
		backgroundColor = .random
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func updateColor() {
		backgroundColor = .random
	}
}

private extension UIColor {
	static var random: UIColor {
		return UIColor(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1),
			alpha: 1.0
		)
	}
}
