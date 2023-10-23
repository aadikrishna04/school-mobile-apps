import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputField: UITextField!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    var score = 0
    var num = Int.random(in: 1111...9999)
    
    var timer: Timer?
    var secondsRemaining = 60
    
    var isGameInProgress = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize the game but don't start the timer immediately
        numberLabel.text = String(num)
    }
    
    func startGame() {
        if !isGameInProgress {
            isGameInProgress = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func inputFieldChanged(_ sender: UITextField) {
        guard sender.hasText else {
            inputField.text = ""
            return
        }
        guard sender.text?.count == 4 else {
            return
        }
        
        startGame() // Start the game when the user starts typing
        
        if (sender.text == getNextNumber(curr: num)) {
            inputField.text = ""
            score+=1
        } else {
            inputField.text = ""
            score-=1
        }
        num = Int.random(in: 1111...9999)
        numberLabel.text = String(num)
        scoreLabel.text = String(score)
    }
    
    @objc func updateTimeLabel() {
        secondsRemaining -= 1
        timeLabel.text = "00:\(secondsRemaining)"
        
        if secondsRemaining == 0 {
            // Stop the timer
            timer?.invalidate()
            
            // Show the final score alert
            showScoreAlert()
        }
    }
    
    func showScoreAlert() {
        let alertController = UIAlertController(title: "Game Over", message: "Your Score: \(score)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Restart the game when the user clicks "OK"
            self.restartGame()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func restartGame() {
        isGameInProgress = false
        score = 0
        secondsRemaining = 60
        scoreLabel.text = String(score)
        updateTimeLabel()
        inputField.text = ""
        num = Int.random(in: 1111...9999)
        numberLabel.text = String(num)
    }
    
    func getNextNumber(curr: Int) -> String {
        var dig1 = curr % 10 + 1
        var dig2 = curr / 10 % 10 + 1
        var dig3 = curr / 100 % 10 + 1
        var dig4 = curr / 1000 % 10 + 1
        
        if (dig1 == 10) {
            dig1 = 0
        }
        
        if (dig2 == 10) {
            dig2 = 0
        }
        
        if (dig3 == 10) {
            dig3 = 0
        }
        
        if (dig4 == 10) {
            dig4 = 0
        }
        
        return String("\(dig4)\(dig3)\(dig2)\(dig1)")
    }
}
