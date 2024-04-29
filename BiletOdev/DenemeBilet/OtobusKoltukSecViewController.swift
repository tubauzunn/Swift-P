//
//  OtobusKoltukSecViewController.swift
//  DenemeBilet
//
//  Created by Tuba Uzun on 28.04.2024.
//

import UIKit

class OtobusKoltukSecViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    var otobusKoltuklar: [Koltuk] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Otobüs koltuklarını oluştur
        for numara in 1...45 {
            let koltuk = Koltuk(numara: numara, dolu: false)
            otobusKoltuklar.append(koltuk)
        }

        // Collection view'ın veri kaynağını ve delegesini ayarla
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otobusKoltuklar.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KoltukCell", for: indexPath) as! KoltukCollectionViewCell

        let koltuk = otobusKoltuklar[indexPath.item]

        // Koltuğun durumunu görsel olarak güncelle
        if koltuk.dolu {
            cell.backgroundColor = UIColor.red // Dolu koltuklar kırmızı renkte olacak
        } else {
            cell.backgroundColor = UIColor.green // Boş koltuklar yeşil renkte olacak
        }

        return cell
    }

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let secilenKoltuk = otobusKoltuklar[indexPath.item]

        // Seçilen koltuk dolu ise, uyarı göster ve işlemi iptal et
        if secilenKoltuk.dolu {
            showAlert(message: "Seçilen koltuk dolu. Lütfen başka bir koltuk seçin.")
            return
        }

        // Seçilen koltuğu işaretle
        otobusKoltuklar[indexPath.item].dolu = true

        // Seçilen koltuğu kullanıcıya bildir
        showAlert(message: "Seçilen koltuk numarası: \(secilenKoltuk.numara)")
    }

    // Uyarı gösteren yardımcı fonksiyon
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

