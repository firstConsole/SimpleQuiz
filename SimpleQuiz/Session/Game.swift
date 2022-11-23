//
//  Game.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 14.10.2022.
//

import Foundation

struct Records {
    let score: Int
//    let playerName: String?
}

final class Game {
    static let shared = Game()
    
    private(set) var records: [Records] = []
    
    private init() {}
    
    func addRecord(with record: Records) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}
