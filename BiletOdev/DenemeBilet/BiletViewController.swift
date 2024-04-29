//
//  BiletViewController.swift
//  DenemeBilet
//
//  Created by Tuba Uzun on 28.04.2024.
//

import UIKit

class BiletViewController: UIViewController {
    var bilet: Bilet?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Arka plan rengini ayarla
        view.backgroundColor = UIColor.white
        
        // Bilet bilgilerini gösteren bir label oluştur
        let biletBilgiLabel = UILabel()
        biletBilgiLabel.text = bilet?.yazdır() ?? ""
        biletBilgiLabel.numberOfLines = 0
        biletBilgiLabel.textAlignment = .center
        biletBilgiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Bilet bilgi label'ını view'a ekle
        view.addSubview(biletBilgiLabel)
        
        // Bilet bilgi label'ını view'a göre konumlandır
        NSLayoutConstraint.activate([
            biletBilgiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            biletBilgiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            biletBilgiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            biletBilgiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

// Bilet bilgilerini alarak gösteren bir fonksiyon
func showBilet(bilet: Bilet) {
    // BiletViewController'ı oluştur
    let biletViewController = BiletViewController()
    biletViewController.bilet = bilet
    
    // UIWindow oluştur
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = biletViewController
    window.windowLevel = UIWindow.Level.alert + 1 // UIAlertController'dan daha üstte göstermek için
    window.makeKeyAndVisible()
}
