//
//  NewQuestionForm.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 04.12.2022.
//

import UIKit

final class NewQuestionForm: UIViewController {
    
    private let gameScene = GameScene()

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var fourthAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func addNewQuestionButton(_ sender: UIButton) {
        addNewQuestion()
        dismiss(animated: true)
        print(gameScene.questions)
    }
}

// MARK: - Add new question func

extension NewQuestionForm {
    func addNewQuestion() {
        guard let question = questionTextField.text,
              let firstAnswer = firstAnswerTextField.text,
              let secondAnswer = secondAnswerTextField.text,
              let thirdAnswer = thirdAnswerTextField.text,
              let fourthAnswer = fourthAnswerTextField.text,
              let correctAnswerIndex = correctAnswerTextField.text else {
            return
        }
        
        if correctAnswerIndex == firstAnswer {
            gameScene.questions.append(Question(text: question, answers: [Answer(text: firstAnswer, correct: true),
                                                               Answer(text: secondAnswer, correct: false),
                                                               Answer(text: thirdAnswer, correct: false),
                                                               Answer(text: fourthAnswer, correct: false)]))
        } else if correctAnswerIndex == secondAnswer {
            gameScene.questions.append(Question(text: question, answers: [Answer(text: firstAnswer, correct: false),
                                                               Answer(text: secondAnswer, correct: true),
                                                               Answer(text: thirdAnswer, correct: false),
                                                               Answer(text: fourthAnswer, correct: false)]))
        } else if correctAnswerIndex == thirdAnswer {
            gameScene.questions.append(Question(text: question, answers: [Answer(text: firstAnswer, correct: false),
                                                               Answer(text: secondAnswer, correct: false),
                                                               Answer(text: thirdAnswer, correct: true),
                                                               Answer(text: fourthAnswer, correct: false)]))
        } else if correctAnswerIndex == fourthAnswer {
            gameScene.questions.append(Question(text: question, answers: [Answer(text: firstAnswer, correct: false),
                                                               Answer(text: secondAnswer, correct: false),
                                                               Answer(text: thirdAnswer, correct: false),
                                                               Answer(text: fourthAnswer, correct: true)]))
        }
        
        
    }
}
