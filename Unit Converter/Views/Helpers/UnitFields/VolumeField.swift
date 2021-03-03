//
//  VolumeField.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct VolumeField: View {
    var unitType: VolumeUnit
    @State var valueOfGallon: String = ""
    @State var valueOfLitre: String = ""
    @State var valueOfPint: String = ""
    @State var valueOfFluid: String = ""
    @State var valueOfOunce: String = ""
    @State var valueOfMillilitre: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .gallon:
                Text("Imperial Gallon")
                createInputFeild(placeholder: "gal", bindedValue: $valueOfGallon)
                    .onChange(of: valueOfGallon) { value in
                        print(value)
                    }
            case .litre:
                Text("Litre")
                createInputFeild(placeholder: "l", bindedValue: $valueOfLitre)
                    .onChange(of: valueOfLitre) { value in
                        print(value)
                    }
            case .pint:
                Text("Imperial Pint")
                createInputFeild(placeholder: "pt", bindedValue: $valueOfPint)
                    .onChange(of: valueOfPint) { value in
                        print(value)
                    }
            case .fluid_ounce:
                Text("Fluid Ounce")
                createInputFeild(placeholder: "fl oz", bindedValue: $valueOfOunce)
                    .onChange(of: valueOfOunce) { value in
                        print(value)
                    }
            case .millilitre:
                Text("Millilitre")
                createInputFeild(placeholder: "ml", bindedValue: $valueOfMillilitre)
                    .onChange(of: valueOfMillilitre) { value in
                        print(value)
                    }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct VolumeField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VolumeField(unitType: VolumeUnit.gallon)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
