import UIKit

var total: Double = 142.42
var serviceDescription: String = "excellent"

switch total {
case 0.0...50.0:
    total -= 10.0
case 50.01...99.99:
    total -= 20.0
default:
    total *= 0.7
}

var tip = 0.0

switch serviceDescription {
case "so-so":
    tip = total * 0.1
case "good":
    tip = total * 0.15
case "excellent":
    tip = total * 0.2
case "superior":
    tip = total * 0.25
default:
    tip = 0
}

print("Total = $\(round(total * 100) / 100.0),\t tip = $\(round(tip * 100) / 100.0)")
