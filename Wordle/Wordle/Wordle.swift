//
//  Wordle.swift
//  Wordle
//
//  Created by Aadi Krishna on 1/25/24.
//

import Foundation

class Wordle {
    var word = [Character]()
    
    init() {
        if let content = try? String(contentsOfFile: "/Users/aadikrishna/dev/school-mobile-apps/Wordle/Wordle/answers.txt", encoding: .utf8) {
            let lines = content.components(separatedBy: .newlines)
            let randomIndex = Int(arc4random_uniform(UInt32(lines.count)))
            
            for c in lines[randomIndex] {
                word.append(c)
            }
        }
    }
    
    func compareWords(guess: Array<Character>) -> Array<Character> {
        var check = [Character]()
        
        for (index, c) in guess.enumerated() {
            if (guess[index] == word[index]) {
                check.append("X")
            } else if (word.contains(c)) {
                check.append("O")
            } else {
                check.append(".")
            }
        }
        return check
    }
}
