//
//  Weight.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-04.
//

import Foundation

struct WeightConverter {
    var unit: WeightUnit
    var decimalPlaces = 3
    
    init(unit:WeightUnit) {
        self.unit = unit
    }
    
    func convert(value: String, to: WeightUnit) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        if unit == .kilogram {
            if to == .gram {
                output = valueInNumber * 1000
            } else if to == .ounce {
                output = valueInNumber * 35.274
            } else if to == .pound {
                output = valueInNumber * 2.205
            } else if to == .stone {
                output = Double(Int(valueInNumber / 6.35))
            } else if to == .stone_pound {
                output = (valueInNumber / 6.35).truncatingRemainder(dividingBy: 1) *  14
            }
        } else if unit == .gram {
            if to == .kilogram {
                output = valueInNumber / 1000
            } else if to == .ounce {
                output = valueInNumber / 28.35
            } else if to == .pound {
                output = valueInNumber / 454
            } else if to == .stone {
                output = Double(Int(valueInNumber / 6350))
            } else if to == .stone_pound {
                output = (valueInNumber / 6350).truncatingRemainder(dividingBy: 1) *  14
            }
        } else if unit == .ounce {
            if to == .kilogram {
                output = valueInNumber / 35.274
            } else if to == .gram {
                output = valueInNumber * 28.35
            } else if to == .pound {
                output = valueInNumber / 16
            } else if to == .stone {
                output = Double(Int(valueInNumber / 224))
            } else if to == .stone_pound {
                output = (valueInNumber / 224).truncatingRemainder(dividingBy: 1) *  14
            }
        } else if unit == .pound {
            if to == .kilogram {
                output = valueInNumber / 2.205
            } else if to == .gram {
                output = valueInNumber * 454
            } else if to == .ounce {
                output = valueInNumber * 16
            } else if to == .stone {
                output = Double(Int(valueInNumber / 14))
            } else if to == .stone_pound {
                output = (valueInNumber / 14).truncatingRemainder(dividingBy: 1) *  14
            }
        } else if unit == .stone {
            if to == .kilogram {
                output = valueInNumber * 6.35
            } else if to == .gram {
                output = valueInNumber * 6350
            } else if to == .pound {
                output = valueInNumber *  14
            } else if to == .ounce {
                output = valueInNumber * 224
            }
        } else if unit == .stone_pound {
            if to == .kilogram {
                output = valueInNumber / 2.205
            } else if to == .gram {
                output = valueInNumber * 454
            } else if to == .ounce {
                output = valueInNumber * 16
            }
        }
        
        output = output.rounded(toPlaces: decimalPlaces)
        if output == 0.0 {
            return ""
        }
        return String(output)
    }
}
