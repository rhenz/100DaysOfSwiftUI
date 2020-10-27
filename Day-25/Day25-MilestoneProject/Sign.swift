//
//  Sign.swift
//  Day25-MilestoneProject
//
//  Created by Lawrence on 8/2/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import Foundation

enum GameResult {
    case win
    case lose
    case draw
}

enum Sign: Int {
    case rock = 0
    case paper = 1
    case scissors = 2
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊🏻"
        case .paper:
            return "🖐🏻"
        case .scissors:
            return "✌🏻"
        }
    }
    
    func checkResult(userSelection: Sign) -> GameResult {
        if self == userSelection {
            return .draw
        } else {
            if (userSelection.rawValue + 1) % 3 == self.rawValue {
                return .lose // App Wins
            } else {
                return .win // You Win
            }
        }
    }
}
