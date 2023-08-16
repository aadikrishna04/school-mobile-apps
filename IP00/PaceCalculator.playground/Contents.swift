// Pace Calculator

import UIKit

let distance: Double = 5
var timeElapsed: Double = 6.25
var distanceTraveled: Double = 1

print("Current Pace: \(timeElapsed  / distanceTraveled) minutes / kilometer")
print("At the current pace, it will take an additional \((distance - distanceTraveled) * (timeElapsed  / Double(distanceTraveled))) minutes to finish the race.")
print("At the current pace, the total time will be \(Double(distance - distanceTraveled) * (timeElapsed  / Double(distanceTraveled)) + timeElapsed) minutes for the \(distance) kilometers.")
