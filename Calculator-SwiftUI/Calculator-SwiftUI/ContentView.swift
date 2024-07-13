import SwiftUI

struct ContentView: View {
    enum ButtonType {
        case one, two, three, four, five, six, seven, eight, nine, zero
        case add, subtract, multiply, divide
        case equal, clear, decimal, percent, negative
        
        var color: Color {
            switch self {
            case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
                return Color.init(CGColor(red: 51, green: 51, blue: 51, alpha: 0.2))
            case .zero:
                return Color.init(CGColor(red: 51, green: 51, blue: 51, alpha: 0.2))
            case .add, .subtract, .multiply, .divide:
                return .orange
            case .equal:
                return .orange
            case .clear, .negative, .percent:
                return Color.init(CGColor(red: 165, green: 165, blue: 165, alpha: 0.6))
            case .decimal:
                return Color.init(CGColor(red: 51, green: 51, blue: 51, alpha: 0.2))
            }
        }
        
        var text: String {
            switch self {
            case .one:
                return "1"
            case .two:
                return "2"
            case .three:
                return "3"
            case .four:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .zero:
                return "0"
            case .add:
                return "+"
            case .subtract:
                return "-"
            case .multiply:
                return "×"
            case .divide:
                return "÷"
            case .equal:
                return "="
            case .clear:
                return "C"
            case .decimal:
                return "."
            case .percent:
                return "%"
            case .negative:
                return "±"
            }
        }
    }
    
    let buttons: [[ButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundColor(Color.white)
                        .font(.system(size: 96))
                }.padding()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
            .background(Color.black)
            
            VStack(spacing: 8) {
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {
                                // Handle button action
                            }) {
                                Text(button.text)
                                    .font(.system(size: 36))
                                    .foregroundColor(.white)
                                    .frame(width: button == .zero ? 160 : 80, height: 80)
                                    .background(button.color)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .padding()
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
