//
//  Results.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 25.09.2022.
//

import UIKit

final class Results: UIViewController {
    
    var playerName: String = ""
    var score: Int = 0
    
// MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        registerCells()
    }
}
