//
//  ProgrammaticTwitterViewController.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

struct ProgrammaticTweet {
	var text: String
	var image: UIImage?
	var isTextHidden: Bool = false
	var isTweetHorizontal: Bool = false
}

class ProgrammaticTwitterViewController: UITableViewController {

	/// This string is not defined in any storyboard/xib. You can change this string to virtually anything and still have a functioning program.
	private static let programmaticTwitterCellReuseIdentifier = "thisCanBeAnythingReally"

	var tweets = [
		ProgrammaticTweet(text: "This shows a pencil!", image: UIImage(systemName: "pencil")),
		ProgrammaticTweet(text: "This shows trash!", image: UIImage(systemName: "trash.circle")),
		ProgrammaticTweet(text: "This shows folder!", image: UIImage(systemName: "folder"))
	]

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.register(
			ProgrammaticTwitterTableViewCell.self,
			forCellReuseIdentifier: ProgrammaticTwitterViewController.programmaticTwitterCellReuseIdentifier
		)
		tableView.delegate = self
		tableView.dataSource = self
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: ProgrammaticTwitterViewController.programmaticTwitterCellReuseIdentifier,
			for: indexPath
		) as? ProgrammaticTwitterTableViewCell
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

		let tweet = tweets[indexPath.row]
		tweets[indexPath.row].isTextHidden.toggle()
		goToDetailsViewController(tweet: tweet)
	}

	func goToDetailsViewController(tweet: ProgrammaticTweet) {
		// Despite ProgrammaticTwitterViewController's UI not being defined by a xib,
		// you can still push or present other view controllers whose UI are defined by storyboards.

		// "DetailsViewController" is the file name of the storyboard.
		let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
		// The "detailsVCIdentifier" string is defined as the storyboard ID of the DetailsViewController
		guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsVCIdentifier") as? DetailsViewController else { return }

		detailsViewController.tweet = tweet

		// This generally shows the new screen from the bottom going up.
//		present(detailsViewController, animated: true)
		// This generally shows the new screen from the right going to the left.
		navigationController?.pushViewController(detailsViewController, animated: true)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tweets.count
	}
}
