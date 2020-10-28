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
	@IBOutlet weak var nextButton: UIButton!
	
// MARK: - Global Variable
	var questionBank: [Questions] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
//		print(getData(url: "https://jsonkeeper.com/b/CVHP"))
	}
	
	
//	MARK: - JSON Functions
	
	fileprivate func getData(url: String) {
		
		let url = URL(string: url)
		URLSession.shared.dataTask(with: url!) {(data, response, error) in
			
			do {
				let questions = try JSONDecoder().decode([Questions].self, from: data!) // force unwrap is bad practice
			} catch {
				self.jsonNotFound()
			}
			
		}.resume()
	}
	
	func jsonNotFound() {
		print("JSON not found")
	}
}
