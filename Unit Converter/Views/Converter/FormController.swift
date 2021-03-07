import SwiftUI

struct FormController: View {
    @State var converterType: ConverterType
    
    var body: some View {
        switch converterType {
        case .weight:
            WeightForm()
        case .temperature:
            TemperatureForm()
        case .distance:
            DistanceForm()
        case .speed:
            SpeedForm()
        case .volume:
            VolumeView()
        }
    }
}

struct FormController_Previews: PreviewProvider {
    static var previews: some View {
        FormController(converterType: .weight)
    }
}
