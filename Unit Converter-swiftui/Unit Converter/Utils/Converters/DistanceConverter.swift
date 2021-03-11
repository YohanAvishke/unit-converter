import Foundation

struct DistanceConverter {
    let type: DistanceType
    var decimalPlaces = 3
    
    init(type: DistanceType) {
        self.type = type
    }
    
    func convert(value: String, to: DistanceType) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        switch type {
        case .mile:
            if to == .kilometre {
                output = valueInNumber * 1.609
            } else if to == .metre {
                output = valueInNumber * 1609
            } else if to == .yard {
                output = valueInNumber * 1760
            } else if to == .inch {
                output = valueInNumber * 63360
            } else if to == .centimetre {
                output = valueInNumber * 160934
            } else if to == .millimetre {
                output = valueInNumber * 1.609e+6
            }
        case .kilometre:
            if to == .mile {
                output = valueInNumber / 1.609
            } else if to == .metre {
                output = valueInNumber * 1000
            } else if to == .yard {
                output = valueInNumber * 1094
            } else if to == .inch {
                output = valueInNumber * 39370
            } else if to == .centimetre {
                output = valueInNumber * 100000
            } else if to == .millimetre {
                output = valueInNumber * 1e+6
            }
        case .metre:
            if to == .mile {
                output = valueInNumber / 1609
            } else if to == .kilometre {
                output = valueInNumber / 1000
            } else if to == .yard {
                output = valueInNumber * 1.094
            } else if to == .inch {
                output = valueInNumber * 39.37
            } else if to == .centimetre {
                output = valueInNumber * 100
            } else if to == .millimetre {
                output = valueInNumber * 1000
            }
        case .yard:
            if to == .mile {
                output = valueInNumber / 1760
            } else if to == .kilometre {
                output = valueInNumber / 1094
            } else if to == .metre {
                output = valueInNumber / 1.094
            } else if to == .inch {
                output = valueInNumber * 36
            } else if to == .centimetre {
                output = valueInNumber * 91.44
            } else if to == .millimetre {
                output = valueInNumber * 914
            }
        case .inch:
            if to == .mile {
                output = valueInNumber / 63360
            } else if to == .kilometre {
                output = valueInNumber / 39370
            } else if to == .metre {
                output = valueInNumber / 39.37
            } else if to == .yard {
                output = valueInNumber / 36
            } else if to == .centimetre {
                output = valueInNumber * 2.54
            } else if to == .millimetre {
                output = valueInNumber * 25.4
            }
        case .centimetre:
            if to == .mile {
                output = valueInNumber / 160934
            } else if to == .kilometre {
                output = valueInNumber / 100000
            } else if to == .metre {
                output = valueInNumber / 100
            } else if to == .yard {
                output = valueInNumber / 91.44
            } else if to == .inch {
                output = valueInNumber / 2.54
            } else if to == .millimetre {
                output = valueInNumber * 10
            }
        case .millimetre:
            if to == .mile {
                output = valueInNumber / 1.609e+6
            }else if to == .kilometre {
                output = valueInNumber / 1e+6
            } else if to == .metre {
                output = valueInNumber / 1000
            } else if to == .yard {
                output = valueInNumber / 914
            } else if to == .inch {
                output = valueInNumber / 25.4
            } else if to == .centimetre {
                output = valueInNumber / 10
            }
        }
        
        output = output.rounded(toPlaces: decimalPlaces)
        if output == 0.0 {
            return ""
        }
        return String(output)
    }
}

