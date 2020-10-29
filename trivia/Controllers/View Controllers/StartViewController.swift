//
//  StartViewController.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.setNavigationBarHidden(true, animated: false)
    }
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}
