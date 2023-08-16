import UIKit

let currentGPA: Double = 2.8
let targetGPA: Double = 3.0
let currentCredits: Double = 25
let additionalCredits: Double = 15
let neededGPA = ((currentCredits + additionalCredits) * targetGPA - currentGPA * currentCredits) / additionalCredits

print("To achieve a target GPA of \(targetGPA), the GPA for the next \(Int(additionalCredits)) credits needs to be \(round(neededGPA * 1000) / 1000.0) or higher.")
