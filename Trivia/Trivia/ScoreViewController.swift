//
//  ScoreViewController.swift
//  Trivia
//
//  Created by Aadi Krishna on 12/15/23.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(UserDefaults.standard.integer(forKey: "questionsRight")) out of \(UserDefaults.standard.integer(forKey: "totalQuestions"))"
    }
}
