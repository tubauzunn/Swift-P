import UIKit

//soru 3
var users = ["feyyaz", "suleyman", "baris", "merve", "dogukan"]

if users .contains(""){
    print("lutfen isim girin")
}
else {
    for user in users.sorted(by: > ){
        
        print (user.uppercased())
    }
}

//euler 1
var toplam : Int = 0

for sayi in 1..<1000 {
    
    if sayi%3 == 0 || sayi%5 == 0 {
        toplam += sayi
    }
}
print(toplam)

// euler 2
func fibonacciSum(n: Int) -> Int {
    var sum = 0
    var a = 1
    var b = 2

    while b <= n {
        if b % 2 == 0 {
            sum += b
        }

        let temp = a + b
        a = b
        b = temp
    }

    return sum
}

let limit = 3000000
let result = fibonacciSum(n: limit)
print("Çift değerli terimlerin toplamı: \(result)")

//euler 3 
