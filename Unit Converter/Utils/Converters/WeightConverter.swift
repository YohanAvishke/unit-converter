//
//  Weight.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-04.
//

import Foundation

struct WeightConverter {
    let unit: WeightUnit
    let decimalPlaces: Int
    
    init(unit: WeightUnit, decimalPlaces: Int) {
        self.unit = unit
        self.decimalPlaces = decimalPlaces
    }
    
    func convert(value: Double, to: WeightUnit) -> Double {
        var output = 0.0
        
        if unit == .kilogram {
            if to == .gram {
                output = value * 1000
            } else if to == .ounce {
                output = value * 35.274
            } else if to == .pound {
                output = value * 2.205
            } else if to == .stone {
                output = value / 6.35
            }
        } else if unit == .gram {
            if to == .kilogram {
                output = value / 1000
            } else if to == .ounce {
                output = value / 28.35
            } else if to == .pound {
                output = value / 454
            } else if to == .stone {
                output = value / 6350
            }
        } else if unit == .ounce {
            if to == .kilogram {
                output = value / 35.274
            } else if to == .gram {
                output = value * 28.35
            } else if to == .pound {
                output = value / 16
            } else if to == .stone {
                output = value / 224
            }
        } else if unit == .pound {
            if to == .kilogram {
                output = value / 2.205
            } else if to == .gram {
                output = value * 454
            } else if to == .ounce {
                output = value * 16
            } else if to == .stone {
                output = value / 14
            }
        } else if unit == .stone {
            if to == .kilogram {
                output = value * 6.35
            } else if to == .gram {
                output = value * 6350
            } else if to == .pound {
                output = value *  14
            } else if to == .ounce {
                output = value * 224
            }
        }
        return output
    }
}
