import SwiftUI

struct TemperatureForm: View {
    @State private var converterValue = ConverterValue()
    
    var body: some View {
        ScrollView {
            VStack() {
                TemperatureField(unitType: .celsius, converterValue: $converterValue)
                TemperatureField(unitType: .fahrenheit, converterValue: $converterValue)
                TemperatureField(unitType: .kelvin, converterValue: $converterValue)
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
