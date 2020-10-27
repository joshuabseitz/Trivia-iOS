//
//  ViewController.swift
//  trivia
//
//  Created by Josh on 10/26/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
			
		//JSON Setup
		let JSON = """
		{
			"question": "In Shakespeare's play Julius Caesar, Caesar's last words were...",
			"incorrect": ["Iacta alea est!", "Vidi, vini, vici", "Aegri somnia vana"],
			"correct": "Et tu, Brute?"
		}
		"""

		let jsonData = JSON.data(using: .utf8)!
		let question: Question = try! JSONDecoder().decode(Question.self, from: jsonData)

		print(question.question) // Prints: "Optionals in Swift explained: 5 things you should know"
		
	}
}

struct Question: Decodable {
    let question: String
	let incorrect: [String]
	let correct: String
}
