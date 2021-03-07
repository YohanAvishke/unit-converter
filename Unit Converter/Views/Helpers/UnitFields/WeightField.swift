import SwiftUI

struct WeightField: View {
    var unitType: WeightType
    @State private var editor: WeightEditor = WeightEditor()
    @Binding var valueOfWeight: ValueOfWeight
    
    func createTextField(placeholder: String, binding: Binding<String>) -> AnyView {
        return AnyView(
            TextField (
                placeholder,
                text: binding
            ) { isEditing in
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
            .keyboardType(.numberPad)
            .padding(.all)
            .background(Color.white)
            .cornerRadius(10)
        )
    }
    
    func onUnitEdited(changedValue: String){
        var converter = WeightConverter(type: unitType)
        
        switch unitType {
        case .kilogram:
            valueOfWeight.gram = converter.convert(value: changedValue, to: .gram)
            valueOfWeight.ounce = converter.convert(value: changedValue, to: .ounce)
            valueOfWeight.pound = converter.convert(value: changedValue, to: .pound)
            valueOfWeight.stone = converter.convert(value: changedValue, to: .stone)
            valueOfWeight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
        case .gram:
            converter.type = unitType
            valueOfWeight.kilogram = converter.convert(value: changedValue, to: .kilogram)
            valueOfWeight.ounce = converter.convert(value: changedValue, to: .ounce)
            valueOfWeight.pound = converter.convert(value: changedValue, to: .pound)
            valueOfWeight.stone = converter.convert(value: changedValue, to: .stone)
            valueOfWeight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
        case .ounce:
            converter.type = unitType
            valueOfWeight.kilogram = converter.convert(value: changedValue, to: .kilogram)
            valueOfWeight.gram = converter.convert(value: changedValue, to: .gram)
            valueOfWeight.pound = converter.convert(value: changedValue, to: .pound)
            valueOfWeight.stone = converter.convert(value: changedValue, to: .stone)
            valueOfWeight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
        case .pound:
            converter.type = unitType
            valueOfWeight.kilogram = converter.convert(value: changedValue, to: .kilogram)
            valueOfWeight.gram = converter.convert(value: changedValue, to: .gram)
            valueOfWeight.ounce = converter.convert(value: changedValue, to: .ounce)
            valueOfWeight.stone = converter.convert(value: changedValue, to: .stone)
            valueOfWeight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
        case .stone:
            converter.type = unitType
            valueOfWeight.kilogram = converter.convert(value: changedValue, to: .kilogram)
            valueOfWeight.gram = converter.convert(value: changedValue, to: .gram)
            valueOfWeight.ounce = converter.convert(value: changedValue, to: .ounce)
            valueOfWeight.pound = converter.convert(value: changedValue, to: .pound)
            valueOfWeight.stonePound = converter.convert(value: changedValue, to: .stone_pound)
        case .stone_pound:
            converter.type = unitType
            valueOfWeight.kilogram = converter.convert(value: changedValue, to: .kilogram)
            valueOfWeight.gram = converter.convert(value: changedValue, to: .gram)
            valueOfWeight.ounce = converter.convert(value: changedValue, to: .ounce)
            valueOfWeight.pound = converter.convert(value: changedValue, to: .pound)
            valueOfWeight.stone = converter.convert(value: changedValue, to: .stone)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            
            switch unitType {
            case .kilogram:
                Text("Kilograms")
                createTextField(placeholder: "kg",
                                binding: $valueOfWeight.kilogram
                )
                .onChange(of: valueOfWeight.kilogram) { (value) in
                    if editor.kilogram {
                        onUnitEdited(changedValue: value)
                    }
                }
            case .gram:
                Text("Grams")
                createTextField(placeholder: "g",
                                binding: $valueOfWeight.gram
                )
                .onChange(of: valueOfWeight.gram) { (value) in
                    if editor.gram {
                        onUnitEdited(changedValue: value)
                    }
                }
            case .ounce:
                Text("Ounces")
                createTextField(placeholder: "ou",
                                binding: $valueOfWeight.ounce
                )
                .onChange(of: valueOfWeight.ounce) { (value) in
                    if editor.ounce {
                        onUnitEdited(changedValue: value)
                    }
                }
            case .pound:
                Text("Pounds")
                createTextField(placeholder: "lb",
                                binding: $valueOfWeight.pound
                )
                .onChange(of: valueOfWeight.pound) { (value) in
                    if editor.pound {
                        onUnitEdited(changedValue: value)
                    }
                }
            case .stone:
                Text("Stones")
                createTextField(placeholder: "st",
                                binding: $valueOfWeight.stone
                )
                .onChange(of: valueOfWeight.stone) { (value) in
                    if editor.stone {
                        onUnitEdited(changedValue: value)
                    }
                }
            case .stone_pound:
                Text("Pounds")
                createTextField(placeholder: "lb",
                                binding: $valueOfWeight.stonePound
                )
                .onChange(of: valueOfWeight.stonePound) { (value) in
                    if editor.stonePound {
                        onUnitEdited(changedValue: value)
                    }
                }
            }
        }
        .padding(.horizontal, 15)
    }
}

struct WeightField_Previews: PreviewProvider {
    @State static var valueOfWeight = ValueOfWeight()
    
    static var previews: some View {
        Group {
            VStack {
                WeightField(unitType: WeightType.kilogram,
                            valueOfWeight: $valueOfWeight)
                WeightField(unitType: WeightType.gram,
                            valueOfWeight: $valueOfWeight)
            }
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 175))
    }
}
