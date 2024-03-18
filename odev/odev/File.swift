
//print("Hello Swift!")

import Foundation

var users = ["feyyaz", "suleyman", "Baris", "Merve", "dogukan"]

//if users.contains("") {
//    print("Empty name error")
//} else {
//    for user in users {
//        print(user.capitalized)
//    }
//}

print("Enter your name")
var name = readLine(strippingNewline: true)
print("Hello \(name ?? "No name")")
