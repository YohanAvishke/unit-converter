//
//  TemperatureView.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct TemperatureView: View {
    var body: some View {
        ScrollView {
            VStack() {
                TemperatureField(unitType: TemperaturetUnit.celsius)
                TemperatureField(unitType: TemperaturetUnit.fahrenheit)
                TemperatureField(unitType: TemperaturetUnit.kelvin)
            }
            .padding(.top)
        }
        .navigationTitle("Temperature")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
