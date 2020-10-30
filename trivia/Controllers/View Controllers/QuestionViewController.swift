//
//  ViewController.swift
//  trivia
//
//  Created by Josh on 10/26/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {
	
	//	MARK: - IBOutlets
	
	@IBOutlet private weak var questionView: VerticallyCenteredTextView!
	@IBOutlet private weak var nextButton: UIButton!
	@IBOutlet private weak var scoreLabel: ScoreLabel!
	
	@IBOutlet weak var choiceButton1: UIButton!
	@IBOutlet weak var choiceButton2: UIButton!
	@IBOutlet weak var choiceButton3: UIButton!
	@IBOutlet weak var choiceButton4: UIButton!
	
	@IBOutlet weak var scoreView: VerticallyCenteredTextView!
	
	
	//	MARK: - Properties
	
	private var questions = [Question]()
	private var currentQuestionIndex = 0
	private var points = 0
	private let maxQuestionsLimit = 10
	private var numberOfQuestionsAsked = 0
	
	private var correctSound = URL(fileURLWithPath: Bundle.main.path(forResource: "correctSound", ofType: "wav")!)
	private var incorrectSound = URL(fileURLWithPath: Bundle.main.path(forResource: "incorrectSound", ofType: "wav")!)
	private var audioPlayer = AVAudioPlayer()

	private var choiceButtons: [UIButton] {
		[choiceButton1, choiceButton2, choiceButton3, choiceButton4]
	}
	
	//	MARK: - View Lifecycles
	
	override func viewDidLoad() {
		super.viewDidLoad()

		questions = QuestionProvider.questions
		nextButton.isHidden = true
		navigationController?.setNavigationBarHidden(true, animated: false)
		updateChoiceButtons()
		reloadView()
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Determine what the segue destination is
        if segue.destination is GameOverViewController
        {
            let vc = segue.destination as? GameOverViewController
            vc?.points = points
        }
    }
	
	//	MARK: - IB Actions
	
	@IBAction func didTapChoiceButton(_ sender: UIButton) {
		
		enableButtons(enable: false)
		let choiceIsCorrect = sender.titleLabel?.text == questions[currentQuestionIndex].correctChoice
		
		if choiceIsCorrect {
			playSound(correctSound)
			updateScore(10)
			print("User selected the correct choice. User's points are now: \(points)")
			revealAnswer()
			
		} else {
			print("User selected incorrect choice.")
			playSound(incorrectSound)
			sender.highlightIncorrect()
			revealAnswer()
		}
		
		questions.remove(at: (currentQuestionIndex))
		nextButton.isHidden = false
	}
	
	@IBAction func didTapNextQuestion(_ sender: UIButton) { reloadView() }
	
	
	
	// 	MARK: - Trivia Logic
	
	func playSound(_ soundURL: URL) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
			audioPlayer.play()
		} catch {
		   print("Couldn't find the audio source for \(soundURL).")
		}
	}
	
	func reloadView() {
		let shouldAskMoreQuestions = numberOfQuestionsAsked < maxQuestionsLimit
		if shouldAskMoreQuestions { askQuestion() } else { self.performSegue(withIdentifier: "gameOverSegue", sender: nil) }
	}
	
	func askQuestion() {
		enableButtons()
		refreshQuestion()
		updateChoiceButtons()
		nextButton.isHidden = true
		numberOfQuestionsAsked += 1
		print("Number of questions asked: \(numberOfQuestionsAsked)")
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
