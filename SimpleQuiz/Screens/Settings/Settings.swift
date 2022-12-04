//
//  Settings.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 03.12.2022.
//

import UIKit

final class Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewQuestionButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "NewQuestionForm") as? NewQuestionForm else {
            return
        }
        
        present(vc, animated: true)
        
    }
}
