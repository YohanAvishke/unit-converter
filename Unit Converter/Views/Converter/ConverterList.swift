import SwiftUI

struct ConverterList: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: WeightView()) {
                    ConverterItem(category: categories[0])
                }
                NavigationLink(destination: TemperatureView()) {
                    ConverterItem(category: categories[1])
                }
                NavigationLink(destination: LengthView()) {
                    ConverterItem(category: categories[2])
                }
                NavigationLink(destination: SpeedView()) {
                    ConverterItem(category: categories[3])
                }
                NavigationLink(destination: VolumeView()) {
                    ConverterItem(category: categories[4])
                }
            }
            .navigationTitle("Conversions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterList()
    }
}
