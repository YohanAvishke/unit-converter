import SwiftUI

struct VolumeField: View {
    var unitType: VolumeType
    @Binding var converterValue: ConverterValue
    @State private var editor: VolumeEditor = VolumeEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .gallon:
                Text("Imperial Gallon")
                createTextField(placeholder: "gal",
                                binding: $converterValue.volume.gallon
                )
                .onChange(of: converterValue.volume.gallon) { value in
                    onUnitEdited(changedValue: value)
                }
            case .litre:
                Text("Litre")
                createTextField(placeholder: "l",
                                binding: $converterValue.volume.litre
                )
                .onChange(of: converterValue.volume.litre) { value in
                    onUnitEdited(changedValue: value)
                }
            case .pint:
                Text("Imperial Pint")
                createTextField(placeholder: "pt",
                                binding: $converterValue.volume.pint
                )
                .onChange(of: converterValue.volume.pint) { value in
                    onUnitEdited(changedValue: value)
                }
            case .fluid_ounce:
                Text("Fluid Ounce")
                createTextField(placeholder: "fl oz",
                                binding: $converterValue.volume.fluidOunce
                )
                .onChange(of: converterValue.volume.fluidOunce) { value in
                    onUnitEdited(changedValue: value)
                }
            case .millilitre:
                Text("Millilitre")
                createTextField(placeholder: "ml",
                                binding: $converterValue.volume.millilitre
                )
                .onChange(of: converterValue.volume.millilitre) { value in
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
                case .gallon:
                    self.editor.gallon = isEditing
                case .litre:
                    self.editor.litre = isEditing
                case .pint:
                    self.editor.pint = isEditing
                case .fluid_ounce:
                    self.editor.fludOunce = isEditing
                case .millilitre:
                    self.editor.millilitre = isEditing
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
        let converter = VolumeConverter(type: unitType)
        
        switch unitType {
        case .gallon:
            if editor.gallon{
                converterValue.volume.litre = converter.convert(value: changedValue, to: .litre)
                converterValue.volume.pint = converter.convert(value: changedValue, to: .pint)
                converterValue.volume.fluidOunce = converter.convert(value: changedValue,
                                                                     to: .fluid_ounce)
                converterValue.volume.millilitre = converter.convert(value: changedValue,
                                                                     to: .millilitre)
            }
        case .litre:
            if editor.litre{
                converterValue.volume.gallon = converter.convert(value: changedValue,
                                                                 to: .gallon)
                converterValue.volume.pint = converter.convert(value: changedValue,
                                                               to: .pint)
                converterValue.volume.fluidOunce = converter.convert(value: changedValue,
                                                                     to: .fluid_ounce)
                converterValue.volume.millilitre = converter.convert(value: changedValue,
                                                                     to: .millilitre)
            }
        case .pint:
            if editor.pint{
                converterValue.volume.gallon = converter.convert(value: changedValue,
                                                                 to: .gallon)
                converterValue.volume.litre = converter.convert(value: changedValue,
                                                                to: .litre)
                converterValue.volume.fluidOunce = converter.convert(value: changedValue,
                                                                     to: .fluid_ounce)
                converterValue.volume.millilitre = converter.convert(value: changedValue,
                                                                     to: .millilitre)
            }
        case .fluid_ounce:
            if editor.fludOunce{
                converterValue.volume.gallon = converter.convert(value: changedValue, to: .gallon)
                converterValue.volume.litre = converter.convert(value: changedValue, to: .litre)
                converterValue.volume.pint = converter.convert(value: changedValue, to: .pint)
                converterValue.volume.millilitre = converter.convert(value: changedValue,
                                                                     to: .millilitre)
            }
        case .millilitre:
            if editor.millilitre{
                converterValue.volume.gallon = converter.convert(value: changedValue, to: .gallon)
                converterValue.volume.litre = converter.convert(value: changedValue, to: .litre)
                converterValue.volume.pint = converter.convert(value: changedValue, to: .pint)
                converterValue.volume.fluidOunce = converter.convert(value: changedValue,
                                                                     to: .fluid_ounce)
            }
        }
    }
}

struct VolumeField_Previews: PreviewProvider {
    @State static var converterValue = ConverterValue()
    
    static var previews: some View {
        Group {
            VolumeField(unitType: .gallon, converterValue: $converterValue)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
