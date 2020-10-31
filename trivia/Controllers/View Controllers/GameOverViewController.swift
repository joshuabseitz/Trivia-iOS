//
//  GameOverViewController.swift
//  trivia
//
//  Created by Josh on 10/30/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
	
// MARK: - IBOutlets
	
	@IBOutlet weak var gameOverMessage: VerticallyCenteredTextView!
	@IBOutlet weak var saveScoreButton: UIButton!
	@IBOutlet weak var playAgainButton: UIButton!
	
// MARK: - Properties
	
	var points: Int = 0
	var playerName = ""

// MARK: - View Lifecycles
	
    override func viewDidLoad() {
        super.viewDidLoad()
		gameOverMessage.text = "Game over – you scored \(points) points."
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	func saveScore() {
		let score = Score(context: PersistenceController.container.viewContext)
		score.scoreName = playerName
		score.scorePoints = Int16(points)
		PersistenceController.save(score)
	}

//MARK: - IBActions
	
	@IBAction func didTapSaveScore(_ sender: Any) {
		saveScoreButton.isHidden = true
		saveScoreButton.isEnabled = false
		showTextDialogBox(title: "Save Score", message: "Please enter a nickname that we can display with your score.", actionTitle: "Save", placeholder: "Enter a nickname")
	}
	
	func showTextDialogBox(title: String, message: String, actionTitle: String, placeholder: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

		alert.addTextField(configurationHandler: {(textField: UITextField!) in
		textField.placeholder = placeholder
		})
		
		alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { [weak alert] (_) in
			let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
			self.playerName = textField!.text!
			self.saveScore()
		}))
		
		self.present(alert, animated: true, completion: nil)
	}
}
