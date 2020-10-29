//
//  UIColor+Extensions.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

extension UIColor {
	
	/// The color to be used for the correct button choice border.
	static var correctChoiceBorderColor: UIColor {
		return .init(red: 194/255,
					 green: 168/255,
					 blue: 62/255,
					 alpha: 1)
	}
	
	/// The color to be used for the incorrect button choice border.
	static var incorrectChoiceBorderColor: UIColor {
		return .init(red: 255/255,
					 green: 70/255,
					 blue: 70/255,
					 alpha: 1)
	}
}
