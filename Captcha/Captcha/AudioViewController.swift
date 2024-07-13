//
//  AudioViewController.swift
//  Captcha
//
//  Created by Aadi Krishna on 1/12/24.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    var array: [String] = []
    var c: String = ""
    var sounds = [String]()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path + "/sounds")
        
        for item in items {
            if item.hasSuffix("wav") {
                sounds.append(item)
            }
        }
        
        
        for button in buttons {
            var p = sounds.randomElement()!
            while true {
                if (array.contains(p)) {
                    p = sounds.randomElement()!
                } else {
                    array.append(p)
                    let startIndex = p.index(after: p.firstIndex(of: "_")!)
                    let endIndex = p.firstIndex(of: ".")!
                    p = String(p[startIndex..<endIndex])
                    button.setTitle(p, for: .normal)
                    break
                }
            }
        }
        
        c = array.randomElement()!
        c = String(c.prefix(c.count - 4))
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let buttonTitle = (sender as AnyObject).title(for: .normal) {
            if (buttonTitle == String(c.suffix(c.count - 6))) {
                performSegue(withIdentifier: "humanSegue", sender: nil)
            } else {
                performSegue(withIdentifier: "audioRobotSegue", sender: nil)
            }
        }
    }
    
    @IBAction func soundPlayed(_ sender: Any) {
        player = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "/sounds/\(c)", withExtension: ".wav")!)
        player.play()
    }
}
