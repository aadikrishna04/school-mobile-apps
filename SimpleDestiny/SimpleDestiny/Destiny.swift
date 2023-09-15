//
//  Destiny.swift
//  SimpleDestiny
//
//  Created by Aadi School on 8/30/23.
//

import Foundation

struct Destiny {
    var currentStory = 0
    
    let stories = [
        Story(title: "You are on a path in a dark forest. You hear a rustling sound to your left.", choice1: "Investigate the rustling sound", choice2: "Continue along the path", choice1Index: 2, choice2Index: 1),
        Story(title: "As you follow the path, you find a hidden treasure chest.", choice1: "Open the chest", choice2: "Ignore it and continue walking", choice1Index: 3, choice2Index: 4),
        Story(title: "You follow the rustling sound and discover a friendly talking squirrel who offers to guide you out of the forest.", choice1: "Accept the squirrel's help", choice2: "Kill the squirrel and stay on your path", choice1Index: 5, choice2Index: 6),
        Story(title: "The chest contains a big banana, but it triggers a trap. A bunch of wild monkeys run at you.", choice1: "Run from the monkeys and use the banana as a distraction", choice2: "Stand your ground and fight the monkeys", choice1Index: 7, choice2Index: 8),
        Story(title: "You leave the chest alone and continue walking. You end up at a beautiful waterfall.", choice1: "Continue walking the path", choice2: "Climb the waterfall", choice1Index: 5, choice2Index: 6),
        Story(title: "You continue walking, following the squirrel, and it successfully leads you out of the forest. You have escaped. The end.", choice1: "Back to start", choice2: "Back to start", choice1Index: 0, choice2Index: 0),
        Story(title: "You kill the squirrel and continue on your own. The forest gets denser and you lose your way. You die of loneliness. The end", choice1: "Back to start", choice2: "Back to start", choice1Index: 0, choice2Index: 0),
        Story(title: "You narrowly escape the monkeys, using the banana as a distraction. They all fight for it and you escape. The end.", choice1: "Back to start", choice2: "Back to start", choice1Index: 0, choice2Index: 0),
        Story(title: "You try to stand your ground against the monkeys, but the monkeys are too strong. They force you to become one of them and you eventually die.", choice1: "Back to start", choice2: "Back to start" , choice1Index: 0, choice2Index: 0)
    ]
}
