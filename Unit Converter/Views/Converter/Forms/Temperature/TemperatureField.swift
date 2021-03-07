//
//  TemperatureField.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct TemperatureField: View {
    var unitType: TemperaturetUnit
    @State var valueOfCelsius = ""
    @State var valueOfFahrenheit = ""
    @State var valueOfKelvin = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .celsius:
                Text("Celsius")
                createInputFeild(placeholder: "°C", bindedValue: $valueOfCelsius)
                    .onChange(of: valueOfCelsius) { value in
                        print(value)
                    }
            case .fahrenheit:
                Text("Fahrenheit")
                createInputFeild(placeholder: "°F", bindedValue: $valueOfFahrenheit)
                    .onChange(of: valueOfFahrenheit) { value in
                        print(value)
                    }
            case .kelvin:
                Text("Kelvin")
                createInputFeild(placeholder: "K", bindedValue: $valueOfKelvin)
                    .onChange(of: valueOfKelvin) { value in
                        print(value)
                    }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct TemperatureField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TemperatureField(unitType: TemperaturetUnit.celsius)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
