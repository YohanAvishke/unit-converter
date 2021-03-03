//
//  WeightView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-02.
//

import SwiftUI

struct WeightView: View {
    var body: some View {
        ScrollView {
            VStack() {
                WeightField(unitType: WeightUnit.kilogram)
                WeightField(unitType: WeightUnit.gram)
                WeightField(unitType: WeightUnit.ounce)
                WeightField(unitType: WeightUnit.pound)
                HStack {
                    WeightField(unitType: WeightUnit.stone)
                    WeightField(unitType: WeightUnit.stone_pound)
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
