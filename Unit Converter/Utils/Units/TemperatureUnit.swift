import Foundation

enum TemperatureType {
    case celsius
    case fahrenheit
    case kelvin
}

struct ValueOfTemperature {
    var celsius = ""
    var fahrenheit = ""
    var kelvin = ""
    
    mutating func clearAll() {
        celsius = ""
        fahrenheit = ""
        kelvin = ""
    }
}

struct TemperatureEditor {
    var celsius: Bool
    var fahrenheit: Bool
    var kelvin: Bool
    
    
    init() {
        self.celsius = false
        self.fahrenheit = false
        self.kelvin = false
    }
}
