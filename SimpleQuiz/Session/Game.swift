//
//  Game.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 14.10.2022.
//

import Foundation

struct Records: Codable {
    let score: Int
    let playerName: String
}

final class Game {
    static let shared = Game()
    
    private let recordsCareTaker = RecoedsCareTaker()
    
    private(set) var records: [Records] {
        didSet {
            recordsCareTaker.saveRecords(records: records)
        }
    }
    
    var playerName: String?
    
    private init() {
        records = recordsCareTaker.loadRecords()
    }
    
    func addRecord(with record: Records) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}
