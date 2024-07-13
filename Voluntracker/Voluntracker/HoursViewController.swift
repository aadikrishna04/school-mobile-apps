//
//  HoursViewController.swift
//  Voluntracker
//
//  Created by Aadi Krishna on 12/11/23.
//

import UIKit
import Firebase

class HoursViewController: UIViewController {
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    @IBAction func logoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        Switcher.changeRootVC()
    }

    @IBAction func stepperPress(_ sender: Any) {
        UserDefaults.standard.set(Int(stepper.value), forKey: UserDefaults.standard.string(forKey: "currentUser" + "1")!)
        hoursLabel.text = String(UserDefaults.standard.integer(forKey: UserDefaults.standard.string(forKey: "currentUser" + "1")!))
    }
    
    override func viewDidLoad() {
        hoursLabel.text = String(UserDefaults.standard.integer(forKey: UserDefaults.standard.string(forKey: "currentUser" + "1")!))
        stepper.value = Double(UserDefaults.standard.integer(forKey: UserDefaults.standard.string(forKey: "currentUser" + "1")!))
    }
}
