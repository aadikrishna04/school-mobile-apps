//
//  ViewController.swift
//  Captcha
//
//  Created by Aadi Krishna on 1/10/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var captchaLabel: UILabel!
    @IBOutlet var images: [UIImageView]!
    var array: [String] = []
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path + "/images")
        
        for item in items {
            if item.hasSuffix("png") {
                pictures.append(item)
            }
        }
        
        for image in images {
            image.isUserInteractionEnabled = true
            var p = pictures.randomElement()!
            while true {
                if (array.contains(p)) {
                    p = pictures.randomElement()!
                } else {
                    array.append(p)
                    image.image = UIImage(named: "images/" + p)
                    image.filename = p
                    break
                }
            }
        }
        
        let c = array.randomElement()
        captchaLabel.text = String(c!.prefix(c!.count - 4))
    }
    
    @IBAction func didTapImageView(_ sender: UITapGestureRecognizer) {
        if let tappedImageView = sender.view as? UIImageView {
            if let imageName = tappedImageView.filename {
                if (String(imageName.prefix(imageName.count - 4)) == captchaLabel.text) {
                    performSegue(withIdentifier: "audioSegue", sender: nil)
                } else {
                    performSegue(withIdentifier: "textRobotSegue", sender: nil)
                }
            }
        }
    }
}

extension UIImageView {
    var filename: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.filename) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.filename, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private struct AssociatedKeys {
        static var filename = "filename"
    }
}
