import SwiftUI

struct VolumeField: View {
    var unitType: VolumeType
    @Binding var valueOfVolume: ValueOfVolume
    @State private var editor: VolumeEditor = VolumeEditor()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            switch unitType {
            case .gallon:
                Text("Imperial Gallon")
                createTextField(placeholder: "gal",
                                binding: $valueOfVolume.gallon
                )
                .onChange(of: valueOfVolume.gallon) { value in
                    onUnitEdited(changedValue: value)
                }
            case .litre:
                Text("Litre")
                createTextField(placeholder: "l",
                                binding: $valueOfVolume.litre
                )
                .onChange(of: valueOfVolume.litre) { value in
                    onUnitEdited(changedValue: value)
                }
            case .pint:
                Text("Imperial Pint")
                createTextField(placeholder: "pt",
                                binding: $valueOfVolume.pint
                )
                .onChange(of: valueOfVolume.pint) { value in
                    onUnitEdited(changedValue: value)
                }
            case .fluid_ounce:
                Text("Fluid Ounce")
                createTextField(placeholder: "fl oz",
                                binding: $valueOfVolume.fluidOunce
                )
                .onChange(of: valueOfVolume.fluidOunce) { value in
                    onUnitEdited(changedValue: value)
                }
            case .millilitre:
                Text("Millilitre")
                createTextField(placeholder: "ml",
                                binding: $valueOfVolume.millilitre
                )
                .onChange(of: valueOfVolume.millilitre) { value in
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
                valueOfVolume.litre = converter.convert(value: changedValue, to: .litre)
                valueOfVolume.pint = converter.convert(value: changedValue, to: .pint)
                valueOfVolume.fluidOunce = converter.convert(value: changedValue, to: .fluid_ounce)
                valueOfVolume.millilitre = converter.convert(value: changedValue, to: .millilitre)
            }
        case .litre:
            if editor.litre{
                valueOfVolume.gallon = converter.convert(value: changedValue, to: .gallon)
                valueOfVolume.pint = converter.convert(value: changedValue, to: .pint)
                valueOfVolume.fluidOunce = converter.convert(value: changedValue, to: .fluid_ounce)
                valueOfVolume.millilitre = converter.convert(value: changedValue, to: .millilitre)
            }
        case .pint:
            if editor.pint{
                valueOfVolume.gallon = converter.convert(value: changedValue, to: .gallon)
                valueOfVolume.litre = converter.convert(value: changedValue, to: .litre)
                valueOfVolume.fluidOunce = converter.convert(value: changedValue, to: .fluid_ounce)
                valueOfVolume.millilitre = converter.convert(value: changedValue, to: .millilitre)
            }
        case .fluid_ounce:
            if editor.fludOunce{
                valueOfVolume.gallon = converter.convert(value: changedValue, to: .gallon)
                valueOfVolume.litre = converter.convert(value: changedValue, to: .litre)
                valueOfVolume.pint = converter.convert(value: changedValue, to: .pint)
                valueOfVolume.millilitre = converter.convert(value: changedValue, to: .millilitre)
            }
        case .millilitre:
            if editor.millilitre{
                valueOfVolume.gallon = converter.convert(value: changedValue, to: .gallon)
                valueOfVolume.litre = converter.convert(value: changedValue, to: .litre)
                valueOfVolume.pint = converter.convert(value: changedValue, to: .pint)
                valueOfVolume.fluidOunce = converter.convert(value: changedValue, to: .fluid_ounce)
            }
        }
    }
}

struct VolumeField_Previews: PreviewProvider {
    @State static var valueOfVolume = ValueOfVolume()
    
    static var previews: some View {
        Group {
            VolumeField(unitType: .gallon, valueOfVolume: $valueOfVolume)
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .previewLayout(.fixed(width: 400, height: 80))
    }
}
