//
//  ViewController.swift
//  SimpleDestiny
//
//  Created by Aadi School on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1Label: UIButton!
    
    @IBOutlet var button2Label: UIButton!
    @IBOutlet var storyText: UILabel!
    var game = Destiny()
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshView()
    }
    
    @IBAction func button1Action(_ sender: Any) {
        game.currentStory = game.stories[game.currentStory].choice1Index
        refreshView()
    }
    
    @IBAction func button2Action(_ sender: Any) {
        game.currentStory = game.stories[game.currentStory].choice2Index
        refreshView()
    }
    
    func refreshView() {
        storyText.text = game.stories[game.currentStory].title
        
        button1Label.setTitle( game.stories[game.currentStory].choice1, for: .normal)
        
        button2Label.setTitle( game.stories[game.currentStory].choice2, for: .normal)
    }
    
}
