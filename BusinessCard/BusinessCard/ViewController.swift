//
//  ViewController.swift
//  BusinessCard
//
//  Created by Aadi School on 9/14/23.
//

import UIKit

class ViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var infoVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 4 / 255.0, green: 59 / 255.0, blue: 92 / 255.0, alpha: 1)
        let profileImage = profileImageBackground()
        let contactInfoButton = contactInfoButton()
        view.addSubview(profileImage)
        view.addSubview(contactInfoButton)
        
    }
    
    func profileImageBackground() -> UIImageView {
        let img = UIImageView()
        img.image = UIImage(named: "me")
        img.frame = CGRect(x: screenWidth / 4, y: screenHeight * 0.2, width: 200, height: 200)
        img.clipsToBounds = true
        img.layer.cornerRadius = 100
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 8.0
        return img
    }
    
    func contactInfoButton() -> UIButton {
        let btn = UIButton()
        btn.frame = CGRect(x: screenWidth / 4 - (screenWidth / 4 / 2), y: screenHeight * 0.2 + 200 + screenHeight * 0.1, width: 300, height: 40)
        btn.backgroundColor = UIColor(cgColor: CGColor(red: 255, green: 255, blue: 255, alpha: 1))
        btn.layer.cornerRadius = 20
        btn.setTitle("Aadit Krishna", for: .normal)
        btn.setTitleColor(UIColor(cgColor: UIColor.black.cgColor), for: .normal)
        btn.addTarget(self, action: #selector(displayInfo(_:)), for: .touchUpInside)
        return btn
    }
    
    func contactName() -> UIView {
        let label = UILabel(frame: CGRect(x: screenWidth / 4 - (screenWidth / 4 / 2), y: screenHeight * 0.4 + 200, width: 300, height: 20))
        label.text = "Centennial High School — Frisco, Texas"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.tag = 1
        return label
    }
    
    func contactNumber() -> UIView {
        let label = UILabel(frame: CGRect(x: screenWidth / 4 - (screenWidth / 4 / 2), y: screenHeight * 0.4 + 220, width: 300, height: 20))
        label.text = "+1 (571) 418-2234"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.tag = 2
        return label
    }
    
    func contactEmail() -> UIView {
        let label = UILabel(frame: CGRect(x: screenWidth / 4 - (screenWidth / 4 / 2), y: screenHeight * 0.4 + 240, width: 300, height: 20))
        label.text = "aadikrishna04@gmail.com"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = .black
        label.tag = 3
        return label
    }
    
    
    
    @objc func displayInfo(_ sender: UIButton) {
        if infoVisible == false {
            view.addSubview(contactName())
            view.addSubview(contactNumber())
            view.addSubview(contactEmail())
            infoVisible.toggle()
        } else {
            view.viewWithTag(1)?.removeFromSuperview()
            view.viewWithTag(2)?.removeFromSuperview()
            view.viewWithTag(3)?.removeFromSuperview()
            infoVisible.toggle()
        }
    }
}

