//
//  Bilet.swift
//  DenemeBilet
//
//  Created by _ on 25.04.2024.
//

import Foundation

public class Bilet {
    var yolcu: Yolcu
    var tarih: Tarih
    var saat: Saat
    var koltuklar: [Int]
    var koltukSayisi: Int

    init(yolcu: Yolcu, tarih: Tarih, saat: Saat) {
        self.yolcu = yolcu
        self.tarih = tarih
        self.saat = saat
        self.koltuklar = []
        self.koltukSayisi = 0
    }

    func yazdır() -> String {
        // Bilet bilgilerini düzenle ve bir dize olarak döndür
        let koltuklarString = koltuklar.map { String($0) }.joined(separator: " ")
        return "\(yolcu.ad) \(yolcu.soyad), \(tarih.gun)/\(tarih.ay)/\(tarih.yil), \(saat.saat):\(saat.dakika) | \(koltuklarString)"
    }

    func karşılaştır(bilet: Bilet) -> Bool {
        for koltuk in koltuklar {
            if bilet.koltuklar.contains(koltuk) {
                print("Uyarı: Koltuk \(koltuk) zaten satılmış.")
                return true
            }
        }
        return false
    }

    func koltukAyir(koltukSayisi: Int) {
        self.koltukSayisi = koltukSayisi
        if koltukSayisi > 0 && koltukSayisi <= 5 {
            self.koltuklar = Array(1...koltukSayisi)
        }
    }

    func koltukNoEkle(numara: Int) {
        if numara >= 1 && numara <= 45 {
            self.koltuklar.append(numara)
        } else {
            print("Uyarı: Geçersiz koltuk numarası.")
        }
    }
}

