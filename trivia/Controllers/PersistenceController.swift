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
	
	static func save(_ score: Score) {
		
		do {
			try container.viewContext.save()
		} catch {
			print(error)
		}
	}
	
	static func getAllScores() -> [Score] {
		let highscoreFetchRequest: NSFetchRequest<Score> = Score.fetchRequest()
		let highscoreResult = try! container.viewContext.fetch(highscoreFetchRequest)
		return highscoreResult
	}
	
	static func delete(_ score: Score){
		container.viewContext.delete(score)
		try! container.viewContext.save()
	}
}
