//
//  GameScene + DataSource.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

// MARK: - UITableViewDataSource

extension GameScene: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnswerCell.identifier,
                                                       for: indexPath) as? AnswerCell else {
            return UITableViewCell()
        }
        
        DispatchQueue.main.async {
            cell.answerLabel.text = self.currentQuestion?.answers[indexPath.row].text.uppercased()
        }
        
        cell.configureCell()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuestion else { return }
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            if let index = questions.firstIndex(where: { $0.text == question.text }) {
                if index < (questions.count - 1) {
                    let nextQuestion = questions[index + 1]
                    let questionNumber = index + 1
                    
                    setupGame(question: nextQuestion)
                    
                    DispatchQueue.main.async {
                        self.questionNumberLabel.text = "\(questionNumber + 1)"
                        print(questionNumber)
                        guard let playerName = Game.shared.playerName else {
                            return
                        }
                        print(playerName)
                        self.result = Records(score: questionNumber, playerName: playerName)
                        self.tableView.reloadData()
                    }
                    
                } else {
                    let alert = UIAlertController(title: "Вы выиграли!",
                                                  message: "ПОЗДРАВЛЯЕМ!",
                                                  preferredStyle: .alert)
                    
                    let action = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                        guard let self = self,
                              let result = self.result else {
                            return
                        }
                        
                        Game.shared.addRecord(with: result)
                        
                        self.welcomeScreenDelegate?.didEndGame(with: result)
                        
                        self.dismiss(animated: true)
                        
                    }
                    
                    alert.addAction(action)
                    present(alert, animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "Ответ неверный!",
                                          message: "Вы проиграли!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .destructive) { [weak self] _ in
                guard let self = self,
                      let result = self.result else {
                    return
                }
                
                Game.shared.addRecord(with: result)
                
                self.welcomeScreenDelegate?.didEndGame(with: result)
                
                self.dismiss(animated: true)
                
            }
            
            alert.addAction(action)
            present(alert, animated: true)
            
        }
    }
}
