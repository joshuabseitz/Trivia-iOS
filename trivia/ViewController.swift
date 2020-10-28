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

//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated) // No need for semicolon
//		getData(url: "https://jsonkeeper.com/b/CVHP")
//	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		nextButton.isHidden = true
		let data = readLocalFile(forName: "data")
		
		let questions = try! JSONDecoder().decode([Questions].self, from: data!)
		
		print(questions)
	}
	
// 	MARK: - Trivia Logic
	
//	func refreshQuestion() {
//		let randomQuestion = questionBank.randomElement()
//		let question = randomQuestion?.question
//		let correct = randomQuestion?.correct
//
//		var choices = randomQuestion?.incorrect
//		choices!.append(correct!)
//		choices!.shuffle()
//
//		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4,]
//
//		var count = 0
//		for button in buttons {
//			button.titleLabel!.text = choices![count]
//			count += 1
//		}
//	}
	
//	MARK: - JSON Functions
	
	private func readLocalFile(forName name: String) -> Data? {
		do {
			if let bundlePath = Bundle.main.path(forResource: name,
												 ofType: "json"),
				let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
				return jsonData
			}
		} catch {
			print(error)
		}
		
		return nil
	}
	
	//	fileprivate func getData(url: String) {
	//
	//		let url = URL(string: url)
	//		URLSession.shared.dataTask(with: url!) {(data, response, error) in
	//			let questions = try! JSONDecoder().decode([Questions].self, from: data!)
	//			self.saveQuestions(questions)
	//		}.resume()
	//	}
	//
	//	func saveQuestions(_ questions: [Questions]) {
	//		questionBank = questions
	//	}
	//
	//	func jsonNotFound() {
	//		print("JSON not found")
	//	}
	
	
}
