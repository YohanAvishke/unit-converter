import SwiftUI

struct FormController: View {
    @EnvironmentObject var history: History
    var converterType: ConverterType
    
    var body: some View {
        switch converterType {
        case .weight:
            WeightForm(history: $history.weight)
        case .temperature:
            TemperatureForm(temperatureHistory: $history.temperature)
        case .distance:
            DistanceForm(history: $history.distance)
        case .speed:
            SpeedForm()
        case .volume:
            VolumeForm()
        }
    }
}

struct FormController_Previews: PreviewProvider {
    static var previews: some View {
        FormController(converterType: .weight)
            .environmentObject(History())
    }
}
