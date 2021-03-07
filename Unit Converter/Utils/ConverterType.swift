import Foundation

enum ConverterType: String {
    case weight = "Weight"
    case temperature = "Temperature"
    case distance = "Distance"
    case speed = "Speed"
    case volume = "Volume"
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
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
