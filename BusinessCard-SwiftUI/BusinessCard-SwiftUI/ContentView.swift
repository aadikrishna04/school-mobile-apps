//
//  ContentView.swift
//  BusinessCard-SwiftUI
//
//  Created by Aadi Krishna on 4/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 4 / 255.0, green: 54 / 255.0, blue: 92 / 255.0).ignoresSafeArea()
            VStack(alignment: .center, spacing: 0.0) {
                ZStack {
                    Circle().foregroundColor(Color.white)
                        .frame(width: 175)
                        .offset(y:-175)
                    Image("me").resizable().frame(width: 150, height: 150)
                        .cornerRadius(100)
                        .offset(y:-175)
                    
                    
                }
                VStack(alignment: .center){
                    Text("Aadit Krishna").frame(width: 200, height: 50).background(Color.white)
                        .cornerRadius(100)
                    Text("+1 (571) 418-2234").frame(width: 200, height: 50)
                        .background(Color.white)
                        .cornerRadius(20)
                    Text("aadikrishna04@gmail.com").frame(width: 220, height: 50)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
