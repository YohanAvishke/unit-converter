import SwiftUI

// TODO calearing doesn't work as expected
struct TemperatureField: View {
    var unitType: TemperatureType
    @Binding var converterValue: ConverterValue
    @State private var editor: TemperatureEditor = TemperatureEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .celsius:
                Text("Celsius")
                createTextField(placeholder: "°C",
                                binding: $converterValue.temperature.celsius
                )
                .onChange(of: converterValue.temperature.celsius) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .fahrenheit:
                Text("Fahrenheit")
                createTextField(placeholder: "°F",
                                binding: $converterValue.temperature.fahrenheit
                )
                .onChange(of: converterValue.temperature.fahrenheit) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kelvin:
                Text("Kelvin")
                createTextField(placeholder: "K",
                                binding: $converterValue.temperature.kelvin
                )
                .onChange(of: converterValue.temperature.kelvin) { (value) in
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
            .modifier(ClearButton(converterValue: $converterValue))
            .multilineTextAlignment(.leading)
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
                converterValue.temperature.fahrenheit = converter.convert(value: changedValue,
                                                                          to: .fahrenheit)
                converterValue.temperature.kelvin = converter.convert(value: changedValue,
                                                                      to: .kelvin)
            }
        case .fahrenheit:
            if editor.fahrenheit{
                converterValue.temperature.celsius = converter.convert(value: changedValue,
                                                                       to: .celsius)
                converterValue.temperature.kelvin = converter.convert(value: changedValue,
                                                                      to: .kelvin)
            }
        case .kelvin:
            if editor.kelvin{
                converterValue.temperature.celsius = converter.convert(value: changedValue,
                                                                       to: .celsius)
                converterValue.temperature.fahrenheit = converter.convert(value: changedValue,
                                                                           to: .fahrenheit)
            }
        }
    }
}

struct TemperatureField_Previews: PreviewProvider {
    @State static var converterValue = ConverterValue()
    
    static var previews: some View {
        Group {
            TemperatureField(unitType: .celsius, converterValue: $converterValue)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
