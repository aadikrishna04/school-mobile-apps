//
//  CaptchaImageView.swift
//  Captcha
//
//  Created by Aadi Krishna on 1/10/24.
//

import UIKit

class CaptchaImageView: UIImageView {
    var text: String = ""
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
}
