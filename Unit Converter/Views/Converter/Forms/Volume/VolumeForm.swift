import SwiftUI

struct VolumeForm: View {
    @State private var converterValue = ConverterValue()
    
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
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct VolumeForm_Previews: PreviewProvider {
    static var previews: some View {
        VolumeForm()
    }
}
