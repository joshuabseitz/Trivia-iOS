//
//  triviaTests.swift
//  triviaTests
//
//  Created by Josh on 10/27/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import XCTest
@testable import trivia

class triviaTests: XCTestCase {
	
	func testAddStuff() throws {
		let math = MathStuff()
		let result = math.addNumbers(x: 1, y: 2)
		XCTAssertEqual(result, 3)
	}

}
