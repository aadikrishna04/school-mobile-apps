//
//  ContentView.swift
//  Dice
//
//  Created by Aadi Krishna on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var diceNumber = Int.random(in: 1...6)
    
    var body: some View {        VStack(alignment: .center, spacing: 20.0) {
        Button(action: {
            diceNumber = Int.random(in: 1...6)
        }, label: {Image("dice-\(diceNumber)")})
        Text("You rolled a \(diceNumber)")
            .fontWeight(.bold)
    }
    .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
