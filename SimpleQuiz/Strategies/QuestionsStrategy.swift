//
//  QuestionsStrategy.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 04.12.2022.
//

import UIKit

protocol QuestionsStrategy {
    func createQuestions()
    func setupQuestion(with question: Question)
}

final class QuestionsEasy: QuestionsStrategy {
    
    private let gameScene = GameScene()
    private var questionNumber: Int = 1
    
    func setupQuestion(with question: Question) {
        DispatchQueue.main.async {
            self.gameScene.currentQuestion = question
            self.gameScene.questionTextLabel.text = question.text
            self.gameScene.questionNumberLabel.text = "\(self.questionNumber)"
            self.gameScene.tableView.reloadData()
        }
    }
    
    func createQuestions() {
        let questions: [Question] = gameScene.questions
        let indexPath = IndexPath()
        let answer = questions[indexPath.row].answers[indexPath.row]
        guard let currentQuestion = gameScene.currentQuestion else { return }
        if gameScene.checkAnswer(answer: answer, question: currentQuestion) {
            if let index = questions.firstIndex(where: { $0.text == currentQuestion.text }) {
                if index < (questions.count - 1) {
                    let nextQuestion = questions[index + 1]
                    let questionNumber = index + 1
                    
                    setupQuestion(with: nextQuestion)
                }
            }
        }
    }
}

final class QuestionsNormal: QuestionsStrategy {
    
    private let gameScene = GameScene()
    private var questionNumber: Int = 1
    
    func setupQuestion(with question: Question) {
        DispatchQueue.main.async {
            self.gameScene.currentQuestion = question
            self.gameScene.questionTextLabel.text = question.text
            self.gameScene.questionNumberLabel.text = "\(self.questionNumber)"
            self.gameScene.tableView.reloadData()
        }
    }
    
    func createQuestions() {
        let questions: [Question] = gameScene.questions
        let indexPath = IndexPath()
        let answer = questions[indexPath.row].answers[indexPath.row]
        guard let currentQuestion = gameScene.currentQuestion else { return }
        if gameScene.checkAnswer(answer: answer, question: currentQuestion) {
            if let index = questions.firstIndex(where: { $0.text == currentQuestion.text }) {
                if index < (questions.count - 1) {
                    guard let nextQuestion = questions.randomElement() else {
                        return
                    }
                    
                    let questionNumber = index + 1
                    
                    setupQuestion(with: nextQuestion)
                }
            }
        }
    }
}

final class QuestionsHard: QuestionsStrategy {
    
    private let gameScene = GameScene()
    private var questionNumber: Int = 1
    
    func setupQuestion(with question: Question) {
        DispatchQueue.main.async {
            self.gameScene.currentQuestion = question
            self.gameScene.questionTextLabel.text = question.text
            self.gameScene.questionNumberLabel.text = "\(self.questionNumber)"
            self.gameScene.tableView.reloadData()
        }
    }
    
    func createQuestions() {
        
    }
}
