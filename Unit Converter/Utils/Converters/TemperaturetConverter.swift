//
//  Temperature.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import Foundation

struct TemperaturetConverter {
    let value: Double
    let unit: TemperaturetUnit
    
    init(unit: TemperaturetUnit, value: Double) {
        self.value = value
        self.unit = unit
    }
    
    func convert(value: Double, to: TemperaturetUnit) -> Double {
        var output = 0.0
        
        switch unit {
        case .celsius:
            if to == .fahrenheit {
                output = (value * 9 / 5) + 32
            } else if to == .kelvin {
                output = value + 273.15
            }
        case .fahrenheit:
            if to == .celsius {
                output = (value - 32) * 5 / 9
            } else if to == .kelvin {
                output = ((value - 32) * 5 / 9) + 273.15
            }
        case .kelvin:
            if to == .celsius {
                output = value - 273.15
            } else if to == .fahrenheit {
                output = ((value - 273.15) * 9 / 5) + 32
            }
        }
        return output
    }
}
