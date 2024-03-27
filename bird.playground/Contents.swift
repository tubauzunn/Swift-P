import UIKit

// 1. Oyuncu Sınıfı
class Player {
    let nickname: String
    var score: Int

    init(nickname: String) {
        self.nickname = nickname
        self.score = 0
    }

    func displayInfo() {
        print("Oyuncu: \(nickname) - Puan: \(score)")
    }
}

// 2. Cannon (Topatar) Sınıfı
class Cannon {
    let g = 10.0 // yerçekimi ivmesi (m/s^2)
    let maxAngle = 90.0 // maksimum yerleşim açısı (derece)
    let maxVelocity = 100.0 // maksimum fırlatma hızı (m/s)
    
    func calculateRange(theta: Double, V: Double) -> Double {
        let radianTheta = theta * Double.pi / 180 // dereceyi radyana çevirme
        return (V * V * sin(2 * radianTheta)) / g
    }
}

// 3. Bottle (Şişe) Sınıfı
class Bottle {
    let minPosition = 0.0 // Şişenin minimum konumu
    let maxPosition = 1500.0 // Şişenin maksimum konumu
    let d: Double // konum
    let delta: Double // kaplama uzaklığı
    let status: Bool // durum (true: dik, false: devrik)

    init(d: Double, delta: Double, status: Bool) {
        // Şişenin konumunu min ve max değerleri arasında sınırla
        self.d = max(min(d, maxPosition), minPosition)
        // Delta değerini 0.1 ile 1 arasında sınırla
        self.delta = max(min(delta, 1.0), 0.1)
        self.status = status
    }
    
    func evaluateHit(range: Double) -> Bool {
        return (d - delta) <= range && range <= (d + delta)
    }
}



// 4. Game (Oyun) Sınıfı
class Game {
    var player: Player?
    var cannon: Cannon?
    var bottle: Bottle?

    func setPlayer(nickname: String) {
        self.player = Player(nickname: nickname)
    }
    
    func setBottle(d: Double, delta: Double, status: Bool) {
        self.bottle = Bottle(d: d, delta: delta, status: status)
    }
    
    func setCannon() {
        self.cannon = Cannon()
    }
    
    func fire(theta: Double, V: Double) {
        guard let cannon = cannon, let bottle = bottle else {
            print("Oyun parametreleri eksik!")
            return
        }
        
        let range = cannon.calculateRange(theta: theta, V: V)
        
        if bottle.evaluateHit(range: range) {
            print("Şişe vuruldu!")
            player?.score += 1
        } else {
            print("Hedefe isabet yok!")
        }
    }
}

// Örnek Kullanım
let game = Game()
game.setPlayer(nickname: "Tuba")
game.setBottle(d: 500, delta: 0.5, status: true)
game.setCannon()
game.fire(theta: 45, V: 50)
game.player?.displayInfo()

