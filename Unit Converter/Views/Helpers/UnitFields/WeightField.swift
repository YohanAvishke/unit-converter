//
//  TextFieldWithLabel.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct WeightField: View {
    var unitType: WeightUnit
    @State var valueOfKilogram = ""
    @State var valueOfGram = ""
    @State var valueOfOunce = ""
    @State var valueOfPound = ""
    @State var valueOfStone = ""
    @State var valueOfStonePound = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .kilogram:
                Text("Kilograms")
                createInputFeild(placeholder: "kg", bindedValue: $valueOfKilogram)
                    .onChange(of: valueOfKilogram) { value in
                        print(value)
                    }
            case .gram:
                Text("Grams")
                createInputFeild(placeholder: "g", bindedValue: $valueOfGram)
                    .onChange(of: valueOfGram) { value in
                        print(value)
                    }
            case .ounce:
                Text("Ounces")
                createInputFeild(placeholder: "ou", bindedValue: $valueOfOunce)
                    .onChange(of: valueOfOunce) { value in
                        print(value)
                    }
            case .pound:
                Text("Pounds")
                createInputFeild(placeholder: "lb", bindedValue: $valueOfPound)
                    .onChange(of: valueOfPound) { value in
                        print(value)
                    }
            case .stone:
                Text("Stones")
                createInputFeild(placeholder: "st", bindedValue: $valueOfStone)
                    .onChange(of: valueOfStonePound) { value in
                        print(value)
                    }
            case .stone_pound:
                Text("Pounds")
                createInputFeild(placeholder: "lb", bindedValue: $valueOfStonePound)
                    .onChange(of: valueOfStonePound) { value in
                        print(value)
                    }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct WeightField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeightField(unitType: WeightUnit.kilogram)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
