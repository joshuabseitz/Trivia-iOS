//
//  Questions.swift
//  trivia
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct Question: Decodable, Equatable {
	
	let text: String
	let correctChoice: String
	let incorrectChoices: [String]
	
	/// Set up a custom value name for matching json value name
	private enum CodingKeys: String, CodingKey {
        case text = "question"
		case incorrectChoices = "incorrect"
		case correctChoice = "correct"
    }
	
	/// All choices for this question, randomized
	var randomizedChoices: [String] {
		var randomizedChoices = incorrectChoices
		randomizedChoices.append(correctChoice)
		randomizedChoices.shuffle()
		return randomizedChoices
	}
}
