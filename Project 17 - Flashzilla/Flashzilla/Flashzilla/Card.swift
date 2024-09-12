//
//  Card.swift
//  Flashzilla
//
//  Created by Endre Imecs on 8/31/24.
//

import Foundation

struct Card: Codable {
    var uuid = UUID()
    var prompt: String
    var answer: String
    
    var answerIsCorrect: Bool?
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker", answerIsCorrect: true)
}
