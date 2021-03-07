import SwiftUI

struct WeightField: View {
    var unitType: WeightType
    @Binding var converterValue: ConverterValue
    @State private var editor: WeightEditor = WeightEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .kilogram:
                Text("Kilograms")
                createTextField(placeholder: "kg",
                                binding: $converterValue.weight.kilogram
                )
                .onChange(of: converterValue.weight.kilogram) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .gram:
                Text("Grams")
                createTextField(placeholder: "g",
                                binding: $converterValue.weight.gram
                )
                .onChange(of: converterValue.weight.gram) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .ounce:
                Text("Ounces")
                createTextField(placeholder: "ou",
                                binding: $converterValue.weight.ounce
                )
                .onChange(of: converterValue.weight.ounce) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .pound:
                Text("Pounds")
                createTextField(placeholder: "lb",
                                binding: $converterValue.weight.pound
                )
                .onChange(of: converterValue.weight.pound) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .stone:
                Text("Stones")
                createTextField(placeholder: "st",
                                binding: $converterValue.weight.stone
                )
                .onChange(of: converterValue.weight.stone) { (value) in
                    onUnitEdited(changedValue: value)
                }
            case .stone_pound:
                Text("Pounds")
                createTextField(placeholder: "lb",
                                binding: $converterValue.weight.stonePound
                )
                .onChange(of: converterValue.weight.stonePound) { (value) in
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
            )
            { isEditing in
                switch unitType{
                case .kilogram:
                    self.editor.kilogram = isEditing
                case .gram:
                    self.editor.gram = isEditing
                case .ounce:
                    self.editor.ounce = isEditing
                case .pound:
                    self.editor.pound = isEditing
                case .stone:
                    self.editor.stone = isEditing
                case .stone_pound:
                    self.editor.stonePound = isEditing
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
        let converter = WeightConverter(type: unitType)
        
        switch unitType {
        case .kilogram:
            if editor.kilogram {
                converterValue.weight.gram = converter.convert(value: changedValue, to: .gram)
                converterValue.weight.ounce = converter.convert(value: changedValue, to: .ounce)
                converterValue.weight.pound = converter.convert(value: changedValue, to: .pound)
                converterValue.weight.stone = converter.convert(value: changedValue, to: .stone)
                converterValue.weight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
            }
        case .gram:
            if editor.gram {
                converterValue.weight.kilogram = converter.convert(value: changedValue, to: .kilogram)
                converterValue.weight.ounce = converter.convert(value: changedValue, to: .ounce)
                converterValue.weight.pound = converter.convert(value: changedValue, to: .pound)
                converterValue.weight.stone = converter.convert(value: changedValue, to: .stone)
                converterValue.weight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
            }
        case .ounce:
            if editor.ounce {
                converterValue.weight.kilogram = converter.convert(value: changedValue, to: .kilogram)
                converterValue.weight.gram = converter.convert(value: changedValue, to: .gram)
                converterValue.weight.pound = converter.convert(value: changedValue, to: .pound)
                converterValue.weight.stone = converter.convert(value: changedValue, to: .stone)
                converterValue.weight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
            }
        case .pound:
            if editor.pound {
                converterValue.weight.kilogram = converter.convert(value: changedValue, to: .kilogram)
                converterValue.weight.gram = converter.convert(value: changedValue, to: .gram)
                converterValue.weight.ounce = converter.convert(value: changedValue, to: .ounce)
                converterValue.weight.stone = converter.convert(value: changedValue, to: .stone)
                converterValue.weight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
            }
        case .stone:
            if editor.stone {
                converterValue.weight.kilogram = converter.convert(value: changedValue, to: .kilogram)
                converterValue.weight.gram = converter.convert(value: changedValue, to: .gram)
                converterValue.weight.ounce = converter.convert(value: changedValue, to: .ounce)
                converterValue.weight.pound = converter.convert(value: changedValue, to: .pound)
                converterValue.weight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
            }
        case .stone_pound:
            if editor.stonePound {
                converterValue.weight.kilogram = converter.convert(value: changedValue, to: .kilogram)
                converterValue.weight.gram = converter.convert(value: changedValue, to: .gram)
                converterValue.weight.ounce = converter.convert(value: changedValue, to: .ounce)
                converterValue.weight.pound = converter.convert(value: changedValue, to: .pound)
                converterValue.weight.stone = converter.convert(value: changedValue, to: .stone)
            }
        }
    }
}

struct WeightField_Previews: PreviewProvider {
    @State static var converterValue = ConverterValue()
    
    static var previews: some View {
        Group {
            VStack {
                WeightField(unitType: WeightType.kilogram,
                            converterValue: $converterValue)
                WeightField(unitType: WeightType.gram,
                            converterValue: $converterValue)
            }
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 175))
    }
}
