import Foundation
import SwiftUI

struct Converter: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

enum ConverterType: String {
    case weight = "Weight"
    case temperature = "Temperature"
    case distance = "Distance"
    case speed = "Speed"
    case volume = "Volume"
}

struct ConverterValue {
    var weight: ValueOfWeight
    var temperature: ValueOfTemperature
    var distance: ValueOfDistance
    var speed: ValueOfSpeed
    var volume: ValueOfVolume
    
    init() {
        self.weight = ValueOfWeight()
        self.temperature = ValueOfTemperature()
        self.distance = ValueOfDistance()
        self.speed = ValueOfSpeed()
        self.volume = ValueOfVolume()
    }
    
    mutating func clearAll() {
        weight.clearAll()
        temperature.clearAll()
        distance.clearAll()
        speed.clearAll()
        volume.clearAll()
    }
}
