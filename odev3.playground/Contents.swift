import UIKit

//  1. soru

func printPlusMinusPattern(_ n: Int) {
    var pattern = ""
    for i in 1...n {
        pattern += i % 2 == 0 ? "-" : "+"
    }
    print(pattern)
}
printPlusMinusPattern(5)


// 2. soru

func appendFiveToMax(_ number: Int) -> Int {
    let maxDigit = String(number).max() ?? "0"
    return Int(String(maxDigit) + "5") ?? 0
}

appendFiveToMax(30)
