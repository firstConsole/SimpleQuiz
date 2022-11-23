//
//  WelcomeScreen.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

final class WelcomeScreen: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var startNewGameButton: UIButton!
    @IBOutlet weak var showResultsButton: UIButton!
    @IBOutlet weak var lastResultLabel: UILabel!
    
// MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GameScene":
            guard let destionation = segue.destination as? GameScene else {
                return
            }
            destionation.welcomeScreenDelegate = self
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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Results") as? Results else {
            return
        }

        navigationItem.backButtonTitle = "Назад"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Новая игра",
                                      message: "Введите ваше имя",
                                      preferredStyle: .alert)
        let actionAccept = UIAlertAction(title: "OK", style: .default)
        let actionDistruct = UIAlertAction(title: "Выйти", style: .destructive)
        
        alert.addTextField()
        alert.addAction(actionAccept)
        alert.addAction(actionDistruct)
        
        
        present(alert, animated: true)
    }
}
