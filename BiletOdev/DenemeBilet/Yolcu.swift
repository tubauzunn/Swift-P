//
//  Yolcu.swift
//  DenemeBilet
//
//  Created by _ on 25.04.2024.
//

class Yolcu {
    var ad: String
    var soyad: String
    var id: Int
    var cinsiyet: String // Yolcunun cinsiyeti

    init(ad: String = "İsimsiz", soyad: String = "İsimsiz", id: Int = 0, cinsiyet: String = "Belirtilmemiş") {
        self.ad = ad
        self.soyad = soyad
        self.id = id
        self.cinsiyet = cinsiyet // Cinsiyet parametresi ekleniyor
    }

    func yazdır() {
        print("\(ad) \(soyad) \(id), Cinsiyet: \(cinsiyet)")
    }
}
