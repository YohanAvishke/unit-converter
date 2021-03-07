import SwiftUI

struct DistanceField: View {
    var unitType: DistanceType
    @Binding var valueOfDistance: ValueOfDistance
    @State private var editor: DistanceEditor = DistanceEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .mile:
                Text("Mile")
                createTextField(placeholder: "mi",
                                binding: $valueOfDistance.mile
                )
                .onChange(of: valueOfDistance.mile) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .kilometre:
                Text("Kilometre")
                createTextField(placeholder: "km",
                                binding: $valueOfDistance.kilometre
                )
                .onChange(of: valueOfDistance.kilometre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .metre:
                Text("Metre")
                createTextField(placeholder: "m",
                                binding: $valueOfDistance.metre
                )
                .onChange(of: valueOfDistance.metre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .yard:
                Text("Yard")
                createTextField(placeholder: "yd",
                                binding: $valueOfDistance.yard
                )
                .onChange(of: valueOfDistance.yard) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .inch:
                Text("Inch")
                createTextField(placeholder: "in",
                                binding: $valueOfDistance.inch
                )
                .onChange(of: valueOfDistance.inch) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .centimetre:
                Text("Centimetre")
                createTextField(placeholder: "cm",
                                binding: $valueOfDistance.centimetre
                )
                .onChange(of: valueOfDistance.centimetre) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .millimetre:
                Text("Millimetre")
                createTextField(placeholder: "mm",
                                binding: $valueOfDistance.millimetre
                )
                .onChange(of: valueOfDistance.millimetre) { (value) in
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
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .kilometre:
            if editor.kilometre{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .metre:
            if editor.metre{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .yard:
            if editor.yard{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .inch:
            if editor.inch{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
            }
        case .centimetre:
            if editor.centimetre{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.millimetre = converter.convert(value: changedValue, to: .millimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        case .millimetre:
            if editor.millimetre{
                valueOfDistance.mile = converter.convert(value: changedValue, to: .mile)
                valueOfDistance.kilometre = converter.convert(value: changedValue, to: .kilometre)
                valueOfDistance.metre = converter.convert(value: changedValue, to: .metre)
                valueOfDistance.centimetre = converter.convert(value: changedValue, to: .centimetre)
                valueOfDistance.yard = converter.convert(value: changedValue, to: .yard)
                valueOfDistance.inch = converter.convert(value: changedValue, to: .inch)
            }
        }
    }
}

struct DistanceField_Previews: PreviewProvider {
    @State static var valueOfDistance = ValueOfDistance()
    
    static var previews: some View {
        Group {
            DistanceField(unitType: .mile,
                          valueOfDistance: $valueOfDistance)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
