import SwiftUI

struct FormController: View {
    @State var converterType: ConverterType
    
    var body: some View {
        switch converterType {
        case .weight:
            WeightView()
        case .temperature:
            TemperatureView()
        case .distance:
            DistanceView()
        case .speed:
            SpeedView()
        case .volume:
            VolumeView()
        }
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        FormController(converterType: .weight)
    }
}
