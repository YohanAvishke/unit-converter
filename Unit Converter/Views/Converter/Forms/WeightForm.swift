import SwiftUI

struct WeightForm: View {
    @State private var valueOfWeight = ValueOfWeight()
    
    var body: some View {
        ScrollView {
            VStack {
                WeightField(unitType: .kilogram, valueOfWeight: self.$valueOfWeight)
                WeightField(unitType: .gram, valueOfWeight: self.$valueOfWeight)
                WeightField(unitType: .ounce, valueOfWeight: self.$valueOfWeight)
                WeightField(unitType: .pound, valueOfWeight: self.$valueOfWeight)
                HStack {
                    WeightField(unitType: .stone, valueOfWeight: self.$valueOfWeight)
                    WeightField(unitType: .stone_pound, valueOfWeight: self.$valueOfWeight)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Weight")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 242/255, green: 242/255, blue: 247/255))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct WeightForm_Previews: PreviewProvider {
    static var previews: some View {
        WeightForm()
    }
}
