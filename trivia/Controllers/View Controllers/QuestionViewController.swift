//
//  ViewController.swift
//  trivia
//
//  Created by Josh on 10/26/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
	
	//	MARK: - IBOutlets
	
	@IBOutlet private weak var questionView: QuestionView!
	@IBOutlet private weak var nextButton: UIButton!
	@IBOutlet private weak var scoreLabel: ScoreLabel!
	
	@IBOutlet weak var choiceButton1: UIButton!
	@IBOutlet weak var choiceButton2: UIButton!
	@IBOutlet weak var choiceButton3: UIButton!
	@IBOutlet weak var choiceButton4: UIButton!
	
	//	MARK: - Properties
	
	private var questions = [Question]()
	private var currentQuestionIndex = 0
	private var points = 0
	private let maxQuestionsLimit = 10
	private var numberOfQuestionsAsked = 0
	
	/// A convenient collection of all choice buttons.
	private var choiceButtons: [UIButton] {
		[choiceButton1, choiceButton2, choiceButton3, choiceButton4]
	}
	
	//	MARK: - View Lifecycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Trivia"
		questions = QuestionProvider.questions
		nextButton.isHidden = true
		navigationController?.setNavigationBarHidden(true, animated: false)
		updateChoiceButtons()
		reloadView()
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	//	MARK: - IB Actions
	
	@IBAction func didTapChoiceButton(_ sender: UIButton) {
		
		enableButtons(enable: false)
		
		if sender.titleLabel?.text == questions[currentQuestionIndex].correctChoice {
			// Picked correct choice.
			updateScore(10)
			print("User selected the correct choice. User's points are now: \(points)")
			revealAnswer()
			
		} else {
			// Picked incorrect choice.
			print("User selected incorrect choice.")
			sender.highlightIncorrect()
			revealAnswer()
		}
		
		questions.remove(at: (currentQuestionIndex))
		
		nextButton.isHidden = false
	}
	
	@IBAction func didTapNextQuestion(_ sender: UIButton) {
		reloadView()
	}
	
	
	// 	MARK: - Trivia Logic
	
	func reloadView() {
		
		let shouldAskMoreQuestions = numberOfQuestionsAsked < maxQuestionsLimit
		
		if shouldAskMoreQuestions {
			enableButtons()
			refreshQuestion()
			updateChoiceButtons()
			nextButton.isHidden = true
			numberOfQuestionsAsked += 1
			print("Number of questions asked: \(numberOfQuestionsAsked)")
			
		} else {
			for button in choiceButtons { button.isHidden = true }
			questionView.text = "Game over – you scored \(points) points."
			questionView.centerText()
		}
	}
	
	private func updateChoiceButtons() {
		prepareChoiceButtons()
		
		let choices = questions[currentQuestionIndex].randomizedChoices
		
		var choiceIndex = 0
		while choiceIndex <= choices.count - 1 {
			let button = choiceButtons[choiceIndex]
			button.setStyling()
			button.setTitle(choices[choiceIndex], for: .normal)
			button.isHidden = false
			choiceIndex += 1
		}
	}
	
	func refreshQuestion() {
		
		// Get a new question index.
		currentQuestionIndex = Int.random(in: 0...questions.count - 1)
		
		// Update the question view.
		questionView.text = questions[currentQuestionIndex].text
		questionView.centerText()
	}
	
	func enableButtons(enable: Bool = true) {
		for button in choiceButtons { button.isEnabled = enable }
	}
	
	func prepareChoiceButtons() {
		for button in choiceButtons { button.isHidden = true; button.reset() }
	}
	
	func updateScore(_ pts: Int) {
		points += pts
		scoreLabel.text = "\(points) pts"
	}
	
	func revealAnswer() {
		for button in choiceButtons {
			
			if button.titleLabel?.text == questions[currentQuestionIndex].correctChoice {
				button.highlightCorrect()
			}
		}
	}
}

extension UITextView {

    func centerText() {
        self.textAlignment = .center
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }

}
