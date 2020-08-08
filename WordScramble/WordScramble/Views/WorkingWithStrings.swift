//
//  WorkingWithStrings.swift
//  WordScramble
//
//  Created by Lawrence on 8/7/20.
//  Copyright © 2020 JLCS. All rights reserved.
//

import Foundation
import UIKit

class StringStuff {
    let word = "swift"
    
    func checkMisspelledWord(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
        return allGood
    }
}
