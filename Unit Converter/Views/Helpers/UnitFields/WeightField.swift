//
//  TextFieldWithLabel.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct WeightField: View {
    var unitType: WeightUnit
    var weightConverter: WeightConverter
    @State private var isEditingKilo = false
    @State private var isEditingGram = false
    @State private var isEditingOunce = false
    @State private var isEditingPound = false
    @State private var isEditingStone = false
    @State private var isEditingStonePound = false
    @Binding var valueOfKilogram: String
    @Binding var valueOfGram: String
    @Binding var valueOfOunce: String
    @Binding var valueOfPound: String
    @Binding var valueOfStone: String
    @Binding var valueOfStonePound: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            
            switch unitType {
            case .kilogram:
                Text("Kilograms")
                TextField (
                    "kg",
                    text: $valueOfKilogram
                ) { isEditingKilo in
                    self.isEditingKilo = isEditingKilo
                } .onChange(of: valueOfKilogram) { (value) in
                    if isEditingKilo {
                        valueOfGram = weightConverter.convert(value: value, to: WeightUnit.gram)
                        valueOfOunce = weightConverter.convert(value: value, to: WeightUnit.ounce)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                        valueOfStone = weightConverter.convert(value: value, to: WeightUnit.stone)
                        valueOfStonePound = weightConverter.convert(value: value, to: WeightUnit.stone_pound)
                    }
                }
            case .gram:
                Text("Grams")
                
                TextField (
                    "g",
                    text: $valueOfGram
                ) { isEditingGram in
                    self.isEditingGram = isEditingGram
                } .onChange(of: valueOfGram) { (value) in
                    if isEditingGram {
                        valueOfKilogram = weightConverter.convert(value: value,
                                                                  to: WeightUnit.kilogram)
                        valueOfOunce = weightConverter.convert(value: value, to: WeightUnit.ounce)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                        valueOfStone = weightConverter.convert(value: value, to: WeightUnit.stone)
                        valueOfStonePound = weightConverter.convert(value: value,
                                                                    to: WeightUnit.stone_pound)
                    }
                }
            case .ounce:
                Text("Ounces")
                TextField (
                    "ou",
                    text: $valueOfOunce
                ) { isEditingOunce in
                    self.isEditingOunce = isEditingOunce
                } .onChange(of: valueOfOunce) { (value) in
                    if isEditingOunce {
                        valueOfKilogram = weightConverter.convert(value: value,
                                                                  to: WeightUnit.kilogram)
                        valueOfGram = weightConverter.convert(value: value, to: WeightUnit.gram)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                        valueOfStone = weightConverter.convert(value: value, to: WeightUnit.stone)
                        valueOfStonePound = weightConverter.convert(value: value,
                                                                    to: WeightUnit.stone_pound)
                    }
                }
            case .pound:
                Text("Pounds")
                TextField (
                    "lb",
                    text: $valueOfPound
                ) { isEditingPound in
                    self.isEditingPound = isEditingPound
                } .onChange(of: valueOfPound) { (value) in
                    if isEditingPound {
                        valueOfKilogram = weightConverter.convert(value: value,
                                                                  to: WeightUnit.kilogram)
                        valueOfGram = weightConverter.convert(value: value, to: WeightUnit.gram)
                        valueOfOunce = weightConverter.convert(value: value, to: WeightUnit.ounce)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                        valueOfStone = weightConverter.convert(value: value, to: WeightUnit.stone)
                        valueOfStonePound = weightConverter.convert(value: value,
                                                                    to: WeightUnit.stone_pound)
                    }
                }
            case .stone:
                Text("Stones")
                TextField (
                    "st",
                    text: $valueOfStone
                ) { isEditingStone in
                    self.isEditingStone = isEditingStone
                } .onChange(of: valueOfStone) { (value) in
                    if isEditingStone {
                        valueOfKilogram = weightConverter.convert(value: value,
                                                                  to: WeightUnit.kilogram)
                        valueOfGram = weightConverter.convert(value: value, to: WeightUnit.gram)
                        valueOfOunce = weightConverter.convert(value: value, to: WeightUnit.ounce)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                    }
                }
            case .stone_pound:
                Text("Pounds")
                TextField (
                    "lb",
                    text: $valueOfStonePound
                ) { isEditingStonePound in
                    self.isEditingStonePound = isEditingStonePound
                } .onChange(of: valueOfStonePound) { (value) in
                    if isEditingStonePound {
                        valueOfKilogram = weightConverter.convert(value: value,
                                                                  to: WeightUnit.kilogram)
                        valueOfGram = weightConverter.convert(value: value, to: WeightUnit.gram)
                        valueOfOunce = weightConverter.convert(value: value, to: WeightUnit.ounce)
                        valueOfPound = weightConverter.convert(value: value, to: WeightUnit.pound)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

//struct WeightField_Previews: PreviewProvider {
//    @State private var valueOfKilogram = ""
//    @State private var valueOfGram = ""
//    @State private var valueOfOunce = ""
//    @State private var valueOfPound = ""
//    @State private var valueOfStone = ""
//    @State private var valueOfStonePound = ""
//    
//    static var previews: some View {
//        Group {
//            VStack {
//                WeightField(unitType: WeightUnit.kilogram,
//                            weightConverter: WeightConverter(unit: WeightUnit.kilogram),
//                            valueOfKilogram: self.$valueOfKilogram, valueOfGram: self.$valueOfGram,
//                            valueOfOunce: self.$valueOfOunce, valueOfPound: self.$valueOfPound,
//                            valueOfStone: self.$valueOfStone,
//                            valueOfStonePound: self.$valueOfStonePound)
//            }
//        }
//        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
//        .previewLayout(.fixed(width: 400, height: 160))
//    }
//}
