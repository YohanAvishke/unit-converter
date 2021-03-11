import SwiftUI

struct DistanceField: View {
    var unitType: DistanceType
    @Binding var converterValue: ConverterValue
    @State private var editor: DistanceEditor = DistanceEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .mile:
                Text("Mile")
                createTextField(placeholder: "mi",
                                binding: $converterValue.distance.mile
                )
                .onChange(of: converterValue.distance.mile) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kilometre:
                Text("Kilometre")
                createTextField(placeholder: "km",
                                binding: $converterValue.distance.kilometre
                )
                .onChange(of: converterValue.distance.kilometre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .metre:
                Text("Metre")
                createTextField(placeholder: "m",
                                binding: $converterValue.distance.metre
                )
                .onChange(of: converterValue.distance.metre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .yard:
                Text("Yard")
                createTextField(placeholder: "yd",
                                binding: $converterValue.distance.yard
                )
                .onChange(of: converterValue.distance.yard) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .inch:
                Text("Inch")
                createTextField(placeholder: "in",
                                binding: $converterValue.distance.inch
                )
                .onChange(of: converterValue.distance.inch) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .centimetre:
                Text("Centimetre")
                createTextField(placeholder: "cm",
                                binding: $converterValue.distance.centimetre
                )
                .onChange(of: converterValue.distance.centimetre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .millimetre:
                Text("Millimetre")
                createTextField(placeholder: "mm",
                                binding: $converterValue.distance.millimetre
                )
                .onChange(of: converterValue.distance.millimetre) { (value) in
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
                case .mile:
                    self.editor.mile = isEditing
                case .kilometre:
                    self.editor.kilometre = isEditing
                case .metre:
                    self.editor.metre = isEditing
                case .yard:
                    self.editor.yard = isEditing
                case .inch:
                    self.editor.inch = isEditing
                case .centimetre:
                    self.editor.centimetre = isEditing
                case .millimetre:
                    self.editor.millimetre = isEditing
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
        let converter = DistanceConverter(type: unitType)
        
        switch unitType {
        case .mile:
            if editor.mile{
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .kilometre:
            if editor.kilometre{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .metre:
            if editor.metre{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .yard:
            if editor.yard{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .inch:
            if editor.inch{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
            }
        case .centimetre:
            if editor.centimetre{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.millimetre = converter.convert(value: changedValue,
                                                                       to: .millimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .millimetre:
            if editor.millimetre{
                converterValue.distance.mile = converter.convert(value: changedValue, to: .mile)
                converterValue.distance.kilometre = converter.convert(value: changedValue,
                                                                      to: .kilometre)
                converterValue.distance.metre = converter.convert(value: changedValue, to: .metre)
                converterValue.distance.centimetre = converter.convert(value: changedValue,
                                                                       to: .centimetre)
                converterValue.distance.yard = converter.convert(value: changedValue, to: .yard)
                converterValue.distance.inch = converter.convert(value: changedValue, to: .inch)
            }
        }
    }
}

struct DistanceField_Previews: PreviewProvider {
    @State static var converterValue = ConverterValue()
    
    static var previews: some View {
        Group {
            DistanceField(unitType: .mile, converterValue: $converterValue)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
