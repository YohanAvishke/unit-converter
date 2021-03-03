//
//  Unit.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import Foundation
import SwiftUI

enum Unit {
    case kilogram
    case gram
    case ounce
    case pound
    case stone
    case stone_pound
}

func createInputFeild(placeholder: String, bindedValue: Binding<String>) -> AnyView {
    return AnyView(TextField(placeholder, text: bindedValue)
                    .padding(.all)
                    .background(Color.white)
                    .cornerRadius(10))
}
