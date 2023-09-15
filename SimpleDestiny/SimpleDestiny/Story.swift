//
//  Story.swift
//  SimpleDestiny
//
//  Created by Aadi School on 8/30/23.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice2: String
    let choice1Index: Int
    let choice2Index: Int
    
    init(title: String, choice1: String, choice2: String, choice1Index: Int, choice2Index: Int) {
        self.title = title
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice1Index = choice1Index
        self.choice2Index = choice2Index
    }
}
