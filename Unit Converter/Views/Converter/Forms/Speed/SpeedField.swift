import SwiftUI

struct SpeedField: View {
    var unitType: SpeedType
    @Binding var valueOfSpeed: ValueOfSpeed
    @State private var editor: SpeedEditor = SpeedEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .knot:
                Text("Nautical Miles / Hour")
                createTextField(placeholder: "knot", binding: $valueOfSpeed.knot
                )
                .onChange(of: valueOfSpeed.knot) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .miles_hour:
                Text("Miles / Hour")
                createTextField(placeholder: "mi/h", binding: $valueOfSpeed.milesPerHour
                )
                .onChange(of: valueOfSpeed.milesPerHour) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kilometres_hour:
                Text("Kilometres / Hour")
                createTextField(placeholder: "km/h", binding: $valueOfSpeed.kilometresPerHour
                )
                .onChange(of: valueOfSpeed.kilometresPerHour) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .metres_sec:
                Text("Metres / Second")
                createTextField(placeholder: "m/s", binding: $valueOfSpeed.metresPerSecond
                )
                .onChange(of: valueOfSpeed.metresPerSecond) { (value) in
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
                valueOfSpeed.milesPerHour = converter.convert(value: changedValue, to: .miles_hour)
                valueOfSpeed.kilometresPerHour = converter.convert(value: changedValue,
                                                                   to: .kilometres_hour)
                valueOfSpeed.metresPerSecond = converter.convert(value: changedValue, to: .metres_sec)
            }
        case .miles_hour:
            if editor.milesPerHour{
                valueOfSpeed.knot = converter.convert(value: changedValue, to: .knot)
                valueOfSpeed.kilometresPerHour = converter.convert(value: changedValue,
                                                                   to: .kilometres_hour)
                valueOfSpeed.metresPerSecond = converter.convert(value: changedValue, to: .metres_sec)
            }
        case .kilometres_hour:
            if editor.kilometresPerHour{
                valueOfSpeed.knot = converter.convert(value: changedValue, to: .knot)
                valueOfSpeed.milesPerHour = converter.convert(value: changedValue, to: .miles_hour)
                valueOfSpeed.metresPerSecond = converter.convert(value: changedValue, to: .metres_sec)
            }
        case .metres_sec:
            if editor.metresPerSecond{
                valueOfSpeed.knot = converter.convert(value: changedValue, to: .knot)
                valueOfSpeed.milesPerHour = converter.convert(value: changedValue, to: .miles_hour)
                valueOfSpeed.kilometresPerHour = converter.convert(value: changedValue,
                                                                   to: .kilometres_hour)
            }
        }
    }
}

struct SpeedField_Previews: PreviewProvider {
    @State static var valueOfSpeed = ValueOfSpeed()
    
    static var previews: some View {
        Group {
            SpeedField(unitType: SpeedType.knot,
                       valueOfSpeed: $valueOfSpeed)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
