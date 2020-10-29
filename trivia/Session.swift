//
//  Session.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct Session {
	var gameSession: Int
	var userScored: Bool
	
	init(gameSession: Int, userScored: Bool) {
		self.gameSession = gameSession
		self.userScored = userScored
	}
}
