//
//  Unit.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import Foundation
import SwiftUI

enum WeightUnit {
    case kilogram
    case gram
    case ounce
    case pound
    case stone
    case stone_pound
}

enum TemperaturetUnit {
    case celsius
    case fahrenheit
    case kelvin
}

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
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(10))
}
