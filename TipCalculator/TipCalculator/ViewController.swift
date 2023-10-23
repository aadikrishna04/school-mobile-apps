//
//  ViewController.swift
//  TipCalculator
//
//  Created by Aadi Krishna on 9/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sliderValue: UISlider!
    @IBOutlet var tipSegmentValue: UISegmentedControl!
    @IBOutlet var tipSliderLabel: UILabel!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var totalAmountLabel: UILabel!
    @IBOutlet var enteredBillAmount: UITextField!
    @IBOutlet var sliderStack: UIStackView!
    var tip = 0.1
    
    
    @IBAction func reset(_ sender: UIButton) {
        tip = 0.1
        tipSegmentValue.selectedSegmentIndex = 0
        sliderStack.isHidden = true
        enteredBillAmount.text = "0.00"
        tipAmountLabel.text = "$ 0.00"
        totalAmountLabel.text = "$ 0.00"
    }
    @IBAction func enteredBillAmountChanged(_ sender: UITextField) {
        updateView()
    }

    @IBAction func tipSegmentChanged(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            tip = 0.1
            sliderStack.isHidden = true
            updateView()
        } else if (sender.selectedSegmentIndex == 1) {
            tip = 0.18
            sliderStack.isHidden = true
            updateView()
        } else if (sender.selectedSegmentIndex == 2) {
            tip = 0.25
            sliderStack.isHidden = true
            updateView()
        } else {
            sliderStack.isHidden = false
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        tip = Double(sliderValue.value)
        tipSliderLabel.text = String(format: "%.0f", tip * 100) + "%"
        updateView()
    }
    func updateView() {
        tipAmountLabel.text = "$ " + String(format: "%.2f", (Double(enteredBillAmount.text!) ?? 0.0) * tip)
        totalAmountLabel.text = "$ " + String(format: "%.2f", (Double(enteredBillAmount.text!) ?? 0.0) * tip + (Double(enteredBillAmount.text!) ?? 0.0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

