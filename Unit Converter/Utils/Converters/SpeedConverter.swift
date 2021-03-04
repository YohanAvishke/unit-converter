//
//  Speed.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import Foundation

struct SpeedConverter {
    let unit: SpeedUnit
    let decimalPlaces: Int
    
    init(unit: SpeedUnit, decimalPlaces: Int) {
        self.unit = unit
        self.decimalPlaces = decimalPlaces
    }
    
    func convert(value: Double, to: SpeedUnit) -> Double {
        var output = 0.0
        
        switch unit {
        case .knot:
            if to == .miles_hour {
                output = value * 1.151
            } else if to == .kilometres_hour {
                output = value * 1.852
            } else if to == .metres_sec {
                output = value / 1.944
            }
        case .miles_hour:
            if to == .knot {
                output = value / 1.151
            } else if to == .kilometres_hour {
                output = value *  1.609
            } else if to == .metres_sec {
                output = value / 2.237
            }
        case .kilometres_hour:
            if to == .knot {
                output = value / 1.852
            } else if to == .miles_hour {
                output = value / 1.609
            } else if to == .metres_sec {
                output = value / 3.6
            }
        case .metres_sec:
            if to == .knot {
                output = value * 1.944
            } else if to == .miles_hour {
                output = value * 2.237
            } else if to == .kilometres_hour {
                output = value * 3.6
            }
        }
        return output
    }
}

