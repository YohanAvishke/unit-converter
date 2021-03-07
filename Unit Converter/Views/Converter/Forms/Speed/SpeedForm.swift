import SwiftUI

struct SpeedForm: View {
    @State private var converterValue = ConverterValue()
    
    var body: some View {
        ScrollView {
            VStack() {
                SpeedField(unitType: .metres_sec, converterValue: $converterValue)
                SpeedField(unitType: .knot, converterValue: $converterValue)
                SpeedField(unitType: .miles_hour, converterValue: $converterValue)
                SpeedField(unitType: .kilometres_hour, converterValue: $converterValue)
            }
            .padding(.top)
        }
        .navigationTitle("Speed")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(
                action: {
                    print("Saved")
                },
                label: {
                    Image(systemName: "heart")
                }
            )
        }
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SpeedForm_Previews: PreviewProvider {
    static var previews: some View {
        SpeedForm()
    }
}
