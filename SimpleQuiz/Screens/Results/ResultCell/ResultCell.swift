//
//  ResultCell.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 14.10.2022.
//

import UIKit

final class ResultCell: UITableViewCell {

    static let identifier = "ResultCell"
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var answersNumberLabel: UILabel!
    
    func configureCell(player: Records, answers: Records) {
        
    }
    
}
