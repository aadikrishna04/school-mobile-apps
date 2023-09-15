//
//  ViewController.swift
//  TicTacToe
//
//  Created by Aadi School on 9/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var button: [UIButton]!
    @IBOutlet var currLabel: UILabel!
    var curr: Bool = true
    var state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let magicSquare = [2, 7, 6, 9, 5, 1, 4, 3, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonHandler(_ sender: UIButton) {
        if (state[sender.tag]) == 0 {
            if (curr == true) {
                state[sender.tag] = 1
                
                sender.setTitle("X", for: .normal)
                sender.tintColor = .blue
                checkWinner()
            } else {
                state[sender.tag] = 2
                sender.setTitle("O", for: .normal)
                sender.tintColor = .red
                checkWinner()
            }
            curr.toggle()
            if (curr == true) {
                currLabel.text = "Current: X"
            } else {
                currLabel.text = "Current: O"
            }
        }
    }
    
    func checkWinner() {
        let winCombination: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        for combination in winCombination {
            let a = state[combination[0]]
            let b = state[combination[1]]
            let c = state[combination[2]]
            
            if a != 0 && a == b && b == c {
                if a == 1 {
                    showAlert(message: "X wins!")
                } else {
                    showAlert(message: "O wins!")
                }
                return
            }
        }
        
        if !state.contains(0) {
            showAlert(message: "Draw")
        }
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { (_) in
            self.resetGame()
        }))
        present(alert, animated: true, completion: nil)
    }

    
    func resetGame() {
        curr = true
        currLabel.text = "Current: X"
        for btn in button {
            btn.setTitle("", for: .normal)
            btn.tintColor = .white
        }
        state = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}
