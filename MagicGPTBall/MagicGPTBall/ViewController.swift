//
//  ViewController.swift
//  MagicGPTBall
//
//  Created by Aadi School on 9/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    let openAIAPI = OpenAIAPI()
    
    @IBOutlet var textInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            guard let question = textInput.text, !question.isEmpty else {
                showAlert(message: "Please enter a question.")
                return
            }
            
            let response = openAIAPI.query(question: textInput.text ?? "")
            self.showAlert(message: response)
        }
    }
    
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "GPT-3 Response", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
