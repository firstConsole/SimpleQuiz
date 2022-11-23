//
//  QuestionModel.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import Foundation

struct Question: Codable {
    let text: String
    let answers: [Answer]
}

struct Answer: Codable {
    let text: String
    let correct: Bool
}
