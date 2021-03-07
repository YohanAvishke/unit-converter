import Foundation

struct VolumeConverter {
    let type: VolumeType
    var decimalPlaces = 3
    
    init(type: VolumeType) {
        self.type = type
    }
    
    func convert(value: String, to: VolumeType) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        switch type {
        case .litre:
            if to == .millilitre {
                output = valueInNumber * 1000
            } else if to == .gallon {
                output = valueInNumber / 4.546
            } else if to == .pint {
                output = valueInNumber * 1.76
            } else if to == .fluid_ounce {
                output = valueInNumber * 35.195
            }
        case .millilitre:
            if to == .litre {
                output = valueInNumber / 1000
            } else if to == .gallon {
                output = valueInNumber / 4546
            } else if to == .pint {
                output = valueInNumber / 568
            } else if to == .fluid_ounce {
                output = valueInNumber / 28.413
            }
        case .gallon:
            if to == .litre {
                output = valueInNumber * 4.546
            } else if to == .millilitre {
                output = valueInNumber * 4546
            } else if to == .pint {
                output = valueInNumber * 8
            } else if to == .fluid_ounce {
                output = valueInNumber * 160
            }
        case .pint:
            if to == .litre {
                output = valueInNumber / 1.76
            } else if to == .millilitre {
                output = valueInNumber * 568
            } else if to == .gallon {
                output = valueInNumber / 8
            } else if to == .fluid_ounce {
                output = valueInNumber * 20
            }
        case .fluid_ounce:
            if to == .litre {
                output = valueInNumber / 35.195
            } else if to == .millilitre {
                output = valueInNumber * 28.413
            } else if to == .gallon {
                output = valueInNumber / 160
            } else if to == .pint {
                output = valueInNumber / 20
            }
        }
        
        output = output.rounded(toPlaces: decimalPlaces)
        if output == 0.0 {
            return ""
        }
        return String(output)
    }
}
