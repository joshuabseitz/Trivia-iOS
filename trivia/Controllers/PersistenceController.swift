//
//  PersistenceController.swift
//  trivia
//
//  Created by Josh on 10/26/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import CoreData

struct PersistenceController {
	
	static var container: NSPersistentContainer!
	
	static func save(_ highscore: Highscore) {
		
		do {
			try container.viewContext.save()
		} catch {
			print(error)
		}
	}
	
	static func getAllHighscores() -> [Highscore] {
		let highscoreFetchRequest: NSFetchRequest<Highscore> = Highscore.fetchRequest()
		let highscoreResult = try! container.viewContext.fetch(highscoreFetchRequest)
		return highscoreResult
	}
	
	static func delete(_ highscore: Highscore){
		container.viewContext.delete(highscore)
		try! container.viewContext.save()
	}
}
