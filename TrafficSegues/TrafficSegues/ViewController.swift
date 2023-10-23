//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Aadi Krishna on 10/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var redTextField: UITextField!
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = redTextField.text
    }

}

