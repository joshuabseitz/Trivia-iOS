//
//  Trivia.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

class Trivia {
	
	var buttons: [ChoiceButton]
	var questions: [Questions]
	var questionView: QuestionView
	var sessions: [Session]
	
	init(buttons: [ChoiceButton], questions: [Questions], questionView: QuestionView, sessions: [Session]) {
		self.buttons = buttons
		self.questions = questions
		self.questionView = questionView
		self.sessions = sessions
	}
	
	func getSessionQuestion(session: Int) -> String {
		return questions[session].question
	}
	
	func getSessionButtons(session: Int) -> [ChoiceButton] {
		
		var choices = questions[session].incorrect
		choices.append(questions[session].correct)
		choices.shuffle()
		
		var count = 0
		for choice in choices {
			buttons[count].setTitle(String(choice), for: .normal)
			buttons[count].isHidden = false
			count+=1
		}
		
		return buttons
	}
	
	func disableButtons() {
		for button in buttons {
			button.isEnabled = false
		}
	}
	
	func enableButtons() {
		for button in buttons {
			button.isEnabled = true
		}
	}
	
}
