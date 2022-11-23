//
//  ConfigureWelcomeScreen.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import Foundation

extension WelcomeScreen {
    func configureUI() {
        
        DispatchQueue.main.async {
            self.startNewGameButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
            self.startNewGameButton.titleLabel?.textAlignment = .center
            self.startNewGameButton.titleLabel?.textColor = .systemYellow
            self.startNewGameButton.titleLabel?.text = "Новая игра"
            
            self.showResultsButton.titleLabel?.font = .boldSystemFont(ofSize: 22)
            self.showResultsButton.titleLabel?.textAlignment = .center
            self.showResultsButton.titleLabel?.textColor = .systemYellow
            self.showResultsButton.titleLabel?.text = "Результаты"
            
            self.navigationController?.navigationBar.barStyle = .black
            self.navigationController?.navigationBar.tintColor = .white
        }
    }
}

extension WelcomeScreen: WelcomeScreenDelegate {
    func didEndGame(with result: Int) {
        
        DispatchQueue.main.async {
            self.lastResultLabel.text = "Последний результат: \(result)"
        }
        dismiss(animated: true)
    }
}


