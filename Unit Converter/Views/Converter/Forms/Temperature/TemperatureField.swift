import SwiftUI

struct TemperatureField: View {
    var unitType: TemperatureType
    @Binding var valueOfTemperature: ValueOfTemperature
    @State private var editor: TemperatureEditor = TemperatureEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .celsius:
                Text("Celsius")
                createTextField(placeholder: "°C",
                                binding: $valueOfTemperature.celsius
                )
                .onChange(of: valueOfTemperature.celsius) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .fahrenheit:
                Text("Fahrenheit")
                createTextField(placeholder: "°F",
                                binding: $valueOfTemperature.fahrenheit
                )
                .onChange(of: valueOfTemperature.fahrenheit) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kelvin:
                Text("Kelvin")
                createTextField(placeholder: "K",
                                binding: $valueOfTemperature.kelvin
                )
                .onChange(of: valueOfTemperature.kelvin) { (value) in
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
                case .celsius:
                    self.editor.celsius = isEditing
                case .fahrenheit:
                    self.editor.fahrenheit = isEditing
                case .kelvin:
                    self.editor.kelvin = isEditing
                }
            }
            .keyboardType(.numberPad)
            .padding(.all)
            .background(Color.white)
            .cornerRadius(10)
        )
    }
    
    func onUnitEdited(changedValue: String){
        let converter = TemperatureConverter(type: unitType)
        
        switch unitType {
        case .celsius:
            if editor.celsius{
                valueOfTemperature.fahrenheit = converter.convert(value: changedValue,
                                                                  to: .fahrenheit)
                valueOfTemperature.kelvin = converter.convert(value: changedValue, to: .kelvin)
            }
        case .fahrenheit:
            if editor.fahrenheit{
                valueOfTemperature.celsius = converter.convert(value: changedValue, to: .celsius)
                valueOfTemperature.kelvin = converter.convert(value: changedValue, to: .kelvin)
            }
        case .kelvin:
            if editor.kelvin{
                valueOfTemperature.celsius = converter.convert(value: changedValue, to: .celsius)
                valueOfTemperature.fahrenheit = converter.convert(value: changedValue,
                                                                  to: .fahrenheit)
            }
        }
    }
}

struct TemperatureField_Previews: PreviewProvider {
    @State static var valueOfTemperature = ValueOfTemperature()
    
    static var previews: some View {
        Group {
            TemperatureField(unitType: .celsius,
                             valueOfTemperature: $valueOfTemperature)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
