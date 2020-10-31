//
//  triviaTests.swift
//  triviaTests
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import XCTest
@testable import trivia

class questionProviderTests: XCTestCase {
	
	///Does QuestionProvider.getQuestions return an array of type Question?
	func testQuestionProvider() {
		let result = QuestionProvider.getQuestions(fileName: "")
		XCTAssertTrue((result as Any) is [Question])
	}
	
}
