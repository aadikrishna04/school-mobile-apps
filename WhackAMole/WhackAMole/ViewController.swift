//
//  ViewController.swift
//  WhackAMole
//
//  Created by Aadi Krishna on 8/22/23.
//

import UIKit

class ViewController: UIViewController {
    var screenWidth = 0
    var screenHeight = 0
    var score = 0
    
    var timer: Timer?
    var gameDuration: TimeInterval = 1.0
    
    var lblScore = UILabel()
    var gameBoard = UIView()
    var moleBtn = UIButton()
    
    var playing: Bool = false
    
    @objc func updateTimerLabel() {
        if let timerLabel = view.viewWithTag(100) as? UILabel, let remainingTime = timer?.fireDate.timeIntervalSinceNow {
            timerLabel.text = String(format: "%.2f", max(0, remainingTime))
        }
    }
    
    fileprivate func setupLabels() {
        // Score Label
        let screenBounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        
        lblScore.frame = CGRect(x: 20, y: 70, width: 100, height: 50)
        lblScore.backgroundColor = UIColor.green
        lblScore.textColor = UIColor.black
        lblScore.text = String(score)
        lblScore.font = UIFont(name: lblScore.font.fontName, size: 42.0)
        lblScore.textAlignment = .center
        
        view.addSubview(lblScore)
        
        let timerLabel = UILabel()
        timerLabel.frame = CGRect(x: screenWidth - 140, y: 70, width: 120, height: 50)
        timerLabel.backgroundColor = UIColor.green
        timerLabel.textColor = UIColor.black
        timerLabel.text = String(format: "%.2f", gameDuration)
        timerLabel.font = UIFont(name: lblScore.font.fontName, size: 42.0)
        timerLabel.textAlignment = .center
        timerLabel.tag = 100
        
        view.addSubview(timerLabel)
    }
    
    fileprivate func setupGameBoard() {
        // Game Board
        gameBoard.frame = CGRect(x: 0, y: 140, width: screenWidth, height: Int(Double(screenHeight) * 0.8))
        gameBoard.backgroundColor = UIColor.green
        view.addSubview(gameBoard)
    }
    
    fileprivate func setupMole() {
        moleBtn.frame = CGRect(x: Int.random(in: 40..<screenWidth - 39), y: Int.random(in: 180..<screenHeight - 69), width: 60, height: 60)
        moleBtn.layer.cornerRadius = 30
        moleBtn.backgroundColor = UIColor.green
        
        moleBtn.setBackgroundImage(UIImage(named: "mole"), for: .normal)
        
        moleBtn.addTarget(self, action: #selector(whacked(_:)), for: .touchUpInside)
        
        view.addSubview(moleBtn)
    }
    
    fileprivate func restartGame() {
        score = 0
        lblScore.text = String(score)
        playing = false
        
        moleBtn.removeFromSuperview()
        
        setupMole()
    }
    
    fileprivate func gameOver() {
        timer?.invalidate()
        showAlert()
        playing = false
        restartGame()
    }
    
    fileprivate func showAlert() {
        let alert = UIAlertController(title: "Game Over!", message: "Score: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func startTimer() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: gameDuration, repeats: true) { [weak self] _ in
            self?.gameOver()
        }
        
        let updateTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimerLabel()
        }
        
    }
    
    @objc func whacked(_ sender: UIButton!) {
        if playing == false {
            playing = true
            score = 0
            lblScore.text = String(score)
            startTimer()
        } else {
            score += 1
            lblScore.text = String(score)
            startTimer()
            setupMole()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGreen
        setupLabels()
        setupGameBoard()
        setupMole()
    }
}
