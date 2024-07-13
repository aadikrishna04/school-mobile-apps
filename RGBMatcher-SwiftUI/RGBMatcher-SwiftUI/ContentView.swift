//
//  ContentView.swift
//  RGBMatcher-SwiftUI
//
//  Created by Aadi Krishna on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var gameRed = Double.random(in: 0...1)
    @State var gameGreen = Double.random(in: 0...1)
    @State var gameBlue = Double.random(in: 0...1)
    @State var gameOver = true
    @State var x = 0
    
    @State var currRed = 0.5
    @State var currGreen = 0.5
    @State var currBlue = 0.5
    
    @State private var showAlert = false
    @State private var timer: Timer?
    
    
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(red: gameRed, green: gameGreen, blue: gameBlue))
                .opacity(gameOver ? 1.0 : 0.5)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 100)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: 100)
                .foregroundColor(Color(red: currRed, green: currGreen, blue: currBlue))
            
            HStack {
                Text("R")
                Slider(value: $currRed, in: 0...1)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .onChange(of: currRed) { _ in
                checkGameOver()
            }
            
            HStack {
                Text("G")
                Slider(value: $currGreen, in: 0...1)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .onChange(of: currGreen) { _ in
                checkGameOver()
            }
            
            HStack {
                Text("B")
                Slider(value: $currBlue, in: 0...1)
            }
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .onChange(of: currBlue) { _ in
                checkGameOver()
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Time's up!"), message: Text("Score:     \((round((1 - sqrt((gameRed - currRed) * (gameRed - currRed) + (gameGreen - currGreen) * (gameGreen - currGreen) + (gameBlue - currBlue))) * 1000) / 1000) * 100)%"), dismissButton: .default(Text("OK")) {
                resetGame()
            })
        }
    }
    
    func checkGameOver() {
        if gameOver {
            gameOver = false
            timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                showAlert = true
            }
        }
    }
    
    func resetGame() {
        gameRed = Double.random(in: 0...1)
        gameGreen = Double.random(in: 0...1)
        gameBlue = Double.random(in: 0...1)
        
        currRed = 0.5
        currGreen = 0.5
        currBlue = 0.5
        
        timer?.invalidate()
        
        gameOver = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
