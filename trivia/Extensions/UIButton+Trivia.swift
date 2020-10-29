//
//  choiceButton.swift
//  trivia
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

extension UIButton {
	
	func setUpAsChoiceButon() {
		layer.borderColor = UIColor.white.cgColor
		layer.borderWidth = CGFloat(1.0)
		layer.cornerRadius = CGFloat(20.0)
		titleEdgeInsets = UIEdgeInsets(top: 15,left: 15,bottom: 15,right: 15)
	}
	
	func highlightCorrect() {
		layer.borderColor = UIColor.correctChoiceBorderColor.cgColor
		layer.borderWidth = 3
		layer.cornerRadius = frame.height/4
	}
	
	func highlightIncorrect() {
		layer.borderColor = UIColor.red.cgColor
		layer.borderWidth = 3
		layer.cornerRadius = frame.height/4
	}
	
	func reset() {
		setUpAsChoiceButon()
		layer.borderWidth = 0
		layer.borderColor = UIColor.clear.cgColor
	}
}
