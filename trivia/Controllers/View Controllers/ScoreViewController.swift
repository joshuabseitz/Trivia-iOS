//
//  StartViewController.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

//MARK: - IBOutlets



class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
//	let data = PersistenceController.getAllScores()
	
	/// Grabs data from persistence controller and sorts it highest point first
	private var data: [Score] {
		
		var data = PersistenceController.getAllScores()
		data = data.sorted(by: { $1.scorePoints < $0.scorePoints})
		return data
		
	}

	@IBOutlet weak var scoreTable: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.setNavigationBarHidden(true, animated: false)
		
		self.scoreTable.dataSource = self
		self.scoreTable.delegate = self
		self.registerTableViewCells()
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	/// Registeres tableview with custom cell
	private func registerTableViewCells() {
		let scoreLabelCell = UINib(nibName: "ScoreTableViewCell",
								  bundle: nil)
		self.scoreTable.register(scoreLabelCell,
								forCellReuseIdentifier: "ScoreTableViewCell")
	}
	
	/// Defines the number of rows, acoording to data
	func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
	
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = scoreTable.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as? ScoreTableViewCell {
			cell.scoreName.text = data[indexPath.row].scoreName
			cell.scorePoints.text = String(data[indexPath.row].scorePoints)
			return cell
		}
		
		return UITableViewCell()
	}
	
}
