//
//  History.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

final class History {
    var weight: [String] {
        didSet {
            UserDefaults.standard.set(weight, forKey: HistoryConst.WEIGHT_KEY)
        }
    }
    
    var temperature: [String] {
        didSet {
            UserDefaults.standard.set(temperature, forKey: "temperature")
        }
    }
    
    var distance: [String] {
        didSet {
            UserDefaults.standard.set(distance, forKey: "distance")
        }
    }
    
    var speed: [String] {
        didSet {
            UserDefaults.standard.set(speed, forKey: "speed")
        }
    }
    
    var volume: [String] {
        didSet {
            UserDefaults.standard.set(volume, forKey: "volume")
        }
    }
    
    init() {
        self.weight = UserDefaults.standard.array(forKey: HistoryConst.WEIGHT_KEY) as? [String] ?? []
        self.temperature = UserDefaults.standard.object(forKey: "temperature") as? [String] ?? []
        self.distance = UserDefaults.standard.object(forKey: "distance") as? [String] ?? []
        self.speed = UserDefaults.standard.object(forKey: "speed") as? [String] ?? []
        self.volume = UserDefaults.standard.object(forKey: "volume") as? [String] ?? []
    }
}
