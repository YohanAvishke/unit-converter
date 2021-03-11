import Foundation

struct TemperatureConverter {
    let type: TemperatureType
    var decimalPlaces = 3
    
    init(type: TemperatureType) {
        self.type = type
    }
    
    func convert(value: String, to: TemperatureType) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        switch type {
        case .celsius:
            if to == .fahrenheit {
                output = (valueInNumber * 9 / 5) + 32
            } else if to == .kelvin {
                output = valueInNumber + 273.15
            }
        case .fahrenheit:
            if to == .celsius {
                output = (valueInNumber - 32) * 5 / 9
            } else if to == .kelvin {
                output = ((valueInNumber - 32) * 5 / 9) + 273.15
            }
        case .kelvin:
            if to == .celsius {
                output = valueInNumber - 273.15
            } else if to == .fahrenheit {
                output = ((valueInNumber - 273.15) * 9 / 5) + 32
            }
        }
        
        output = output.rounded(toPlaces: decimalPlaces)
        if output == 0.0 {
            return ""
        }
        return String(output)
    }
}
