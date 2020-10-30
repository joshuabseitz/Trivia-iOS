//
//  QuestionView.swift
//  trivia
//
//  Created by Josh on 10/28/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {

	func centerText() {
		let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
		let size = sizeThatFits(fittingSize)
		let topOffset = (bounds.size.height - size.height * zoomScale) / 2
		let positiveTopOffset = max(1, topOffset)
		contentOffset.y = -positiveTopOffset
	}
	
}
