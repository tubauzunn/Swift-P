import UIKit

let toplamBilenler = 24
let sadeceSwiftBilenler = 12
let sadeceKotlinBilenler = 8

let herIkiDiliBilenler = toplamBilenler - (sadeceSwiftBilenler + sadeceKotlinBilenler)

let swiftBilenlerSet: Set<Int> = Set(1...sadeceSwiftBilenler)
let kotlinBilenlerSet: Set<Int> = Set(1...sadeceKotlinBilenler)
let herIkiDiliBilenlerSet: Set<Int> = Set(1...herIkiDiliBilenler)


let kesisimKumesi = swiftBilenlerSet.intersection(kotlinBilenlerSet)

print("Her iki dili bilenlerin sayısı: \(kesisimKumesi.count)")
