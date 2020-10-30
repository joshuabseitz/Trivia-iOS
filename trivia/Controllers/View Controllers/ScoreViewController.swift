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
	
	let data = ["One","Two","Three","Four","Five",]
	
	func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = scoreTable.dequeueReusableCell(withIdentifier: "ScoreTableViewCell") as? ScoreTableViewCell {
			return cell
		}
		
		return UITableViewCell()
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
	
	private func registerTableViewCells() {
		let scoreLabelCell = UINib(nibName: "ScoreTableViewCell",
								  bundle: nil)
		self.scoreTable.register(scoreLabelCell,
								forCellReuseIdentifier: "ScoreTableViewCell")
	}
	
}
