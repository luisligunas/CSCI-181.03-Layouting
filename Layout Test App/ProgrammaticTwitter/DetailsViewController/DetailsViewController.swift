//
//  DetailsViewController.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/8/23.
//

import UIKit

class DetailsViewController: UIViewController {

	var tweet: ProgrammaticTweet?
	@IBOutlet weak var textLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		textLabel?.text = tweet?.text ?? "No Tweet Text"
	}
}
