//
//  XibTwitterTableViewCell.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

/// NOTE: This class name should be set as the custom class of the table view cell in `XibTwitterTableViewCell.xib`
class XibTwitterTableViewCell: UITableViewCell {
	@IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var myImageView: UIImageView!
	@IBOutlet weak var tweetLabel: UILabel!
}
