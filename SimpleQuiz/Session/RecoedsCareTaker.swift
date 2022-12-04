//
//  RecoedsCareTaker.swift
//  SimpleQuiz
//
//  Created by Алексей Артамонов on 03.12.2022.
//

import Foundation

final class RecoedsCareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "Records"
    
    func saveRecords(records: [Records]) {
        do {
            guard let data = try? encoder.encode(records) else { return }
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func loadRecords() -> [Records] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try decoder.decode([Records].self, from: data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
