//
//  ViewController.swift
//  Xylophone
//
//  Created by Aadi Krishna on 9/19/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player : AVAudioPlayer!
    
    let sounds = [Bundle.main.url(forResource: "C", withExtension: ".wav"), Bundle.main.url(forResource: "D", withExtension: ".wav"), Bundle.main.url(forResource: "E", withExtension: ".wav"), Bundle.main.url(forResource: "F", withExtension: ".wav"), Bundle.main.url(forResource: "G", withExtension: ".wav"), Bundle.main.url(forResource: "A", withExtension: ".wav"), Bundle.main.url(forResource: "B", withExtension: ".wav")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playSound(_ sender: UIButton) {
        player = try! AVAudioPlayer(contentsOf: sounds[sender.tag]!)
        player.play()
    }
}
