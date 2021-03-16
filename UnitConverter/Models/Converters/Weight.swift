//
//  Weight.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum WeightUnit: CaseIterable {
    case kilogram
    case gram
    case ounce
    case pound
    case stone
}

class Weight {
    var value: Double
    var unit: WeightUnit
    var decimalPlaces: Int
    
    init(unit: WeightUnit, value: String, decimalPlaces: Int) {
        self.unit = unit
        self.value = Double(value)!
        self.decimalPlaces = decimalPlaces
    }
}

class WeightConverter {
    var weight: Weight
    
    init(weight: Weight) {
        self.weight = weight
    }
    
    /**
     Convert `weight.value` from `weight.unit` to `to`
     
     - Parameters: `WeightUnit` type  that  `value` is converted to
     - Returns: `String` containing the converted value
     */
    func convert(to: WeightUnit) -> String {
        var output = 0.0
        
        switch weight.unit {
        case .kilogram:
            if to == .gram {
                output = weight.value * 1000
            } else if to == .ounce {
                output = weight.value * 35.274
            } else if to == .pound {
                output = weight.value * 2.205
            } else if to == .stone {
                output = weight.value / 6.35
            }
        case .gram:
            if to == .kilogram {
                output = weight.value / 1000
            } else if to == .ounce {
                output = weight.value / 28.35
            } else if to == .pound {
                output = weight.value / 454
            } else if to == .stone {
                output = weight.value / 6350
            }
        case .ounce:
            if to == .kilogram {
                output = weight.value / 35.274
            } else if to == .gram {
                output = weight.value * 28.35
            } else if to == .pound {
                output = weight.value / 16
            }  else if to == .stone {
                output = weight.value / 224
            }
        case .pound:
            if to == .kilogram {
                output = weight.value / 2.205
            } else if to == .gram {
                output = weight.value * 454
            } else if to == .ounce {
                output = weight.value * 16
            } else if to == .stone {
                output = weight.value / 14
            }
        case .stone:
            if to == .kilogram {
                output = weight.value * 6.35
            } else if to == .gram {
                output = weight.value * 6350
            } else if to == .pound {
                output = weight.value *  14
            } else if to == .ounce {
                output = weight.value * 224
            }
        }
        
        // Check if output has a decimal part. And if true then round it off
        let deciamlPart = output.truncatingRemainder(dividingBy: 1)
        if deciamlPart > 0 {
            output = output.rounded(toPlaces: weight.decimalPlaces)
        } else {
            return String(Int(output))
        }
        
        if output == 0.0 {
            return ""
        }
        
        return String(output)
    }
}
