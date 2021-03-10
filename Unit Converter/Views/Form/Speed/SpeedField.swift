import SwiftUI

struct SpeedField: View {
    var unitType: SpeedType
    @Binding var converterValue: ConverterValue
    @State private var editor: SpeedEditor = SpeedEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .knot:
                Text("Nautical Miles / Hour")
                createTextField(placeholder: "knot",
                                binding: $converterValue.speed.knot
                )
                .onChange(of: converterValue.speed.knot) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .miles_hour:
                Text("Miles / Hour")
                createTextField(placeholder: "mi/h",
                                binding: $converterValue.speed.milesPerHour
                )
                .onChange(of: converterValue.speed.milesPerHour) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kilometres_hour:
                Text("Kilometres / Hour")
                createTextField(placeholder: "km/h",
                                binding: $converterValue.speed.kilometresPerHour
                )
                .onChange(of: converterValue.speed.kilometresPerHour) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .metres_sec:
                Text("Metres / Second")
                createTextField(placeholder: "m/s",
                                binding: $converterValue.speed.metresPerSecond
                )
                .onChange(of: converterValue.speed.metresPerSecond) { (value) in
                    onUnitEdited(changedValue: value)
                }
            }
        }
        .padding(.horizontal, 15)
    }
    
    func createTextField(placeholder: String, binding: Binding<String>) -> AnyView {
        return AnyView(
            TextField (
                placeholder,
                text: binding
            ) { isEditing in
                switch unitType{
                case .knot:
                    self.editor.knot = isEditing
                case .miles_hour:
                    self.editor.milesPerHour = isEditing
                case .kilometres_hour:
                    self.editor.kilometresPerHour = isEditing
                case .metres_sec:
                    self.editor.metresPerSecond = isEditing
                }
            }
            .modifier(ClearButton(converterValue: $converterValue))
            .multilineTextAlignment(.leading)
            .keyboardType(.numberPad)
            .padding(.all)
            .background(Color.white)
            .cornerRadius(10)
        )
    }
    
    func onUnitEdited(changedValue: String){
        let converter = SpeedConverter(type: unitType)
        
        switch unitType {
        case .knot:
            if editor.knot{
                converterValue.speed.milesPerHour = converter.convert(value: changedValue,
                                                                      to: .miles_hour)
                converterValue.speed.kilometresPerHour = converter.convert(value: changedValue,
                                                                           to: .kilometres_hour)
                converterValue.speed.metresPerSecond = converter.convert(value: changedValue,
                                                                         to: .metres_sec)
            }
        case .miles_hour:
            if editor.milesPerHour{
                converterValue.speed.knot = converter.convert(value: changedValue, to: .knot)
                converterValue.speed.kilometresPerHour = converter.convert(value: changedValue,
                                                                           to: .kilometres_hour)
                converterValue.speed.metresPerSecond = converter.convert(value: changedValue,
                                                                         to: .metres_sec)
            }
        case .kilometres_hour:
            if editor.kilometresPerHour{
                converterValue.speed.knot = converter.convert(value: changedValue, to: .knot)
                converterValue.speed.milesPerHour = converter.convert(value: changedValue,
                                                                      to: .miles_hour)
                converterValue.speed.metresPerSecond = converter.convert(value: changedValue,
                                                                         to: .metres_sec)
            }
        case .metres_sec:
            if editor.metresPerSecond{
                converterValue.speed.knot = converter.convert(value: changedValue, to: .knot)
                converterValue.speed.milesPerHour = converter.convert(value: changedValue,
                                                                      to: .miles_hour)
                converterValue.speed.kilometresPerHour = converter.convert(value: changedValue,
                                                                           to: .kilometres_hour)
            }
        }
    }
}

struct SpeedField_Previews: PreviewProvider {
    @State static var converterValue = ConverterValue()
    
    static var previews: some View {
        Group {
            SpeedField(unitType: .metres_sec, converterValue: $converterValue)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
