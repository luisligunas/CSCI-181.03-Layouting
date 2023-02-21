//
//  StoryboardTwitterTableViewController.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

struct StoryboardTweet {
	var text: String
	var image: UIImage?
	var isTextHidden: Bool = false
	var isTweetHorizontal: Bool = false
}

class StoryboardTwitterTableViewController: UITableViewController {

	/// This string is defined in `StoryboardTwitterTableViewCell.xib`. They should be the same.
	private static let storyboardTwitterCellReuseIdentifier = "hotdog"

	var tweets = [
		StoryboardTweet(text: "This shows a pencil!", image: UIImage(systemName: "pencil")),
		StoryboardTweet(text: "This shows trash!", image: UIImage(systemName: "trash.circle")),
		StoryboardTweet(text: "This shows folder!", image: UIImage(systemName: "folder"))
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// "StoryboardTwitterTableViewCell" is the name of the xib file.
		tableView.register(
			UINib(nibName: "StoryboardTwitterTableViewCell", bundle: nil),
			forCellReuseIdentifier: StoryboardTwitterTableViewController.storyboardTwitterCellReuseIdentifier
		)

		tableView.delegate = self
		tableView.dataSource = self
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: StoryboardTwitterTableViewController.storyboardTwitterCellReuseIdentifier,
			for: indexPath
		) as? StoryboardTwitterTableViewCell
		else { return UITableViewCell() }

		let tweet = tweets[indexPath.row]
		cell.stackView.axis = tweet.isTweetHorizontal ? .horizontal : .vertical
		cell.tweetLabel.isHidden = tweet.isTextHidden
		cell.tweetLabel.text = tweet.text
		cell.myImageView.image = tweet.image
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

//		tweets[indexPath.row].isTextHidden.toggle()
		tweets[indexPath.row].isTweetHorizontal.toggle()
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets.count
	}
}
