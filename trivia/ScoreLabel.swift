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

    func setup() {
		layer.cornerRadius = CGFloat(20.0)
		layer.masksToBounds = true
    }
}
