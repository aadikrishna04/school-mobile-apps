//
//  ViewController.swift
//  MagicGPTBall
//
//  Created by Aadi School on 9/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            print("Querying...\(textInput.text)")
            let api = OpenAIAPI()
            api.query(prompt: "You are a Magic 8 Ball meant to answer questions logically while being as concise as possible. Here is your prompt: \(self.textInput.text). Keep your response under 2 sentences.") { (response, error) in
                if let error = error {
                    print("Error:", error)
                } else {
                    let alert = UIAlertController(title: "MagicGPTBall's Response", message: response, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
