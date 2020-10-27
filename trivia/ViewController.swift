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
	@IBOutlet weak var question: UITextView!
	@IBOutlet weak var choice1: ChoiceButton!
	@IBOutlet weak var choice2: ChoiceButton!
	@IBOutlet weak var choice3: ChoiceButton!
	@IBOutlet weak var choice4: ChoiceButton!
	@IBOutlet weak var nextButton: UIButton!
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
//		print(getData(url: "https://jsonkeeper.com/b/CVHP"))
		setupUI()
		
		
		
	}
	
//	MARK: - Setup UI
	func setupUI() {
		
		// Question Text View
//		question.textContainerInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 2)
		question.centerVertically()
		
	}
	
	
//	MARK: - JSON Functions
	
	fileprivate func getData(url: String) {
		
		let url = URL(string: url)
		URLSession.shared.dataTask(with: url!) {(data, response, error) in
			
			do {
				let questions = try JSONDecoder().decode([Questions].self, from: data!) // force unwrap is bad practice
				self.updateQuestions(questions)
			} catch {
				self.jsonNotFound()
			}
			
		}.resume()
	}
	
	func updateQuestions(_ questions: [Questions]) {
		print(questions)
	}
	
	func jsonNotFound() {
		print("JSON not found")
	}
}

extension UITextView {

    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }

}
