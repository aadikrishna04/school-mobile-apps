//
//  SignUpViewController.swift
//  Voluntracker
//
//  Created by Aadi Krishna on 12/11/23.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: (emailField.text?.lowercased())!, password: passwordField.text!)
        {
            result, error in if (error != nil) {
                print(error!.localizedDescription)
            } else {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set(self.emailField.text?.lowercased(), forKey: "currentUser")
                UserDefaults.standard.set(self.emailField.text, forKey: "currentUser" + "1")
                UserDefaults.standard.set(0, forKey: (self.emailField.text?.lowercased())!)
                Switcher.changeRootVC()
            }
        }
    }
}
