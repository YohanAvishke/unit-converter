import SwiftUI

struct DistanceForm: View {
    @State private var valueOfDistance = ValueOfDistance()
    
    var body: some View {
        ScrollView {
            VStack() {
                DistanceField(unitType: .mile,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .kilometre,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .metre,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .yard,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .inch,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .centimetre,
                              valueOfDistance: self.$valueOfDistance)
                DistanceField(unitType: .millimetre,
                              valueOfDistance: self.$valueOfDistance)
            }
            .padding(.top)
        }
        .navigationTitle("Distance")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DistanceForm_Previews: PreviewProvider {
    static var previews: some View {
        DistanceForm()
    }
}
