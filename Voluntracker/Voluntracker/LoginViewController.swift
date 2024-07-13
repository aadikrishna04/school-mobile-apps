//
//  LoginViewController.swift
//  Voluntracker
//
//  Created by Aadi Krishna on 12/11/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: (emailField.text?.lowercased())!, password: passwordField.text!) {
            result, error in if (error == nil) {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set(self.emailField.text, forKey: "currentUser")
                UserDefaults.standard.set(self.emailField.text, forKey: "currentUser" + "1")
                Switcher.changeRootVC()
            } else {
                print(error!.localizedDescription)
                Switcher.changeRootVC()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

