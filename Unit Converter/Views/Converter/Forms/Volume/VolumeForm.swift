import SwiftUI

struct VolumeForm: View {
    @State private var valueOfVolume = ValueOfVolume()
    
    var body: some View {
        ScrollView {
            VStack() {
                VolumeField(unitType: .gallon, valueOfVolume: $valueOfVolume)
                VolumeField(unitType: .litre, valueOfVolume: $valueOfVolume)
                VolumeField(unitType: .pint, valueOfVolume: $valueOfVolume)
                VolumeField(unitType: .fluid_ounce, valueOfVolume: $valueOfVolume)
                VolumeField(unitType: .millilitre, valueOfVolume: $valueOfVolume)
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
