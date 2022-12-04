//
//  ConfigureGameScene.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

// MARK: - UI configuration

extension GameScene {
    func configureUI() {
        DispatchQueue.main.async {
            self.appNameLabel.textColor = .systemYellow
            self.appNameLabel.textAlignment = .center
            self.appNameLabel.text = "SimpleQuiz"
            
            self.hintsContainerView.layer.cornerRadius = 10
            
            self.hintsLabel.textColor = .white
            self.hintsLabel.textAlignment = .center
            self.hintsLabel.text = "Подсказки"
            
            self.questionTextContainerView.layer.cornerRadius = 10
            self.questionTextLabel.textColor = .white
            self.questionTextLabel.textAlignment = .center
            self.questionTextLabel.text = "Question here"
            self.questionTextLabel.font = .systemFont(ofSize: 20)
            
            self.tableContainerView.layer.cornerRadius = 10
            
            self.gameInfoContainerView.layer.cornerRadius = 10
        }
    }
}

// MARK: - Questions setup

extension GameScene {
    func buildQuestions() {
        questions.append(Question(text: "Сколько республик было в СССР?",
                                  answers: [
                                  Answer(text: "13", correct: false),
                                  Answer(text: "7", correct: false),
                                  Answer(text: "15", correct: true),
                                  Answer(text: "17", correct: false)]))
        
        questions.append(Question(text: "Какой плод на латыни называется «армянской сливой»?",
                                  answers: [
                                  Answer(text: "Абрикос", correct: true),
                                  Answer(text: "Алыча", correct: false),
                                  Answer(text: "Персик", correct: false),
                                  Answer(text: "Айва", correct: false)]))
        
        questions.append(Question(text: "В каком из этих напитков, по мнению дегустаторов, преобладает оттенок корочки ржаного хлеба?",
                                  answers: [
                                  Answer(text: "Кагор", correct: false),
                                  Answer(text: "Марсала", correct: false),
                                  Answer(text: "Токай", correct: true),
                                  Answer(text: "Херес", correct: false)]))
        
        questions.append(Question(text: "В каком городе в 1923 году был проведен первый международный кинофестиваль?",
                                  answers: [
                                  Answer(text: "Канн", correct: false),
                                  Answer(text: "Венеция", correct: true),
                                  Answer(text: "Париж", correct: false),
                                  Answer(text: "Берлин", correct: false)]))
        
        questions.append(Question(text: "Чьё произведение стало основой современного гимна Австрии?",
                                  answers: [
                                  Answer(text: "Штраус", correct: false),
                                  Answer(text: "Шуберт", correct: false),
                                  Answer(text: "Шуман", correct: false),
                                  Answer(text: "Моцарт", correct: true)]))
    }
}

// MARK: -

extension GameScene {
    func setupGame(question: Question) {
        
        DispatchQueue.main.async {
            self.currentQuestion = question
            self.questionTextLabel.text = question.text
            self.questionNumberLabel.text = "\(self.questionNumber)"
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate

extension GameScene: UITableViewDelegate {
    
}

// MARK: - Register cell

extension GameScene {
    func registerCell() {
        tableView.register(UINib(nibName: "AnswerCell",
                                 bundle: nil),
                           forCellReuseIdentifier: AnswerCell.identifier)
    }
}

// MARK: - Check for answer

extension GameScene {
    func checkAnswer(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text }) && answer.correct
    }
}

// MARK: -

extension GameScene {
    func callFriend(question: Question) {
        
        let question = question.answers
        guard let correctAnswer = question.firstIndex(where: { $0.correct }) else { return }
        
        let alert = UIAlertController(title: "Звонок другу",
                                      message: "Здорова, братан! Я уверен, что правильный ответ № \(Int(correctAnswer) + 1)",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Thank You!", style: .default)

        alert.addAction(action)
        present(alert, animated: true)
        
    }
}
