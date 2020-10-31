//
//  triviaTests.swift
//  triviaTests
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import XCTest
@testable import trivia

class PersistenceControllerTests: XCTestCase {
	
	///Does the PersistenceController save properly?
	func testCoreDataSave() {
		
		// Create testScore
		let testScore = Score(context: PersistenceController.container.viewContext)
		testScore.scoreName = "Test Score"
		testScore.scorePoints = Int16(300)
		PersistenceController.save(testScore)
		
		// Get allScores
		let allScores = PersistenceController.getAllScores()
		
		if !allScores.isEmpty {
			
			// Test that allScores contains testScore
			XCTAssertTrue(allScores.contains(testScore))
		
		} else {
			
			XCTFail("PersistenceController returned a value of nil for .getAllScores()")
		}
		
		// Delete testScore
		PersistenceController.delete(testScore)
		
	}
	
	///Does the PersistenceController delete properly?
	func testCoreDataDelete() {
		
		// Create testScore
		let testScore = Score(context: PersistenceController.container.viewContext)
		testScore.scoreName = "Test Score"
		testScore.scorePoints = Int16(300)
		PersistenceController.save(testScore)
		
		// Get allScores
		var allScores = PersistenceController.getAllScores()
		
		if allScores.contains(testScore) {
			
			// Delete testScore
			PersistenceController.delete(testScore)
			
			// Get updated allScores
			allScores = PersistenceController.getAllScores()
			
			// Test that allScores no longer containts testScore
			XCTAssertFalse(allScores.contains(testScore))
			
		} else {
			
			XCTFail("Could not create testScore to be deleted")

		}
	}
}
