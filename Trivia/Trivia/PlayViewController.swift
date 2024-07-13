//
//  PlayViewController.swift
//  Trivia
//
//  Created by Aadi Krishna on 12/15/23.
//

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet var questionText: UILabel!
    @IBOutlet var button1Label: UIButton!
    @IBOutlet var button2Label: UIButton!
    @IBOutlet var button3Label: UIButton!
    @IBOutlet var button4Label: UIButton!
    
    var questionsRight: Int = 0
    var correctAnswer: String = ""
    var questionsAnswered: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        questionsRight = 0
        questionsAnswered = 0
        nextQuestion()
    }
    
    override func viewDidLoad() {
        nextQuestion()
        super.viewDidLoad()
    }
    
    private func nextQuestion() {
        let apiURL = URL(string: UserDefaults.standard.string(forKey: "apiUrl")!)!
        
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                if let results = json["results"] as? [[String: Any]], let firstResult = results.first {
                    let questionText = firstResult["question"] as! String
                    self.correctAnswer = firstResult["correct_answer"] as! String
                    let incorrectAnswers = firstResult["incorrect_answers"] as! [String]
                    
                    print(self.correctAnswer)
                    var answerChoices = [self.correctAnswer] + incorrectAnswers
                    answerChoices.shuffle()
                    
                    DispatchQueue.main.async {
                        self.questionText.text = self.formatHtmlEntities(from: questionText)
                        self.button1Label.setTitle(self.formatHtmlEntities(from: answerChoices[0]), for: .normal)
                        self.button2Label.setTitle(self.formatHtmlEntities(from: answerChoices[1]), for: .normal)
                        self.button3Label.setTitle(self.formatHtmlEntities(from: answerChoices[2]), for: .normal)
                        self.button4Label.setTitle(self.formatHtmlEntities(from: answerChoices[3]), for: .normal)
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        task.resume()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let selectedAnswer = (sender as UIButton).titleLabel else { return }

        if (questionsAnswered <= UserDefaults.standard.integer(forKey: "totalQuestions") - 1) {
            questionsAnswered += 1
            if selectedAnswer.text == self.correctAnswer {
                nextQuestion()
                print("querying")
                questionsRight += 1
            } else {
                nextQuestion()
            }
        } else {
            UserDefaults.standard.set(questionsRight, forKey: "questionsRight")
            performSegue(withIdentifier: "scoreSegue", sender: nil)
        }
    }
    
    func formatHtmlEntities(from htmlString: String) -> String? {
        guard let data = htmlString.data(using: .utf8) else {
            return nil
        }

        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        do {
            let attributedString = try NSAttributedString(data: data, options: options, documentAttributes: nil)
            let plainText = attributedString.string
            return plainText
        } catch {
            print("Error converting HTML to plain text: \(error)")
            return nil
        }
    }
    
}
