import Foundation
import SwiftUI

enum LengthtUnit {
    case mile
    case kilometre
    case metre
    case yard
    case inch
    case centimetre
    case millimetre
}

enum SpeedUnit {
    case knot
    case miles_hour 
    case kilometres_hour
    case metres_sec
}

enum VolumeUnit {
    case gallon
    case litre
    case pint
    case fluid_ounce
    case millilitre
}

func createInputFeild(placeholder: String, bindedValue: Binding<String>) -> AnyView {
    return AnyView(TextField(placeholder, text: bindedValue)
                    .keyboardType(.numberPad)
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(10)
                    
    )
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
