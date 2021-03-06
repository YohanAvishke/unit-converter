import SwiftUI

struct ConverterList: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: WeightView()) {
                    ConverterItem(converter: converters[0])
                }
                NavigationLink(destination: TemperatureView()) {
                    ConverterItem(converter: converters[1])
                }
                NavigationLink(destination: LengthView()) {
                    ConverterItem(converter: converters[2])
                }
                NavigationLink(destination: SpeedView()) {
                    ConverterItem(converter: converters[3])
                }
                NavigationLink(destination: VolumeView()) {
                    ConverterItem(converter: converters[4])
                }
            }
            .navigationTitle("Convert")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterList()
    }
}
