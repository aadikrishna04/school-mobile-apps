//
//  ViewController.swift
//  Wordle
//
//  Created by Aadi Krishna on 1/23/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var helpButton: UIButton!
    
    @IBOutlet var wordleTitle: UILabel!
    @IBOutlet var darkModeButton: UIButton!
    var w = Wordle()
    var s = Set<String>()
    var row = 0
    
    let darkColor = #colorLiteral(red: 0.07058813423, green: 0.07058831304, blue: 0.07488615066, alpha: 1)
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func wordGuess(_ sender: Any) {
        guard let guessedWord = textField.text else {
            return
        }
        
        if guessedWord.count != 5 {
            // Display length error alert
            displayAlert(title: "Invalid Guess", message: "Guessed word must be 5 characters")
            textField.text = ""
            return
        }
        
        if !s.contains(guessedWord) {
            // Display not in word list alert
            displayAlert(title: "Invalid Guess", message: "Word not in word list")
            textField.text = ""
            return
        }
        
        let comparisonResult = w.compareWords(guess: Array(guessedWord))
        
        textField.text = ""
        
        for index in 0..<5 {
            let tag = (row * 5) + index + 1
            let viewWithTag = view.viewWithTag(tag) as? UILabel
            
            switch comparisonResult[index] {
            case "X":
                viewWithTag?.backgroundColor = .systemGreen
            case "O":
                viewWithTag?.backgroundColor = .systemYellow
            default:
                viewWithTag?.backgroundColor = .darkGray
            }
            
            viewWithTag?.text = String(Array(guessedWord)[index]).uppercased()
        }
        
        row += 1
        
        if comparisonResult == Array(repeating: "X", count: 5) {
            // Word was guessed
            displayAlert(title: "Congratulations!", message: "The word was guessed in \(row) tries.", restartGame: true)
        } else if row == 6 {
            // Game lost
            displayAlert(title: "Game Over", message: "The word was \(w.word). Try again.", restartGame: true)
        }
    }
    
    func displayAlert(title: String, message: String, restartGame: Bool = false) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if restartGame {
                // Restart the game
                self.restartGame()
            }
        }
        alertController.addAction(okAction)
        
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    func restartGame() {
        w = Wordle()
        row = 0
        
        for row in 1...7 {
            for index in 1...5 {
                let tag = (row - 1) * 5 + index
                if let label = view.viewWithTag(tag) as? UILabel {
                    label.text = ""
                    label.backgroundColor = .opaqueSeparator
                }
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.bool(forKey: "darkMode") == true {
            view.backgroundColor = darkColor
            helpButton.tintColor = .white
            darkModeButton.tintColor = .white
            wordleTitle.textColor = .white
        }
        
        print(w.word)
        
        if let content = try? String(contentsOfFile: "/Users/aadikrishna/dev/school-mobile-apps/Wordle/Wordle/words.txt", encoding: .utf8) {
            let lines = content.components(separatedBy: .newlines)
            let randomIndex = Int(arc4random_uniform(UInt32(lines.count)))
            
            for c in lines {
                s.insert(c)
            }
        }
        
    }
    
    @IBAction func darkModeToggled(_ sender: Any) {
        let darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        
        let newDarkModeValue = !darkMode
        UserDefaults.standard.set(newDarkModeValue, forKey: "darkMode")
        
        if newDarkModeValue {
            view.backgroundColor = darkColor
            helpButton.tintColor = .white
            darkModeButton.tintColor = .white
            wordleTitle.textColor = .white
        } else {
            view.backgroundColor = .white
            helpButton.tintColor = darkColor
            darkModeButton.tintColor = darkColor
            wordleTitle.textColor = darkColor
        }
    }
    
    
}

