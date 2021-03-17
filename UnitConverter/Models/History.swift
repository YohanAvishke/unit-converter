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
        self.temperature = UserDefaults.standard.object(forKey:  HistoryConst.TEMP_KEY) as? [String] ?? []
        self.distance = UserDefaults.standard.object(forKey:  HistoryConst.DISTANCE_KEY) as? [String] ?? []
        self.speed = UserDefaults.standard.object(forKey:  HistoryConst.SPEED_KEY) as? [String] ?? []
        self.volume = UserDefaults.standard.object(forKey:  HistoryConst.VOLUME_KEY) as? [String] ?? []
    }
}
