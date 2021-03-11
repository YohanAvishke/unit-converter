import SwiftUI

struct TemperatureForm: View {
    @State private var converterValue = ConverterValue()
    @Binding var temperatureHistory: [String]
    
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
        let weightValues = converterValue.temperature
        let conversion = """
                         Celsius = \(weightValues.celsius) Fahrenheit = \(weightValues.fahrenheit) \
                         Kelvin = \(weightValues.kelvin)
                         """
        if temperatureHistory.count >= 5 {
            temperatureHistory = Array(temperatureHistory.suffix(4))
        }
        temperatureHistory.append(conversion)
    }
}

struct TemperatureForm_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureForm(temperatureHistory: .constant(["String"]))
    }
}
