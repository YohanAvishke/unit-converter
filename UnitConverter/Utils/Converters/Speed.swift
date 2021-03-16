//
//  Speed.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum SpeedUnit: CaseIterable {
    case knot
    case ms
    case mih
    case kmh
}

class Speed {
    var unit: SpeedUnit
    var value: Double
    var decimalPlaces: Int
    
    init(unit: SpeedUnit, value: String, decimalPlaces: Int) {
        self.unit = unit
        self.value = Double(value)!
        self.decimalPlaces = decimalPlaces
    }
}

class SpeedConverter {
    var speed: Speed
    
    init(speed: Speed) {
        self.speed = speed
    }
    
    /**
     Convert `speed.value` from `speed.unit` to `to`
     
     - Parameters: `SpeedUnit` type  that  `value` is converted to
     - Returns: `String` containing the converted value
     */
    func convert(unit to: SpeedUnit) -> String {
        var output = 0.0
        
        switch speed.unit {
        case .knot:
            if to == .ms {
                output = speed.value / 1.944
            } else if to == .kmh {
                output = speed.value * 1.852
            } else if to == .mih {
                output = speed.value * 1.151
            }
        case .ms:
            if to == .kmh {
                output = speed.value * 5793.638
            } else if to == .mih {
                output = speed.value * 3600
            } else if to == .knot {
                output = speed.value / 3128.314
            }
        case .kmh:
            if to == .ms {
                output = speed.value / 3.6
            } else if to == .mih {
                output = speed.value / 1.609
            } else if to == .knot {
                output = speed.value / 1.852
            }
        case .mih:
            if to == .ms {
                output = speed.value / 2.237
            } else if to == .kmh {
                output = speed.value *  1.609
            } else if to == .knot {
                output = speed.value / 1.151
            }
        }
        
        // Check if output has a decimal part. And if true then round it off
        let deciamlPart = output.truncatingRemainder(dividingBy: 1)
        if deciamlPart > 0 {
            output = output.rounded(toPlaces: speed.decimalPlaces)
        } else {
            return String(Int(output))
        }
        
        if output == 0.0 {
            return ""
        }
        
        return String(output)
    }
}

