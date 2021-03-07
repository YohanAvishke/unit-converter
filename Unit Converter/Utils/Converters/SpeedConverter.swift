import Foundation

struct SpeedConverter {
    let type: SpeedType
    var decimalPlaces = 3
    
    init(type: SpeedType) {
        self.type = type
    }
    
    func convert(value: String, to: SpeedType) -> String {
        let valueInNumber: Double = Double(value) ?? 0.0
        var output = 0.0
        
        switch type {
        case .knot:
            if to == .miles_hour {
                output = valueInNumber * 1.151
            } else if to == .kilometres_hour {
                output = valueInNumber * 1.852
            } else if to == .metres_sec {
                output = valueInNumber / 1.944
            }
        case .miles_hour:
            if to == .knot {
                output = valueInNumber / 1.151
            } else if to == .kilometres_hour {
                output = valueInNumber *  1.609
            } else if to == .metres_sec {
                output = valueInNumber / 2.237
            }
        case .kilometres_hour:
            if to == .knot {
                output = valueInNumber / 1.852
            } else if to == .miles_hour {
                output = valueInNumber / 1.609
            } else if to == .metres_sec {
                output = valueInNumber / 3.6
            }
        case .metres_sec:
            if to == .knot {
                output = valueInNumber * 1.944
            } else if to == .miles_hour {
                output = valueInNumber * 2.237
            } else if to == .kilometres_hour {
                output = valueInNumber * 3.6
            }
        }
        
        output = output.rounded(toPlaces: decimalPlaces)
        if output == 0.0 {
            return ""
        }
        return String(output)
    }
}

