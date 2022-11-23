//
//  WelcomeScreenDelegateProtocol.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 11.10.2022.
//

import Foundation

protocol WelcomeScreenDelegate: AnyObject {
    func didEndGame(with result: Int)
}
