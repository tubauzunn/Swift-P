import UIKit

//1
func hello() -> String {
  return "Hello, World!"
}
hello()

//2
let expectedMinutesInOven = 40
func remainingMinutesInOven(elapsedMinutes: Int) -> Int {
    let expectedMinutesInOven = 40
    let remainingMinutes = expectedMinutesInOven - elapsedMinutes
    
    if remainingMinutes < 0 {
        return 0
    } else {
        return remainingMinutes
    }
}
func preparationTimeInMinutes(layers: Int) -> Int {
    let timePerLayer = 2
    let totalTime = timePerLayer * layers
    
    return totalTime
}
func totalTimeInMinutes(layers: Int, elapsedMinutes: Int) -> Int {
    let preparationTime = preparationTimeInMinutes(layers: layers)
    let totalTime = preparationTime + elapsedMinutes
    
    return totalTime
}

// 3

func bonusPoints(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  if powerUpActive && touchingEagle {
        return true
    } else {
        return false
    }
}
func score(touchingPowerUp: Bool, touchingSeed: Bool) -> Bool {
  if touchingPowerUp || touchingSeed {
        return true
    } else {
        return false
    }
}
func lose(powerUpActive: Bool, touchingEagle: Bool) -> Bool {
 if touchingEagle && !powerUpActive {
        return true
    } else {
        return false
    }
}
func win(hasPickedUpAllSeeds: Bool, powerUpActive: Bool, touchingEagle: Bool) -> Bool {
  if hasPickedUpAllSeeds && !lose(powerUpActive: powerUpActive, touchingEagle: touchingEagle) {
        return true
    } else {
        return false
    }
}

//4

func dailyRateFrom(hourlyRate: Double) -> Double {
    let hoursInDay = 8.0
    let dailyRate = hourlyRate * hoursInDay
    
    return dailyRate
}

func monthlyRateFrom(hourlyRate: Double, withDiscount: Double) -> Double {
    let workingDaysInMonth = 22
    let dailyRate = hourlyRate * 8
    let discountedDailyRate = dailyRate * (1.0 - withDiscount / 100.0)
    let monthlyRate = discountedDailyRate * Double(workingDaysInMonth)
    
    return monthlyRate
}

func workdaysIn(budget: Double, hourlyRate: Double, withDiscount: Double) -> Double {
    let dailyRate = hourlyRate * 8 
    let discountedDailyRate = dailyRate * (1.0 - withDiscount / 100.0)
    let workingDays = budget / discountedDailyRate
    
    return workingDays
}

