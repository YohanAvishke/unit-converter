//
//  SpeedField.swift
//  Unit Converter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-03.
//

import SwiftUI

struct SpeedField: View {
    var unitType: SpeedUnit
    @State var valueOfMetresPerSecond: String = ""
    @State var valueOfKilometresPerHour: String = ""
    @State var valueOfMilesPerHour: String = ""
    @State var valueOfKnot: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .knot:
                Text("Nautical Miles / Hour")
                createInputFeild(placeholder: "knot", bindedValue: $valueOfKnot)
                    .onChange(of: valueOfKnot) { value in
                        print(value)
                    }
            case .miles_hour:
                Text("Miles / Hour")
                createInputFeild(placeholder: "mi/h", bindedValue: $valueOfMilesPerHour)
                    .onChange(of: valueOfMilesPerHour) { value in
                        print(value)
                    }
            case .kilometres_hour:
                Text("Kilometres / Hour")
                createInputFeild(placeholder: "°km/h", bindedValue: $valueOfKilometresPerHour)
                    .onChange(of: valueOfKilometresPerHour) { value in
                        print(value)
                    }
            case .metres_sec:
                Text("Metres / Second")
                createInputFeild(placeholder: "m/s", bindedValue: $valueOfMetresPerSecond)
                    .onChange(of: valueOfMetresPerSecond) { value in
                        print(value)
                    }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct SpeedField_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpeedField(unitType: SpeedUnit.knot)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
