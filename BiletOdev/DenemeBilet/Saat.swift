//
//  Saat.swift
//  DenemeBilet
//
//  Created by _ on 25.04.2024.
//

import Foundation

public class Saat {
    var saat: Int
    var dakika: Int

    init(saat: Int = 0, dakika: Int = 0) {
        self.saat = saat
        self.dakika = dakika
    }

    func yazdır() {
        print("\(saat):\(dakika)")
    }
}
