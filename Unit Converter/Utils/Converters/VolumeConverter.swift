//
//  Volume.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import Foundation

struct VolumeConverter {
    let unit: VolumeUnit
    let decimalPlaces: Int
    
    init(unit: VolumeUnit, decimalPlaces: Int) {
        self.unit = unit
        self.decimalPlaces = decimalPlaces
    }
    
    func convert(value: Double, to: VolumeUnit) -> Double {
        var output = 0.0
        
        switch unit {
        case .litre:
            if to == .millilitre {
                output = value * 1000
            } else if to == .gallon {
                output = value / 4.546
            } else if to == .pint {
                output = value * 1.76
            } else if to == .fluid_ounce {
                output = value * 35.195
            }
        case .millilitre:
            if to == .litre {
                output = value / 1000
            } else if to == .gallon {
                output = value / 4546
            } else if to == .pint {
                output = value / 568
            } else if to == .fluid_ounce {
                output = value / 28.413
            }
        case .gallon:
            if to == .litre {
                output = value * 4.546
            } else if to == .millilitre {
                output = value * 4546
            } else if to == .pint {
                output = value * 8
            } else if to == .fluid_ounce {
                output = value * 160
            }
        case .pint:
            if to == .litre {
                output = value / 1.76
            } else if to == .millilitre {
                output = value * 568
            } else if to == .gallon {
                output = value / 8
            } else if to == .fluid_ounce {
                output = value * 20
            }
        case .fluid_ounce:
            if to == .litre {
                output = value / 35.195
            } else if to == .millilitre {
                output = value * 28.413
            } else if to == .gallon {
                output = value / 160
            } else if to == .pint {
                output = value / 20
            }
        }
        return output
    }
}
