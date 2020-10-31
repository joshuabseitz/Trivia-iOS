//
//  QuestionProvider.swift
//  trivia
//
//  Created by Josh on 10/29/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation

struct QuestionProvider {
	
	static func getQuestions(fileName: String) -> [Question] {
		let data = readLocalFile(forName: fileName)
		let questions = try! JSONDecoder().decode([Question].self, from: data!)
		return questions
	}
	
	//	MARK: - JSON Functions
	
	private static func readLocalFile(forName name: String) -> Data? {
		
		guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json") else {
			print("Failed to read question data from local file.")
			return nil
		}
		
		do {
			if let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) { return jsonData }
		} catch {
			print(error)
		}
		
		return nil
	}
}
