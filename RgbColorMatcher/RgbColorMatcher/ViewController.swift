//
//  ViewController.swift
//  RgbColorMatcher
//
//  Created by Aadi School on 9/15/23.
//

import UIKit

class ViewController: UIViewController {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    @IBOutlet var timerLabel: UILabel!
    var randomColorBox: UIView = UIView()
    var currentColorBox: UIView = UIView()
    
    var randRed = CGFloat.random(in: 0...1)
    var randGreen = CGFloat.random(in: 0...1)
    var randBlue = CGFloat.random(in: 0...1)
    
    var currRed = CGFloat(0.0)
    var currGreen = CGFloat(0.0)
    var currBlue = CGFloat(0.0)
    
    var started = false
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawRandomColorBox()
        drawCurrentColorBox()
    }
    
    func drawRandomColorBox() {
        randomColorBox.frame = CGRect(x: (screenWidth - 250) / 2, y: 100, width: 250, height: 100)
        randomColorBox.layer.borderColor = UIColor.black.cgColor
        randomColorBox.layer.borderWidth = 2
        randomColorBox.backgroundColor = UIColor(cgColor: CGColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1))
        
        let boxLabel = UILabel(frame: CGRect(x: (screenWidth - 250) / 2, y: 200, width: 250, height: 50))
        boxLabel.text = "Match this color!"
        boxLabel.textAlignment = .center
        
        view.addSubview(randomColorBox)
        view.addSubview(boxLabel)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        if started == false {
            started.toggle()
            startTimer()
        }
        currRed = CGFloat(sender.value)
        currentColorBox.backgroundColor = UIColor(cgColor: CGColor(red: currRed, green: currGreen, blue: currBlue, alpha: 1))
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        if started == false {
            started.toggle()
            startTimer()
        }
        currGreen = CGFloat(sender.value)
        currentColorBox.backgroundColor = UIColor(cgColor: CGColor(red: currRed, green: currGreen, blue: currBlue, alpha: 1))
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        if started == false {
            started.toggle()
            startTimer()
        }
        currBlue = CGFloat(sender.value)
        currentColorBox.backgroundColor = UIColor(cgColor: CGColor(red: currRed, green: currGreen, blue: currBlue, alpha: 1))
    }
    
    func drawCurrentColorBox() {
        currentColorBox.frame = CGRect(x: (screenWidth - 250) / 2, y: 250, width: 250, height: 100)
        currentColorBox.backgroundColor = .white
        currentColorBox.layer.borderColor = UIColor.black.cgColor
        currentColorBox.layer.borderWidth = 2
        
        let boxLabel = UILabel(frame: CGRect(x: (screenWidth - 250) / 2, y: 350, width: 250, height: 50))
        boxLabel.text = "With this color"
        boxLabel.textAlignment = .center
        
        view.addSubview(currentColorBox)
        view.addSubview(boxLabel)
    }
    
    fileprivate func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.gameOver()
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateTimerLabel()
        }
        
    }
    
    @objc func updateTimerLabel() {
        if let timerLabel = view.viewWithTag(100) as? UILabel, let remainingTime = timer?.fireDate.timeIntervalSinceNow {
            timerLabel.text = "Time Remaining: \(Int(round(remainingTime)))"
        }
    }
    
    fileprivate func gameOver() {
        timer?.invalidate()
        if let timerLabel = view.viewWithTag(100) as? UILabel {
            timerLabel.text = "Time Remaining: 10"
        }
        showAlert()
        started = false
        restartGame()
    }
    
    fileprivate func showAlert() {
        var tempScore = (randRed - currRed) * (randRed - currRed)
        tempScore += (randGreen - currGreen) * (randGreen - currGreen)
        tempScore += (randBlue - currBlue) * (randBlue - currBlue)
        
        let alert = UIAlertController(title: "Game Over!", message: "Score: \((round((1 - sqrt(tempScore)) * 1000) / 1000) * 100)%", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    fileprivate func restartGame() {
        randRed = CGFloat.random(in: 0...1)
        randGreen = CGFloat.random(in: 0...1)
        randBlue = CGFloat.random(in: 0...1)
        drawRandomColorBox()
        drawCurrentColorBox()
    }
}
