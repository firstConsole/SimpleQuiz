//
//  File.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 14.10.2022.
//

import UIKit

// MARK: - UITableViewDelegate

extension Results: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension Results: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier,
                                                       for: indexPath) as? ResultCell else {
            return UITableViewCell()
        }
        
        let result = Game.shared.records[indexPath.row]
        
        cell.playerNameLabel.text = "Игрок: \(result.playerName)"
        cell.answersNumberLabel.text = "Ответы: \(String(result.score))"
        
        return cell
    }
}

extension Results {
    func registerCells() {
        tableView.register(UINib(nibName: "ResultCell",
                                 bundle: nil),
                           forCellReuseIdentifier: ResultCell.identifier)
    }
}
