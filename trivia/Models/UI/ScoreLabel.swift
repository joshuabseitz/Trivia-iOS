//
//  ScoreLabel.swift
//  trivia
//
//  Created by Josh on 10/28/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import UIKit

class ScoreLabel: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
	
	override func drawText(in rect: CGRect) {
		let insets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 5)
		super.drawText(in: rect.inset(by: insets))
	}

    func setup() {
		layer.masksToBounds = true
    }
}
