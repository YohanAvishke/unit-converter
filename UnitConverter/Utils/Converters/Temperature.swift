//
//  Temperature.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum TemperatureUnit: CaseIterable {
    case celsius
    case fahrenheit
    case kelvin
}

class Temperature {
    var unit: TemperatureUnit
    var value: Double
    var decimalPlaces: Int
    
    init(unit: TemperatureUnit, value: String, decimalPlaces: Int) {
        self.unit = unit
        self.value = Double(value)!
        self.decimalPlaces = decimalPlaces
    }
}

class TemperatureConverter {
    var temperature: Temperature
    
    init(temperature: Temperature) {
        self.temperature = temperature
    }
    
    /**
     Convert `temperature.value` from `temperature.unit` to `to`
     
     - Parameters: `TemperatureUnit` type  that  `value` is converted to
     - Returns: `String` containing the converted value
     */
    func convert(unit to: TemperatureUnit) -> String {
        var output = 0.0
        
        switch temperature.unit {
        case .celsius:
            if to == .fahrenheit {
                output = (temperature.value * 9 / 5) + 32
            } else if to == .kelvin {
                output = temperature.value + 273.15
            }
        case .fahrenheit:
            if to == .celsius {
                output = (temperature.value - 32) * 5 / 9
            } else if to == .kelvin {
                output = ((temperature.value - 32) * 5 / 9) + 273.15
            }
        case .kelvin:
            if to == .celsius {
                output = temperature.value - 273.15
            } else if to == .fahrenheit {
                output = ((temperature.value - 273.15) * 9 / 5) + 32
            }
        }
        
        // Check if output has a decimal part. And if true then round it off
        let deciamlPart = output.truncatingRemainder(dividingBy: 1)
        if deciamlPart > 0 {
            output = output.rounded(toPlaces: temperature.decimalPlaces)
        } else {
            return String(Int(output))
        }
        
        if output == 0.0 {
            return ""
        }
        
        return String(output)
    }
}
