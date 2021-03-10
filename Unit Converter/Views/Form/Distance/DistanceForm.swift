import SwiftUI

struct DistanceForm: View {
    @State private var converterValue = ConverterValue()
    @Binding var history: [String]
    
    var body: some View {
        ScrollView {
            VStack() {
                DistanceField(unitType: .mile, converterValue: $converterValue)
                DistanceField(unitType: .kilometre, converterValue: $converterValue)
                DistanceField(unitType: .metre, converterValue: $converterValue)
                DistanceField(unitType: .yard, converterValue: $converterValue)
                DistanceField(unitType: .inch, converterValue: $converterValue)
                DistanceField(unitType: .centimetre, converterValue: $converterValue)
                DistanceField(unitType: .millimetre, converterValue: $converterValue)
            }
            .padding(.top)
        }
        .navigationTitle("Distance")
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
        let distanceValues = converterValue.distance
        let conversion = """
                         Mile = \(distanceValues.mile) Kilometer = \(distanceValues.kilometre) \
                         Metre = \(distanceValues.metre) Yard =  \(distanceValues.yard) \
                         Inch = \(distanceValues.inch) Centimetre = \(distanceValues.centimetre) \
                         Millimetre = \(distanceValues.millimetre)
                         """
        if history.count >= 5 {
            history = Array(history.suffix(4))
        }
        history.append(conversion)
    }
}

struct DistanceForm_Previews: PreviewProvider {
    static var previews: some View {
        DistanceForm(history: .constant(["String"]))
    }
}
