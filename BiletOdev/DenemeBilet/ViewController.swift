//
//  ViewController.swift
//  DenemeBilet
//
//  Created by _ on 25.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var yolcuAdGir: UITextField!
    @IBOutlet var yolcuSoyAdGir: UITextField!
    @IBOutlet var yolcuIdGir: UITextField!
    @IBOutlet var kaydetButonu: UIButton!
    @IBOutlet var biletTarihi: UIDatePicker!
    @IBOutlet var koltukSayisiGir: UITextField!
    @IBOutlet var koltukBilgi: UILabel!
    @IBOutlet var koltukSorgulaButonu: UIButton!
    
  
    @IBOutlet var cinsiyetSegmentedControl: UISegmentedControl!

    var bilet = Bilet(yolcu: Yolcu(), tarih: Tarih(), saat: Saat())
    var koltukSayisi: Int? = 0
    var secilenKoltukNumarasi: Int?
    var secilenCinsiyet: String?
    
    struct Koltuk {
        let numara: Int
        var dolu: Bool
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        koltukSayisiGir.placeholder = "Rezerve Etmek İstediğiniz Koltuk Sayısı Giriniz"
        koltukSayisiGir.keyboardType = .numberPad

        koltukBilgi.text = "Koltuk Bilgi"
        koltukSorgulaButonu.setTitle("Koltuk Sorgula", for: .normal)

        yolcuAdGir.placeholder = "Yolcu İsmi Giriniz"
        yolcuSoyAdGir.placeholder = "Yolcu Soyad Giriniz"
        yolcuIdGir.placeholder = "TC Kimlik No Giriniz"
        yolcuIdGir.keyboardType = .numberPad

        kaydetButonu.setTitle("Kaydet", for: .normal)

        let tap = UITapGestureRecognizer(target: self, action: #selector(klavyeyiKapat))
        view.addGestureRecognizer(tap)
        // UISegmentedControl oluştur
       
            // Mevcut UISegmentedControl'a tag atayarak onu sonradan bulabilirsiniz.
            cinsiyetSegmentedControl.tag = 100
            self.view.addSubview(cinsiyetSegmentedControl)
    }

    @objc func klavyeyiKapat() {
        view.endEditing(true)
    }

    @objc func cinsiyetSecildi() {
        // Kullanıcının seçtiği cinsiyeti al
        switch cinsiyetSegmentedControl.selectedSegmentIndex {
        case 0:
            secilenCinsiyet = "Erkek"
        case 1:
            secilenCinsiyet = "Kadın"
        default:
            secilenCinsiyet = nil
        }
    }

    @IBAction func kaydetButtonTapped() {
        guard let ad = yolcuAdGir.text, !ad.isEmpty else {
            showAlert(message: "Lütfen adınızı girin.")
            return
        }

        guard let soyad = yolcuSoyAdGir.text, !soyad.isEmpty else {
            showAlert(message: "Lütfen soyadınızı girin.")
            return
        }

        guard let idStr = yolcuIdGir.text, let id = Int(idStr), id > 0 else {
            showAlert(message: "Lütfen geçerli bir ID numarası girin.")
            return
        }

        let secilenTarih = biletTarihi.date
        let calendar = Calendar.current
        let gun = calendar.component(.day, from: secilenTarih)
        let ay = calendar.component(.month, from: secilenTarih)
        let yil = calendar.component(.year, from: secilenTarih)
        let saat = calendar.component(.hour, from: secilenTarih)
        let dakika = calendar.component(.minute, from: secilenTarih)

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let formattedDate = dateFormatter.string(from: secilenTarih)

        // Cinsiyet seçeneğini al
        let selectedGenderIndex = cinsiyetSegmentedControl.selectedSegmentIndex
        let selectedGender = selectedGenderIndex == 0 ? "Erkek" : "Kadın"

        bilet.yolcu = Yolcu(ad: ad, soyad: soyad, id: id, cinsiyet: selectedGender)
        bilet.saat = Saat(saat: saat, dakika: dakika)
        bilet.tarih = Tarih(gun: gun, ay: ay, yil: yil)

        // Alert oluştur
        let alertMessage = bilet.yazdır() // Bilet bilgilerini bir dize olarak al
            let alert = UIAlertController(title: "Bilet Bilgileri", message: alertMessage, preferredStyle: .alert)
            let tamamAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
            alert.addAction(tamamAction)
            present(alert, animated: true, completion: nil)
    }




    @IBAction func koltukNumarasiSorButtonTapped(_ sender: UIButton) {
        guard let koltukSayisiText = koltukSayisiGir.text, let koltukSayisi = Int(koltukSayisiText) else {
            koltukBilgi.text = "Lütfen geçerli bir koltuk sayısı girin."
            return
        }

        if koltukSayisi < 1 || koltukSayisi > 5 {
            koltukBilgi.text = "Koltuk sayısı 1 ile 5 arasında olmalıdır."
            bilet.koltukAyir(koltukSayisi: self.koltukSayisi ?? 0)
            return
        }

        self.koltukSayisi = Int(koltukSayisiGir.text ?? "")
        sorKoltukNumarasi()
        secilenKoltukNumarasi = nil
    }

    func sorKoltukNumarasi() {
        let mesaj: String
        if let koltukSayisi = koltukSayisi {
            mesaj = "Lütfen koltuk numarasını girin:"
        } else {
            mesaj = "Koltuk sayısı belirlenmedi."
        }

        let alertController = UIAlertController(title: "Koltuk Numarası", message: mesaj, preferredStyle: .alert)

        alertController.addTextField { (textField) in
            textField.placeholder = "Koltuk Numarası"
            textField.keyboardType = .numberPad
        }

        let tamamAction = UIAlertAction(title: "Tamam", style: .default) { [weak self] (action) in
            guard let textField = alertController.textFields?.first, let koltukNumarasiText = textField.text, let koltukNumarasi = Int(koltukNumarasiText) else {
                self?.koltukBilgi.text = "Lütfen geçerli bir koltuk numarası girin."
                return
            }

            self?.koltukBilgi.text = "Koltuk numarası 1 ile 45 arasında olmalıdır."
            if koltukNumarasi < 1 || koltukNumarasi > 45 {
                self?.koltukBilgi.text = "Koltuk numarası 1 ile 45 arasında olmalıdır."
                return
            }

            self?.secilenKoltukNumarasi = koltukNumarasi
            self?.koltukBilgi.text = "Seçilen Koltuk Numarası: \(koltukNumarasi)"
            self?.bilet.koltukNoEkle(numara: self?.secilenKoltukNumarasi ?? 0)
            if let koltukSayisi = self?.koltukSayisi, koltukSayisi > 1 {
                self?.koltukSayisi = koltukSayisi - 1
                self?.sorKoltukNumarasi()
            }
        }
        alertController.addAction(tamamAction)

        present(alertController, animated: true, completion: nil)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

