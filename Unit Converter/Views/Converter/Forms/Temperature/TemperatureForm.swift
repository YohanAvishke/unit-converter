import SwiftUI

struct TemperatureForm: View {
    @State private var valueOfTemperature = ValueOfTemperature()
    
    var body: some View {
        ScrollView {
            VStack() {
                TemperatureField(unitType: .celsius,
                                 valueOfTemperature: self.$valueOfTemperature)
                TemperatureField(unitType: .fahrenheit,
                                 valueOfTemperature: self.$valueOfTemperature)
                TemperatureField(unitType: .kelvin,
                                 valueOfTemperature: self.$valueOfTemperature)
            }
            .padding(.top)
        }
        .navigationTitle("Temperature")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct TemperatureForm_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureForm()
    }
}
