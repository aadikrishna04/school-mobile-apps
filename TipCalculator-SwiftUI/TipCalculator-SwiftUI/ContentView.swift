//
//  ContentView.swift
//  TipCalculator-SwiftUI
//
//  Created by Aadi Krishna on 4/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var billAmount: String = ""
    @State var tipPercentage: Double = 20.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Tip Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
            VStack(alignment: .leading) {
                Text("Bill Amount")
                    .fontWeight(.medium)
                TextField("00.00", text: $billAmount)
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 50)
                    .background(Color.white)
                    .cornerRadius(25)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1))
            }
            VStack(alignment: .leading) {
                HStack() {
                    Text("Tip Percentage")
                        .fontWeight(.medium)
                    Text("\(Int(tipPercentage))%")
                }
                Slider(value: $tipPercentage, in: 0...100, step: 1).frame(width: UIScreen.main.bounds.width * 0.8).tint(Color.black).foregroundColor(Color.black)
            }
            VStack(alignment: .leading) {
                Text("Subtotal: \(formattedNumber(billAmountNumber()))")
                Text("Tip: \(formattedNumber(tipPercentage / 100 * billAmountNumber()))")
                Text("Total: \(formattedNumber(billAmountNumber() + tipPercentage / 100 * billAmountNumber()))")
            }
            
            Spacer()
            
        }
        .padding()
    }
    
    func formattedNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    func billAmountNumber() -> Double {
        return Double(billAmount) ?? 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
