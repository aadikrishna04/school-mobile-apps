//
//  Switcher.swift
//  Voluntracker
//
//  Created by Aadi Krishna on 12/11/23.
//

import Foundation
import UIKit

class Switcher {
    static func changeRootVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController?
        if (UserDefaults.standard.bool(forKey: "isLoggedIn") == false) {
            vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            
        } else {
            vc = storyboard.instantiateViewController(withIdentifier: "HoursViewController")
        }
        
        UIApplication.shared.keyWindow!.rootViewController = vc
    }
}
