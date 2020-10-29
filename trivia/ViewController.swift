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
	
	@IBOutlet weak var scoreLabel: ScoreLabel!
	
	
//	MARK: - Properties
	var questionBank = [Questions]()
	var currentQuestion = Questions(question: "Default", incorrect: ["Default"], correct: "Default")
	var points = 0
	var questionCount = 0
	
//	MARK: - View Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		nextButton.isHidden = true
		
		// Read JSON
		let data = readLocalFile(forName: "data")
		let questions = try! JSONDecoder().decode([Questions].self, from: data!)
		questionBank = questions

		// Set Title
		self.title = "Trivia"
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		setup()

	}
	
//	MARK: - IB Actions
	@IBAction func didSelectChoice(_ sender: ChoiceButton) {
		tappedAnswer(sender)
	}
	
	@IBAction func didTapNextQuestion(_ sender: UIButton) {
		
		
		// Put buttons into array
		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4,]
		
		// Resets button styling for button that was revealed
		buttons[indexOfCorrectAnswer(question: currentQuestion)!].reset()
		
		setup()
	}
	
	
// 	MARK: - Trivia Logic
	
	func setup() {
		
		// Put buttons into array
		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4,]
		
		if questionCount < 10 {
			
			hideButtons()
			
			// Refresh Question
			refreshQuestion(buttons: buttons, questionView: question)
			
			// Hide Next question Button
			nextButton.isHidden = true
			
			// Enable all buttons
			buttonsEnabled(buttons: buttons, visible: true)
			
			// Increments question count to track how many questions the user has gotten
			questionCount += 1
			print("questioncount: \(questionCount)")
		
		} else {
			
			hideButtons()
			question.text = "Game over – you scored \(points) points."
			question.center()
			question.centerVertically()
			
		}
	}
	
	func refreshQuestion(buttons: [ChoiceButton], questionView: QuestionView) {
		
		currentQuestion = questionBank.randomElement()!
		deleteQuestion(questionToDelete: currentQuestion)
		
		var choices = currentQuestion.incorrect
		choices.append(currentQuestion.correct)
		choices.shuffle()
		
		question.text = currentQuestion.question
		question.centerVertically()
		
		var count = 0
		for choice in choices {
			buttons[count].setTitle(String(choice), for: .normal)
			buttons[count].isHidden = false
			count+=1
		}

	}
	
	func tappedAnswer(_ buttonPressed: ChoiceButton) {
		
		// Disable buttons
		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4]
		buttonsEnabled(buttons: buttons, visible: false)
		
		let buttonTitle = String(buttonPressed.title(for: .normal)!)
		
		if currentQuestion.correct.contains(buttonTitle) {
			updateScore(10)
			print("User selected the correct choice. User's points are now: \(points)")
			revealAnswer()
			nextButton.isHidden = false
		} else {
			print("User selected incorrect choice.")
			revealAnswer()
			nextButton.isHidden = false
		}
	}
	
	func buttonsEnabled(buttons: [ChoiceButton], visible: Bool) {
		if visible {
			for button in buttons {
				button.isEnabled = true
			}
		} else {
			for button in buttons {
				button.isEnabled = false
			}
		}
		
	}
	
	func hideButtons() {
		let buttons: [ChoiceButton] = [choice1, choice2, choice3, choice4,]
		for button in buttons {
			button.isHidden = true
		}
	}
	
	func updateScore(_ pts: Int?) {
		points += pts!
		scoreLabel.text = "\(points) pts"
	}
	
	func deleteQuestion(questionToDelete: Questions) {
		
		if let index = questionBank.firstIndex(of: questionToDelete) {
			questionBank.remove(at: index)
			print("Question deleted")
		}
		
	}
	
	func revealAnswer() {
		let buttons = [choice1, choice2, choice3, choice4]
		buttons[indexOfCorrectAnswer(question: currentQuestion)!]!.reveal()
	}
	
	func indexOfCorrectAnswer(question: Questions) -> Int? {
		let buttons = [choice1.title(for: .normal), choice2.title(for: .normal), choice3.title(for: .normal), choice4.title(for: .normal)]
		if let index = buttons.firstIndex(of: question.correct) {
			return index
		} else {
			return nil
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
