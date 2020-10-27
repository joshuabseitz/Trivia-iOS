//
//  Questions.swift
//  trivia
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct Questions: Decodable {
	let question: String
	let incorrect: [String]
	let correct: String
}
