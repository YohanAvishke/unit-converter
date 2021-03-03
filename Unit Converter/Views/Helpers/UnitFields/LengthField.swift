//
//  LengthField.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct LengthField: View {
    var unitType: LengthtUnit
    @State var valueOfMetre: String = ""
    @State var valueOfKilometre: String = ""
    @State var valueOfMile: String = ""
    @State var valueOfCentimetre: String = ""
    @State var valueOfMillimetre: String = ""
    @State var valueOfYard: String = ""
    @State var valueOfInch: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .mile:
                Text("Mile")
                createInputFeild(placeholder: "mi", bindedValue: $valueOfMile)
                    .onChange(of: valueOfMile) { value in
                        print(value)
                    }
            case .kilometre:
                Text("Kilometre")
                createInputFeild(placeholder: "km", bindedValue: $valueOfKilometre)
                    .onChange(of: valueOfKilometre) { value in
                        print(value)
                    }
            case .metre:
                Text("Metre")
                createInputFeild(placeholder: "m", bindedValue: $valueOfMetre)
                    .onChange(of: valueOfMetre) { value in
                        print(value)
                    }
            case .yard:
                Text("Yard")
                createInputFeild(placeholder: "yd", bindedValue: $valueOfYard)
                    .onChange(of: valueOfYard) { value in
                        print(value)
                    }
            case .inch:
                Text("Inch")
                createInputFeild(placeholder: "in", bindedValue: $valueOfInch)
                    .onChange(of: valueOfInch) { value in
                        print(value)
                    }
            case .centimetre:
                Text("Centimetre")
                createInputFeild(placeholder: "cm", bindedValue: $valueOfCentimetre)
                    .onChange(of: valueOfCentimetre) { value in
                        print(value)
                    }
            case .millimetre:
                Text("Millimetre")
                createInputFeild(placeholder: "mm", bindedValue: $valueOfMillimetre)
                    .onChange(of: valueOfMillimetre) { value in
                        print(value)
                    }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct LengthField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LengthField(unitType: LengthtUnit.mile)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
