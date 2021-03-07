import SwiftUI

struct DistanceForm: View {
    @State private var converterValue = ConverterValue()
    
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

struct DistanceForm_Previews: PreviewProvider {
    static var previews: some View {
        DistanceForm()
    }
}
