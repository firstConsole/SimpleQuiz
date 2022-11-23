//
//  GameScene.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

final class GameScene: UIViewController {
    
// MARK: - Const & Variables
    
    var questions: [Question] = []
    var currentQuestion: Question?
    var questionNumber: Int = 1
    var result: Int?
    weak var welcomeScreenDelegate: WelcomeScreenDelegate?
    
// MARK: - Outlets
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var hintsContainerView: UIView!
    @IBOutlet weak var hintsLabel: UILabel!
    @IBOutlet weak var callFriendHintButton: UIButton!
    @IBOutlet weak var hallHelpHintButton: UIButton!
    @IBOutlet weak var questionTextContainerView: UIView!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var tableContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gameInfoContainerView: UIView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        configureUI()
        registerCell()
        buildQuestions()
        
        guard let question = questions.first else { return }
        
        setupGame(question: question)
    }
    
// MARK: - Buttons
    
    @IBAction func endGameButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func callFriendHintButton(_ sender: UIButton) {
        guard let currentQuestion = currentQuestion else {
            return
        }
        
        callFriend(question: currentQuestion)
        callFriendHintButton.isEnabled = false
    }
    
// MARK: - UIStatusBarStyle
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
