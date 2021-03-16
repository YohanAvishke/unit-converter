//
//  Volume.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-16.
//

import Foundation

enum VolumeUnit: CaseIterable {
    case litre
    case millilitre
    case gallon
    case pint
    case fluidOunce
}

class Volume {
    var unit: VolumeUnit
    var value: Double
    var decimalPlaces: Int
    
    init(unit: VolumeUnit, value: String, decimalPlaces: Int) {
        self.unit = unit
        self.value = Double(value)!
        self.decimalPlaces = decimalPlaces
    }
}

class VolumeConverter {
    var volume: Volume
    
    init(volume: Volume) {
        self.volume = volume
    }
    
    /**
     Convert `volume.value` from `volume.unit` to `to`
     
     - Parameters: `VolumeUnit` type  that  `value` is converted to
     - Returns: `String` containing the converted value
     */
    func convert(unit to: VolumeUnit) -> String {
        var output = 0.0
        
        switch volume.unit {
        case .litre:
            if to == .millilitre {
                output = volume.value * 1000
            } else if to == .gallon {
                output = volume.value / 4.546
            } else if to == .pint {
                output = volume.value * 1.76
            } else if to == .fluidOunce {
                output = volume.value * 35.195
            }
        case .millilitre:
            if to == .litre {
                output = volume.value / 1000
            } else if to == .gallon {
                output = volume.value / 3785.412
            } else if to == .pint {
                output = volume.value / 568.261
            } else if to == .fluidOunce {
                output = volume.value / 28.413
            }
        case .gallon:
            if to == .litre {
                output = volume.value * 4.546
            } else if to == .millilitre {
                output = volume.value * 4546.09
            } else if to == .pint {
                output = volume.value * 8
            } else if to == .fluidOunce {
                output = volume.value * 160
            }
        case .pint:
            if to == .litre {
                output = volume.value / 1.76
            } else if to == .millilitre {
                output = volume.value * 568
            } else if to == .gallon {
                output = volume.value / 8
            } else if to == .fluidOunce {
                output = volume.value * 20
            }
        case .fluidOunce:
            if to == .litre {
                output = volume.value / 35.195
            } else if to == .millilitre {
                output = volume.value * 28.413
            } else if to == .gallon {
                output = volume.value / 160
            } else if to == .pint {
                output = volume.value / 20
            }
        }
        
        // Check if output has a decimal part. And if true then round it off
        let deciamlPart = output.truncatingRemainder(dividingBy: 1)
        if deciamlPart > 0 {
            output = output.rounded(toPlaces: volume.decimalPlaces)
        } else {
            return String(Int(output))
        }
        
        if output == 0.0 {
            return ""
        }
        
        return String(output)
    }
}
