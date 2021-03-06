//
//  WeightView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-02.
//

import SwiftUI

struct WeightView: View {
    @State private var valueOfKilogram = ""
    @State private var valueOfGram = ""
    @State private var valueOfOunce = ""
    @State private var valueOfPound = ""
    @State private var valueOfStone = ""
    @State private var valueOfStonePound = ""
    
    var body: some View {
        ScrollView {
            VStack() {
                WeightField(unitType: WeightUnit.kilogram,
                            weightConverter: WeightConverter(unit: WeightUnit.kilogram),
                            valueOfKilogram: self.$valueOfKilogram, valueOfGram: self.$valueOfGram,
                            valueOfOunce: self.$valueOfOunce, valueOfPound: self.$valueOfPound,
                            valueOfStone: self.$valueOfStone,
                            valueOfStonePound: self.$valueOfStonePound)
                WeightField(unitType: WeightUnit.gram,
                            weightConverter: WeightConverter(unit: WeightUnit.gram),
                            valueOfKilogram: self.$valueOfKilogram, valueOfGram: self.$valueOfGram,
                            valueOfOunce: self.$valueOfOunce, valueOfPound: self.$valueOfPound,
                            valueOfStone: self.$valueOfStone,
                            valueOfStonePound: self.$valueOfStonePound)
                WeightField(unitType: WeightUnit.ounce,
                            weightConverter: WeightConverter(unit: WeightUnit.ounce),
                            valueOfKilogram: self.$valueOfKilogram, valueOfGram: self.$valueOfGram,
                            valueOfOunce: self.$valueOfOunce, valueOfPound: self.$valueOfPound,
                            valueOfStone: self.$valueOfStone,
                            valueOfStonePound: self.$valueOfStonePound)
                WeightField(unitType: WeightUnit.pound,
                            weightConverter: WeightConverter(unit: WeightUnit.pound),
                            valueOfKilogram: self.$valueOfKilogram, valueOfGram: self.$valueOfGram,
                            valueOfOunce: self.$valueOfOunce, valueOfPound: self.$valueOfPound,
                            valueOfStone: self.$valueOfStone,
                            valueOfStonePound: self.$valueOfStonePound)
                HStack {
                    WeightField(unitType: WeightUnit.stone,
                                weightConverter: WeightConverter(unit: WeightUnit.stone),
                                valueOfKilogram: self.$valueOfKilogram,
                                valueOfGram: self.$valueOfGram, valueOfOunce: self.$valueOfOunce,
                                valueOfPound: self.$valueOfPound, valueOfStone: self.$valueOfStone,
                                valueOfStonePound: self.$valueOfStonePound)
                    WeightField(unitType: WeightUnit.stone_pound,
                                weightConverter: WeightConverter(unit: WeightUnit.stone_pound),
                                valueOfKilogram: self.$valueOfKilogram,
                                valueOfGram: self.$valueOfGram, valueOfOunce: self.$valueOfOunce,
                                valueOfPound: self.$valueOfPound, valueOfStone: self.$valueOfStone,
                                valueOfStonePound: self.$valueOfStonePound)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Weight")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
