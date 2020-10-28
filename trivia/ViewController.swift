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
		
		// Read JSON
		let data = readLocalFile(forName: "data")
		let questions = try! JSONDecoder().decode([Questions].self, from: data!)
		questionBank = questions
		
		// Put choicebuttons in array
		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4,]
		for button in buttons {
			button.isHidden = true
		}
		
		// Refresh Question
		refreshQuestion(buttons: buttons, questionView: question)
	}
	
// 	MARK: - Trivia Logic
	
	/**
	Grabs a new, random question and refreshes buttons + question text
	- Parameter buttons: Recieves an array of buttons that appear on the view
	- Parameter questionView: Recieves the QuestionView, where the question text will appear
	*/
	
	func refreshQuestion(buttons: [ChoiceButton], questionView: QuestionView) {
		
		let randomQuestion = questionBank.randomElement()
		deleteQuestion(questionToDelete: randomQuestion!)
		
		var choices = randomQuestion?.incorrect
		choices!.append(randomQuestion!.correct)
		choices!.shuffle()
		
		question.text = randomQuestion?.question
		
		var count = 0
		for choice in choices! {
			buttons[count].setTitle(String(choice), for: .normal)
			buttons[count].isHidden = false
			count+=1
		}

	}
	
	func deleteQuestion(questionToDelete: Questions) {
		
		if let index = questionBank.firstIndex(of: questionToDelete) {
			questionBank.remove(at: index)
			print("Question deleted")
		}
		
	}
	
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
	
}
