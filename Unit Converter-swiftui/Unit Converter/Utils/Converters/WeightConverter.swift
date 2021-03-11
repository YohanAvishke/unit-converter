import Foundation

struct WeightConverter {
    var type: WeightType
    var decimalPlaces = 3
    
    init(type: WeightType) {
        self.type = type
    }
    
    func convert(value: String, to: WeightType) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        if type == .kilogram {
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
        } else if type == .gram {
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
        } else if type == .ounce {
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
        } else if type == .pound {
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
        } else if type == .stone {
            if to == .kilogram {
                output = valueInNumber * 6.35
            } else if to == .gram {
                output = valueInNumber * 6350
            } else if to == .pound {
                output = valueInNumber *  14
            } else if to == .ounce {
                output = valueInNumber * 224
            }
        } else if type == .stone_pound {
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
