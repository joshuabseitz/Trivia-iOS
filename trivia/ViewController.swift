//
//  ViewController.swift
//  trivia
//
//  Created by Josh on 10/26/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//	MARK: - IBOutlets
	@IBOutlet weak var question: QuestionView!
	@IBOutlet weak var choice1: ChoiceButton!
	@IBOutlet weak var choice2: ChoiceButton!
	@IBOutlet weak var choice3: ChoiceButton!
	@IBOutlet weak var choice4: ChoiceButton!
	@IBOutlet weak var nextButton: ScoreLabel!
	
//	MARK: - Properties
	var questionBank = [Questions]()
	
//	MARK: - View Lifecycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		getData(url: "https://jsonkeeper.com/b/CVHP")
		nextButton.isHidden = true
	}
	
	
//	MARK: - JSON Functions
	
	fileprivate func getData(url: String) {

		let url = URL(string: url)
		URLSession.shared.dataTask(with: url!) {(data, response, error) in
			let questions = try! JSONDecoder().decode([Questions].self, from: data!)
			self.saveQuestions(questions)
		}.resume()
	}
	
	func saveQuestions(_ questions: [Questions]) {
		questionBank = questions
	}
	
	func jsonNotFound() {
		print("JSON not found")
	}
}
