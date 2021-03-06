import SwiftUI

struct UnitView: View {
    @State var converterType: ConverterType
    
    var body: some View {
        switch converterType {
        case .weight:
            WeightView()
        case .temperature:
            TemperatureView()
        case .distance:
            LengthView()
        case .speed:
            SpeedView()
        case .volume:
            VolumeView()
        }
    }
}

struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(converterType: .weight)
    }
}
