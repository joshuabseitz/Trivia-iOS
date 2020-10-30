//
//  GameOverViewController.swift
//  trivia
//
//  Created by Josh on 10/30/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
	
	@IBOutlet weak var gameOverMessage: VerticallyCenteredTextView!
	
	var points: Int = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		gameOverMessage.text = "Game over – you scored \(points) points."
    }
	
	func storeScore() {
		let score = Score(context: PersistenceController.container.viewContext)
		score.scoreName = "Joshua Seitz"
		score.scorePoints = Int16(points)
		PersistenceController.save(score)
		print(PersistenceController.getAllScores())
	}

}
