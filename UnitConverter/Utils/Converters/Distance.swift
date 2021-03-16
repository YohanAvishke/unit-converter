//
//  Distance.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum DistanceUnit: CaseIterable {
    case mile
    case kilometer
    case meter
    case centimeter
    case millimeter
    case yard
    case inch
}

class Distance {
    var value: Double
    var unit: DistanceUnit
    var decimalPlaces: Int
    
    init(unit: DistanceUnit, value: String, decimalPlaces: Int) {
        self.unit = unit
        self.value = Double(value)!
        self.decimalPlaces = decimalPlaces
    }
}

class DistanceConverter {
    var distance: Distance
    
    init(distance: Distance) {
        self.distance = distance
    }
    
    /**
     Convert `distance.value` from `distance.unit` to `to`
     
     - Parameters: `DistanceUnit` type  that  `value` is converted to
     - Returns: `String` containing the converted value
     */
    func convert(to: DistanceUnit) -> String {
        var output = 0.0
        
        switch distance.unit {
        case .mile:
            if to == .kilometer {
                output = distance.value * 1.609
            } else if to == .meter {
                output = distance.value * 1609
            } else if to == .yard {
                output = distance.value * 1760
            } else if to == .inch {
                output = distance.value * 63360
            } else if to == .centimeter {
                output = distance.value * 160934
            } else if to == .millimeter {
                output = distance.value * 1.609e+6
            }
        case .kilometer:
            if to == .mile {
                output = distance.value / 1.609
            } else if to == .meter {
                output = distance.value * 1000
            } else if to == .yard {
                output = distance.value * 1094
            } else if to == .inch {
                output = distance.value * 39370
            } else if to == .centimeter {
                output = distance.value * 100000
            } else if to == .millimeter {
                output = distance.value * 1e+6
            }
        case .meter:
            if to == .mile {
                output = distance.value / 1609
            } else if to == .kilometer {
                output = distance.value / 1000
            } else if to == .yard {
                output = distance.value * 1.094
            } else if to == .inch {
                output = distance.value * 39.37
            } else if to == .centimeter {
                output = distance.value * 100
            } else if to == .millimeter {
                output = distance.value * 1000
            }
        case .yard:
            if to == .mile {
                output = distance.value / 1760
            } else if to == .kilometer {
                output = distance.value / 1094
            } else if to == .meter {
                output = distance.value / 1.094
            } else if to == .inch {
                output = distance.value * 36
            } else if to == .centimeter {
                output = distance.value * 91.44
            } else if to == .millimeter {
                output = distance.value * 914
            }
        case .inch:
            if to == .mile {
                output = distance.value / 63360
            } else if to == .kilometer {
                output = distance.value / 39370
            } else if to == .meter {
                output = distance.value / 39.37
            } else if to == .yard {
                output = distance.value / 36
            } else if to == .centimeter {
                output = distance.value * 2.54
            } else if to == .millimeter {
                output = distance.value * 25.4
            }
        case .centimeter:
            if to == .mile {
                output = distance.value / 160934
            } else if to == .kilometer {
                output = distance.value / 100000
            } else if to == .meter {
                output = distance.value / 100
            } else if to == .yard {
                output = distance.value / 91.44
            } else if to == .inch {
                output = distance.value / 2.54
            } else if to == .millimeter {
                output = distance.value * 10
            }
        case .millimeter:
            if to == .mile {
                output = distance.value / 1.609e+6
            }else if to == .kilometer {
                output = distance.value / 1e+6
            } else if to == .meter {
                output = distance.value / 1000
            } else if to == .yard {
                output = distance.value / 914
            } else if to == .inch {
                output = distance.value / 25.4
            } else if to == .centimeter {
                output = distance.value / 10
            }
        }
        
        // Check if output has a decimal part. And if true then round it off
        let deciamlPart = output.truncatingRemainder(dividingBy: 1)
        if deciamlPart > 0 {
            output = output.rounded(toPlaces: distance.decimalPlaces)
        } else {
            return String(Int(output))
        }
        
        if output == 0.0 {
            return ""
        }
        
        return String(output)
    }
}

