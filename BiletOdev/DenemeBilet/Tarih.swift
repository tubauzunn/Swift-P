//
//  Tarih.swift
//  DenemeBilet
//
//  Created by _ on 25.04.2024.
//

import Foundation

public class Tarih {
    var gun: Int
    var ay: Int
    var yil: Int

    init(gun: Int = 1, ay: Int = 1, yil: Int = 2021) {
        self.gun = gun
        self.ay = ay
        self.yil = yil
    }

    func yazdır() {
        print("\(gun)/\(ay)/\(yil)")
    }
}
