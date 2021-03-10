import SwiftUI

struct SpeedForm: View {
    @State private var converterValue = ConverterValue()
    @Binding var history: [String]
    
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
        let speedValues = converterValue.speed
        let conversion = """
                         Metres per Sec = \(speedValues.metresPerSecond) \
                         Knot = \(speedValues.knot) Miles per Hour = \(speedValues.milesPerHour) \
                         Kilometres per Hour =  \(speedValues.kilometresPerHour)
                         """
        if history.count >= 5 {
            history = Array(history.suffix(4))
        }
        history.append(conversion)
    }
}

struct SpeedForm_Previews: PreviewProvider {
    static var previews: some View {
        SpeedForm(history: .constant(["String"]))
    }
}
