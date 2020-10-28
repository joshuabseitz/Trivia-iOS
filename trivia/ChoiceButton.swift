//
//  choiceButton.swift
//  trivia
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import UIKit

class ChoiceButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder:coder)
		setConfig()
	}
	
	func setConfig() {
		
//		layer.borderWidth = CGFloat(1.0)
//		layer.cornerRadius = CGFloat(5.0)
		titleEdgeInsets = UIEdgeInsets(top: 15,left: 15,bottom: 15,right: 15)
	}
	
}
