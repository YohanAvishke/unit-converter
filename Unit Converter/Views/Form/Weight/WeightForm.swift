import SwiftUI

struct WeightForm: View {
    @State private var converterValue = ConverterValue()
    @Binding var weightHistory: [String]
    
    var body: some View {
        ScrollView {
            VStack {
                WeightField(unitType: .kilogram, converterValue: $converterValue)
                WeightField(unitType: .gram, converterValue: $converterValue)
                WeightField(unitType: .ounce, converterValue: $converterValue)
                WeightField(unitType: .pound, converterValue: $converterValue)
                HStack {
                    WeightField(unitType: .stone, converterValue: $converterValue)
                    WeightField(unitType: .stone_pound, converterValue: $converterValue)
                }
            }
            .padding(.top)
        }
        .navigationTitle("Weight")
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
        let weightValues = converterValue.weight
        let conversion = """
                         kilogram = \(weightValues.kilogram) gram = \(weightValues.gram) \
                         ounz = \(weightValues.ounce) ponds =  \(weightValues.pound) \
                         stones = \(weightValues.stone)  & pounds = \(weightValues.stonePound)
                         """
        if weightHistory.count >= 5 {
            weightHistory = Array(weightHistory.suffix(4))
        }
        weightHistory.append(conversion)
    }
}

struct WeightForm_Previews: PreviewProvider {
    static var previews: some View {
        WeightForm(weightHistory: .constant(["String"]))
    }
}
