//
//  ViewController.swift
//  Light
//
//  Created by Aadi Krishna on 8/16/23.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true

    @IBOutlet var lightButton: UIButton!
    fileprivate func updateUI() {
        if (lightOn) {
            view.backgroundColor = .white
            lightButton.setTitle("Off", for: .normal)
        } else {
            view.backgroundColor = .black
            lightButton.setTitle("On", for: .normal)
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


}

