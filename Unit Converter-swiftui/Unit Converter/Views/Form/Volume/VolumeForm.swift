import SwiftUI

struct VolumeForm: View {
    @State private var converterValue = ConverterValue()
    @Binding var history: [String]
    
    var body: some View {
        ScrollView {
            VStack() {
                VolumeField(unitType: .gallon, converterValue: $converterValue)
                VolumeField(unitType: .litre, converterValue: $converterValue)
                VolumeField(unitType: .pint, converterValue: $converterValue)
                VolumeField(unitType: .fluid_ounce,  converterValue: $converterValue)
                VolumeField(unitType: .millilitre, converterValue: $converterValue)
            }
            .padding(.top)
        }
        .navigationTitle("Volume")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(
                action: {
                    self.save()
                },
                label: {
                    Image("save(24x24)")
                }
            )
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func save() {
        let volumeValues = converterValue.volume
        let conversion = """
                         Gallon = \(volumeValues.gallon) Litre = \(volumeValues.litre)
                         Pint = \(volumeValues.pint) Fluid Ounce =  \(volumeValues.fluidOunce) \
                         Millilitre = \(volumeValues.millilitre)
                         """
        if history.count >= 5 {
            history = Array(history.suffix(4))
        }
        history.append(conversion)
    }
}

struct VolumeForm_Previews: PreviewProvider {
    static var previews: some View {
        VolumeForm(history: .constant(["String"]))
    }
}
