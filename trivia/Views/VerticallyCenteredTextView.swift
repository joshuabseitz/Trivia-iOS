//
//  QuestionView.swift
//  trivia
//
//  Created by Josh on 10/28/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import UIKit

class VerticallyCenteredTextView: UITextView {
    override var contentSize: CGSize {
        didSet {
            var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
            topCorrection = max(0, topCorrection)
            contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
        }
    }
}
