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
		getData()
		
	}
	
	fileprivate func getData() {
		let url = URL(string: "https://jsonkeeper.com/b/CVHP")!
		URLSession.shared.dataTask(with: url) {(data, response, error) in
			
			do {
				let questions = try JSONDecoder().decode([Questions].self, from: data!) // force unwrap is bad practice
				self.updateQuestions(questions)
			} catch {
				print("There was an error finding the data!")
			}
			
		}.resume()
	}
	
	func updateQuestions(_ questions: [Questions]) {
		print(questions)
	}
}
