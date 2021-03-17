//
//  History.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum SegmentType {
    case weight
    case temperature
    case distance
    case speed
    case volume
}

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
    
    /**
     Map segment type of Segment Controller to matching `UserDefaults`
     
     - Parameters segmentType: `SegmentType` type  of the coverter's history
     - Returns: Matching `UserDefaults` `String` [] of a key
     */
    func segmentToHistoryMapping(segmentType: SegmentType) -> [String] {
        switch segmentType {
        case .weight:
            return self.weight
        case .temperature:
            return self.temperature
        case .distance:
            return self.distance
        case .speed:
            return self.speed
        case .volume:
            return self.volume
        }
    }
    
    /**
     Delete value of a key in `UserDefaults` to clear converter type's history
     
     - Parameters segmentType: `SegmentType` type  of the coverter's history
     - Returns: An empty array
     */
    func deleteHistory(segmentType: SegmentType) -> [String] {
        switch segmentType {
        case .weight:
            weight = []
        case .temperature:
            temperature = []
        case .distance:
            distance = []
        case .speed:
            speed = []
        case .volume:
            volume = []
        }
        return []
    }
}
