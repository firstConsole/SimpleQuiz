//
//  AnswerCell.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

final class AnswerCell: UITableViewCell {

    static let identifier = "AnswerCell"
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerContainerView: UIView!
    
    func configureCell() {
        DispatchQueue.main.async {
            self.answerContainerView.layer.cornerRadius = 10
        }
    }
}
