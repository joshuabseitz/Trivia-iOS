//
//  Questions.swift
//  trivia
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct Questions: Decodable, Equatable {
	
	let question: String
	let incorrect: [String]
	let correct: String
	
	init(question: String, incorrect: [String], correct: String){
		self.question = question
		self.incorrect = incorrect
		self.correct = correct
	}
	
	func getRandomChoices() -> [String] {
		var randomChoices = incorrect
		randomChoices.append(correct)
		randomChoices.shuffle()
		return randomChoices
	}
	
}
