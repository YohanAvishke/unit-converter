import Foundation
import Combine

final class History: ObservableObject {
    
    @Published var weight: [String] {
        didSet {
            UserDefaults.standard.set(weight, forKey: "weight")
        }
    }
    
    @Published var temperature: [String] {
        didSet {
            UserDefaults.standard.set(temperature, forKey: "temperature")
        }
    }
    
    @Published var distance: [String] {
        didSet {
            UserDefaults.standard.set(distance, forKey: "distance")
        }
    }
    
    @Published var speed: [String] {
        didSet {
            UserDefaults.standard.set(speed, forKey: "speed")
        }
    }
    
    @Published var volume: [String] {
        didSet {
            UserDefaults.standard.set(volume, forKey: "volume")
        }
    }
    
    init() {
        self.weight = UserDefaults.standard.object(forKey: "weight") as? [String] ?? []
        self.temperature = UserDefaults.standard.object(forKey: "temperature") as? [String] ?? []
        self.distance = UserDefaults.standard.object(forKey: "distance") as? [String] ?? []
        self.speed = UserDefaults.standard.object(forKey: "speed") as? [String] ?? []
        self.volume = UserDefaults.standard.object(forKey: "volume") as? [String] ?? []
    }
}
