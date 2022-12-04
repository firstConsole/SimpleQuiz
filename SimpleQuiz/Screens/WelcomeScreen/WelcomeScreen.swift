//
//  WelcomeScreen.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

// MARK: - Welcome Screen Class

final class WelcomeScreen: UIViewController {
    
    var playerName: String = ""
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var startNewGameButton: UIButton!
    @IBOutlet weak var showResultsButton: UIButton!
    @IBOutlet weak var lastResultLabel: UILabel!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    // MARK: - Private properties
    
    private var selectedDifficultyLevel: DifficultyLevel {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            return .easy
        case 1:
            return .normal
        case 2:
            return .hard
        default:
            return .normal
        }
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GameScene":
            guard let destionation = segue.destination as? GameScene else {
                return
            }
            
            destionation.welcomeScreenDelegate = self
            destionation.difficultyLevel = selectedDifficultyLevel
            
            let alert = UIAlertController(title: "Новая игра",
                                          message: "Введите ваше имя или никнейм",
                                          preferredStyle: .alert)
            
            alert.addTextField { field in
                field.placeholder = "Введите текст..."
                field.returnKeyType = .continue
                field.keyboardType = .emailAddress
            }
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                guard let fields = alert.textFields else {
                    return
                }
                
                let playerNameField = fields[0]
                
                guard let playerName = playerNameField.text else {
                    return
                }
                
                Game.shared.playerName = playerName
                
                self.present(destionation, animated: true)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
            
            present(alert, animated: true)
        default:
            break
        }
    }
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: UIButtons actions
    
    @IBAction func showResults(_ sender: UIButton) {
        
        guard let results = storyboard?.instantiateViewController(withIdentifier: "Results") as? Results else {
            return
        }
        
        navigationItem.backButtonTitle = "Назад"
        navigationController?.pushViewController(results, animated: true)
    }
    
    @IBAction func settingGame(_ sender: UIButton) {
        guard let settings = storyboard?.instantiateViewController(withIdentifier: "Settings") as? Settings else {
            return
        }
        
        navigationItem.backButtonTitle = "Назад"
        navigationController?.pushViewController(settings, animated: true)
    }
}
