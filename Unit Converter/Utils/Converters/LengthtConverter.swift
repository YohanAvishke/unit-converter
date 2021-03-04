//
//  Distance.swift
//  utility-converter
//
//  Created by Brion Silva on 26/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//

import Foundation

struct LengthtConverter {
    let unit: LengthtUnit
    let decimalPlaces: Int
    
    init(unit: LengthtUnit, decimalPlaces: Int) {
        self.unit = unit
        self.decimalPlaces = decimalPlaces
    }
    
    func convert(value: Double, to: LengthtUnit) -> Double {
        var output = 0.0
        
        switch unit {
        case .mile:
            if to == .kilometre {
                output = value * 1.609
            } else if to == .metre {
                output = value * 1609
            } else if to == .yard {
                output = value * 1760
            } else if to == .inch {
                output = value * 63360
            } else if to == .centimetre {
                output = value * 160934
            } else if to == .millimetre {
                output = value * 1.609e+6
            }
        case .kilometre:
            if to == .mile {
                output = value / 1.609
            } else if to == .metre {
                output = value * 1000
            } else if to == .yard {
                output = value * 1094
            } else if to == .inch {
                output = value * 39370
            } else if to == .centimetre {
                output = value * 100000
            } else if to == .millimetre {
                output = value * 1e+6
            }
        case .metre:
            if to == .mile {
                output = value / 1609
            } else if to == .kilometre {
                output = value / 1000
            } else if to == .yard {
                output = value * 1.094
            } else if to == .inch {
                output = value * 39.37
            } else if to == .centimetre {
                output = value * 100
            } else if to == .millimetre {
                output = value * 1000
            }
        case .yard:
            if to == .mile {
                output = value / 1760
            } else if to == .kilometre {
                output = value / 1094
            } else if to == .metre {
                output = value / 1.094
            } else if to == .inch {
                output = value * 36
            } else if to == .centimetre {
                output = value * 91.44
            } else if to == .millimetre {
                output = value * 914
            }
        case .inch:
            if to == .mile {
                output = value / 63360
            } else if to == .kilometre {
                output = value / 39370
            } else if to == .metre {
                output = value / 39.37
            } else if to == .yard {
                output = value / 36
            } else if to == .centimetre {
                output = value * 2.54
            } else if to == .millimetre {
                output = value * 25.4
            }
        case .centimetre:
            if to == .mile {
                output = value / 160934
            } else if to == .kilometre {
                output = value / 100000
            } else if to == .metre {
                output = value / 100
            } else if to == .yard {
                output = value / 91.44
            } else if to == .inch {
                output = value / 2.54
            } else if to == .millimetre {
                output = value * 10
            }
        case .millimetre:
            if to == .mile {
                output = value / 1.609e+6
            }else if to == .kilometre {
                output = value / 1e+6
            } else if to == .metre {
                output = value / 1000
            } else if to == .yard {
                output = value / 914
            } else if to == .inch {
                output = value / 25.4
            } else if to == .centimetre {
                output = value / 10
            }
        }
        return output
    }
}

