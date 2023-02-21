//
//  RandomizingColorsTableViewController.swift
//  Layout Test App
//
//  Created by Luis Ligunas on 2/21/23.
//

import UIKit

class RandomizingColorsTableViewController: UITableViewController {

	/// This string is not defined in any storyboard. You can change this string to virtually anything and still have a functioning program.
	private static let randomColorsCellReuseIdentifier = "thisCanBeAnythingReally;it'sNotDefinedInAStoryboardOrWherever"

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(RandomColorsTableViewCell.self, forCellReuseIdentifier: RandomizingColorsTableViewController.randomColorsCellReuseIdentifier)
		tableView.delegate = self
		tableView.dataSource = self
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: RandomizingColorsTableViewController.randomColorsCellReuseIdentifier,
			for: indexPath
		) as? RandomColorsTableViewCell
		else { return UITableViewCell() }
		
		cell.updateColors()
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
}
